import 'package:flutter/cupertino.dart';

import 'christian_chat_page.dart';
import 'jhuniel_chat_page.dart';

class Chat extends StatefulWidget {
  const Chat({super.key});

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  final TextEditingController _searchController = TextEditingController();
  List<Map<String, String>> filteredParticipants = List.from(participants);

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_filterParticipants);
  }

  @override
  void dispose() {
    _searchController.removeListener(_filterParticipants);
    _searchController.dispose();
    super.dispose();
  }

  void _filterParticipants() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      filteredParticipants = participants.where((participant) {
        final name = participant["name"]!.toLowerCase();
        return name.contains(query);
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.black,
      navigationBar: CupertinoNavigationBar(
        middle: const Text(
          "RonnieSngl",
          style: TextStyle(fontWeight: FontWeight.bold, color: CupertinoColors.white),
        ),
      ),
      child: SafeArea(
        child: Column(
          children: [
            // Search
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: CupertinoSearchTextField(
                controller: _searchController,
                placeholder: "Search",
                style: const TextStyle(color: CupertinoColors.white),
                onChanged: (value) {
                  _filterParticipants();
                },
              ),
            ),
            const SizedBox(height: 10),

            // Story Section
            SizedBox(
              height: 100,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                children: [
                  GestureDetector(
                    onTap: () => _showStoryDialog(context, "Your Story", "images/gfnisir.jpg"),
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
                                    "images/gfnisir.jpg",
                                    height: 75,
                                    width: 75,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
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
                          const Text(
                            "Your Story",
                            style: TextStyle(fontSize: 12, color: CupertinoColors.white),
                          ),
                        ],
                      ),
                    ),
                  ),


                  GestureDetector(
                    onTap: () => _showStoryDialog(context, "Christian", "images/ChristianCaparra.jpg"),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: CupertinoColors.activeBlue, width: 2),
                            ),
                            child: ClipOval(
                              child: Image.asset(
                                "images/ChristianCaparra.jpg",
                                height: 75,
                                width: 75,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(height: 5),
                          const Text(
                            "Christian",
                            style: TextStyle(fontSize: 12, color: CupertinoColors.white),
                          ),
                        ],
                      ),
                    ),
                  ),





                  GestureDetector(
                    onTap: () => _showStoryDialog(context, "Jhuniel", "images/Jhuniel.jpg"),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: CupertinoColors.activeBlue, width: 2),
                            ),
                            child: ClipOval(
                              child: Image.asset(
                                "images/Jhuniel.jpg",
                                height: 75,
                                width: 75,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(height: 5),
                          const Text(
                            "Jhuniel",
                            style: TextStyle(fontSize: 12, color: CupertinoColors.white),
                          ),
                        ],
                      ),
                    ),
                  ),






                  GestureDetector(
                    onTap: () => _showStoryDialog(context, "John Lloyd", "images/JL.jpg"),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: CupertinoColors.activeBlue, width: 2),
                            ),
                            child: ClipOval(
                              child: Image.asset(
                                "images/JL.jpg",
                                height: 75,
                                width: 75,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(height: 5),
                          const Text(
                            "John Lloyd",
                            style: TextStyle(fontSize: 12, color: CupertinoColors.white),
                          ),
                        ],
                      ),
                    ),
                  ),







                  GestureDetector(
                    onTap: () => _showStoryDialog(context, "Michael", "images/mike.jpg"),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: CupertinoColors.activeBlue, width: 2),
                            ),
                            child: ClipOval(
                              child: Image.asset(
                                "images/mike.jpg",
                                height: 75,
                                width: 75,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(height: 5),
                          const Text(
                            "Michael",
                            style: TextStyle(fontSize: 12, color: CupertinoColors.white),
                          ),
                        ],
                      ),
                    ),
                  ),








                  GestureDetector(
                    onTap: () => _showStoryDialog(context, "Samuel Miranda", "images/JL.jpg"),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: CupertinoColors.activeBlue, width: 2),
                            ),
                            child: ClipOval(
                              child: Image.asset(
                                "images/JL.jpg",
                                height: 75,
                                width: 75,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(height: 5),
                          const Text(
                            "Samuel Miranda",
                            style: TextStyle(fontSize: 12, color: CupertinoColors.white),
                          ),
                        ],
                      ),
                    ),
                  ),





                ],
              ),
            ),

            const SizedBox(height: 10),

            // Contact List
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                itemCount: filteredParticipants.length,
                itemBuilder: (context, index) {
                  var participant = filteredParticipants[index];

                  return GestureDetector(
                    onTap: () {
                      if (participant["name"] == "Christian Caparra") {
                        Navigator.push(
                          context,
                          CupertinoPageRoute(builder: (context) => const ChristianChatPage()),
                        );


                    } else if (participant["name"] == "Jhuniel Galang") {
                        Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (context) => const JhunielChatPage()),
                        );

                        //dito nyo add sainyo gamit kayo else if


                      }




                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipOval(
                            child: Image.asset(
                              participant["image"]!,
                              height: 50,
                              width: 50,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [


                                //dito start nung chat recent


                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      participant["name"]!,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: CupertinoColors.white,
                                        fontSize: 16,
                                      ),
                                    ),
                                    if (participant["name"] == "Christian Caparra")
                                      const Text(
                                        "Sige po sir Thankyou po",
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: CupertinoColors.systemGrey,
                                        ),
                                      ),
                                  ],
                                ),



                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );



                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Show Story Dialog
  void _showStoryDialog(BuildContext context, String name, String imagePath) {
    showCupertinoDialog(
      context: context,
      builder: (context) {
        return CupertinoPageScaffold(
          backgroundColor: CupertinoColors.black,
          child: Stack(
            children: [
              Positioned.fill(
                child: Image.asset(
                  imagePath,
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

// Data
List<Map<String, String>> participants = [
  {"name": "Christian Caparra", "image": "images/ChristianCaparra.jpg"},
  {"name": "Jhuniel Galang", "image": "images/Jhuniel.jpg"},
  {"name": "John Lloyd Guevarra", "image": "images/JL.jpg"},
  {"name": "Michael De Ramos", "image": "images/mike.jpg"},
  {"name": "Samuel Miranda", "image": "images/JL.jpg"},




];
