import 'package:flutter/cupertino.dart';
import 'package:members_lists/chat.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.black,
      navigationBar: CupertinoNavigationBar(
        backgroundColor: CupertinoColors.black,
        border: null,
        middle: const Text(
          "InstaTalk",
          style: TextStyle(fontWeight: FontWeight.bold, color: CupertinoColors.white),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            CupertinoButton(
              padding: EdgeInsets.zero,
              child: const Icon(CupertinoIcons.heart, size: 25, color: CupertinoColors.white),
              onPressed: () {
                // Handle heart button press
              },
            ),
            CupertinoButton(
              padding: EdgeInsets.zero,
              child: const Icon(CupertinoIcons.chat_bubble_2, size: 25, color: CupertinoColors.white),
              onPressed: () {
                // Navigate to messages
                Navigator.push(
                  context,
                  CupertinoPageRoute(builder: (context) => Chat()),
                );
              },
            ),
          ],
        ),
      ),

      child: SafeArea(
        child: Column(
          children: [
            // Stories Section
            Padding(
              padding: const EdgeInsets.only(top: 20.0), // Adjust the value as needed
              child: SizedBox(
                height: 100,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  children: [
                    _buildStory("Your Story", "images/gfnisir.jpg", true),
                    _buildStory("Christian", "images/ChristianCaparra.jpg"),
                    _buildStory("Jhuniel", "images/Jhuniel.jpg"),
                    _buildStory("John Lloyd", "images/JL.jpg"),
                    _buildStory("Michael", "images/mike.jpg"),
                    _buildStory("Samuel", "images/mike.jpg"),

                  ],
                ),
              ),
            ),
            // Post Section
            Expanded(
              child: ListView(
                children: [
                  _buildPost("Christian Caparra", "images/ChristianCaparra.jpg", "images/ChristianCaparra.jpg", "9,234 likes", "Enjoying the day!"),
                  _buildPost("John Lloyd Guevarra", "images/JL.jpg", "images/JL.jpg", "2,345 likes", "Beautiful sunset!"),
                  _buildPost("Michael De Ramos", "images/mike.jpg", "images/mike.jpg", "3,456 likes", "Weekend vibes!"),
                  _buildPost("Jhuniel Galang", "images/Jhuniel.jpg", "images/Jhuniel.jpg", "4,567 likes", "Good times!"),
                  _buildPost("Samuel Miranda", "images/Jhuniel.jpg", "images/Jhuniel.jpg", "4,827 likes", "Good Dayc!"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStory(String name, String imagePath, [bool isYourStory = false]) {
    return GestureDetector(
      onTap: () => _showStoryDialog(context, name),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: CupertinoColors.activeBlue, width: 2),
                  ),
                  child: ClipOval(
                    child: Image.asset(
                      imagePath,
                      height: 75,
                      width: 75,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                if (isYourStory)
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      decoration: BoxDecoration(
                        color: CupertinoColors.activeBlue,
                        shape: BoxShape.circle,
                        border: Border.all(color: CupertinoColors.activeBlue, width: 2),
                      ),
                      child: const Icon(
                        CupertinoIcons.add,
                        color: CupertinoColors.white,
                        size: 20,
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 5),
            Text(
              name,
              style: const TextStyle(fontSize: 12, color: CupertinoColors.white),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPost(String username, String profileImage, String postImage, String likes, String caption) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              ClipOval(
                child: Image.asset(
                  profileImage,
                  height: 40,
                  width: 40,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 10),
              Text(
                username,
                style: const TextStyle(fontWeight: FontWeight.bold, color: CupertinoColors.white),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 400,
          child: Image.asset(
            postImage,
            fit: BoxFit.cover,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              CupertinoButton(
                padding: EdgeInsets.zero,
                child: const Icon(CupertinoIcons.heart, color: CupertinoColors.white),
                onPressed: () {},
              ),
              CupertinoButton(
                padding: EdgeInsets.zero,
                child: const Icon(CupertinoIcons.chat_bubble, color: CupertinoColors.white),
                onPressed: () {},
              ),
              CupertinoButton(
                padding: EdgeInsets.zero,
                child: const Icon(CupertinoIcons.paperplane, color: CupertinoColors.white),
                onPressed: () {},
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            likes,
            style: const TextStyle(fontWeight: FontWeight.bold, color: CupertinoColors.white),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            caption,
            style: const TextStyle(color: CupertinoColors.white),
          ),
        ),
      ],
    );
  }

  void _showStoryDialog(BuildContext context, String name) {
    final storyImages = {
      "Christian": "images/ChristianCaparra.jpg",
      "Jhuniel": "images/Jhuniel.jpg",
      "John Lloyd": "images/JL.jpg",
      "Michael": "images/mike.jpg",
      "Samuel": "images/mike.jpg",
      "Your Story": "images/gfnisir.jpg",
    };

    final storyImage = storyImages[name] ?? "images/default_story.jpg";

    showCupertinoDialog(
      context: context,
      builder: (context) {
        return CupertinoPageScaffold(
          backgroundColor: CupertinoColors.black,
          child: Stack(
            children: [
              Positioned.fill(
                child: Image.asset(
                  storyImage,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 35,
                right: 20,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: CupertinoColors.black,
                    ),
                    padding: const EdgeInsets.all(8),
                    child: const Icon(
                      CupertinoIcons.xmark,
                      color: CupertinoColors.white,
                      size: 24,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}