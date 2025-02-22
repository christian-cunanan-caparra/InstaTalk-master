import 'package:flutter/cupertino.dart';
import 'package:members_lists/chat.dart';
import 'package:members_lists/main.dart';
import 'package:members_lists/notifications_page.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  // List of members
  final List<Map<String, String>> members = [
    {"name": "Christian", "image": "images/ChristianCaparra.jpg"},
    {"name": "Jhuniel", "image": "images/dpjhuniel.jpg"},
    {"name": "John Lloyd", "image": "images/JL1.jpg"},
    {"name": "Michael", "image": "images/mike.jpg"},
    {"name": "Samuel", "image": "images/sam.jpg"},
  ];

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.black,
      navigationBar: CupertinoNavigationBar(
        backgroundColor: CupertinoColors.black,
        border: null,
        leading: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: const Text(
            "InstaTalk",
            style: TextStyle(fontWeight: FontWeight.bold, color: CupertinoColors.white),
          ),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            CupertinoButton(
              padding: EdgeInsets.zero,
              child: const Icon(CupertinoIcons.heart, size: 25, color: CupertinoColors.white),
              onPressed: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(builder: (context) => const NotificationsPage()),
                );
              },
            ),
            CupertinoButton(
              padding: EdgeInsets.zero,
              child: const Icon(CupertinoIcons.paperplane, size: 25, color: CupertinoColors.white),
              onPressed: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(builder: (context) => Chat()),
                );
              },
            ),
            // Dropdown Button
            CupertinoButton(
              padding: EdgeInsets.zero,
              child: const Icon(CupertinoIcons.ellipsis_vertical, size: 25, color: CupertinoColors.white),
              onPressed: () {
                _showMembersDropdown(context);
              },
            ),
          ],
        ),
      ),
      child: SafeArea(
        child: Column(
          children: [
            // Stories
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: SizedBox(
                height: 100,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  children: [
                    _buildStory("Your Story", "images/gfnisir.jpg", true),
                    _buildStory("Christian", "images/ChristianCaparra.jpg"),
                    _buildStory("Jhuniel", "images/dpjhuniel.jpg"),
                    _buildStory("John Lloyd", "images/JL1.jpg"),
                    _buildStory("Michael", "images/mike.jpg"),
                    _buildStory("Samuel", "images/sam.jpg"),
                  ],
                ),
              ),
            ),
            // Post Section
            Expanded(
              child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: _buildPost(
                      "Christian Caparra",
                      "images/ChristianCaparra.jpg",
                      "images/1.jpg",
                      "20,234 likes",
                      "Hi Hehehe",
                    ),
                  ),
                  _buildPost(
                    "John Lloyd Guevarra",
                    "images/JL1.jpg",
                    "images/jl3.jpg",
                    "2,345 likes",
                    "0.5 muna bago 5.0",
                  ),
                  _buildPost(
                    "John Lloyd Guevarra",
                    "images/JL1.jpg",
                    "images/jl4.jpg",
                    "9,345 likes",
                    "with mga idols 🔥",
                  ),
                  _buildPost(
                    "Michael De Ramos",
                    "images/mike.jpg",
                    "images/kape.jpg",
                    "3,456 likes",
                    "kape pa!",
                  ),
                  _buildPost(
                    "Jhuniel Galang",
                    "images/dpjhuniel.jpg",
                    "images/random1.jpg",
                    "4,567 likes",
                    "Seminar feb 21, 2025",
                  ),
                  _buildPost(
                    "Jhuniel Galang",
                    "images/dpjhuniel.jpg",
                    "images/random2.jpg",
                    "4,567 likes",
                    "Got Phoebe and her sig weap",
                  ),
                  _buildPost(
                    "Samuel Miranda",
                    "images/sam.jpg",
                    "images/sam.jpg",
                    "4,827 likes",
                    "hello!",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Build Story Widget
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

  // Build Post Widget
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
          width: double.infinity,
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

  // Show Story Dialog
  void _showStoryDialog(BuildContext context, String name) {
    final storyImages = {
      "Christian": "images/ChristianCaparra.jpg",
      "Jhuniel": "images/random4.jpg",
      "John Lloyd": "images/jl2.jpg",
      "Michael": "images/samgy.jpg",
      "Samuel": "images/sam.jpg",
      "Your Story": "images/gfnisir.jpg",
    };

    final storyImage = storyImages[name] ?? "images/default_story.jpg";

    showCupertinoDialog(
      context: context,
      barrierDismissible: false, // Prevents closing on tap outside
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

  // Show Members Dropdown
  void _showMembersDropdown(BuildContext context) {
    showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) {
        return CupertinoActionSheet(
          title: const Text('Members'),
          message: const Text('Select a member to view details'),
          actions: [
            ...members.map((member) {
              return CupertinoActionSheetAction(
                onPressed: () {
                  Navigator.pop(context);
                  _showMemberDetails(context, member);
                },
                child: Row(
                  children: [
                    ClipOval(
                      child: Image.asset(
                        member["image"]!,
                        width: 40,
                        height: 40,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      member["name"]!,
                      style: const TextStyle(color: CupertinoColors.white),
                    ),
                  ],
                ),
              );
            }), // <-- Removed .toList()
            CupertinoActionSheetAction(
              onPressed: () {
                Navigator.pop(context);
                _showLogoutDialog(context);
              },
              child: const Text(
                'Log Out',
                style: TextStyle(color: CupertinoColors.destructiveRed),
              ),
            ),
          ],
          cancelButton: CupertinoActionSheetAction(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Cancel', style: TextStyle(color: CupertinoColors.white)),
          ),
        );
      },
    );
  }

  // Show Member Details (Non-clickable)
  void _showMemberDetails(BuildContext context, Map<String, String> member) {
    showCupertinoDialog(
      context: context,
      barrierDismissible: false, // Prevents closing on tap outside
      builder: (context) {
        return CupertinoAlertDialog(
          title: Text(member["name"]!),
          content: Column(
            children: [
              Image.asset(
                member["image"]!,
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 10),
              Text("This is ${member["name"]}'s profile."),
            ],
          ),
          actions: [
            CupertinoDialogAction(
              child: const Text("Close"),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  // Show Logout Dialog
  void _showLogoutDialog(BuildContext context) {
    showCupertinoDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: const Text("Log Out"),
          content: const Text("Are you sure you want to sign out?"),
          actions: [
            CupertinoDialogAction(
              child: const Text("Cancel"),
              onPressed: () {
                Navigator.pop(context); // Close the dialog
              },
            ),
            CupertinoDialogAction(
              child: const Text("Yes", style: TextStyle(color: CupertinoColors.destructiveRed),),
              onPressed: () {
                Navigator.pop(context); // Close the dialog
                Navigator.pushReplacement(
                  context,
                  CupertinoPageRoute(builder: (context) => MyApp()), // Navigate to MyApp
                );
              },
            ),
          ],
        );
      },
    );
  }
}