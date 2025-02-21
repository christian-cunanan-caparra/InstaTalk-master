import 'package:flutter/cupertino.dart';


class group_chat extends StatelessWidget {
  const group_chat({super.key});

  final List<Map<String, String>> messages = const [
    {"name": "Christian Caparra", "message": "Shatawt sa mga kabataan jan", "image": "images/ChristianCaparra.jpg", "time": "12:30 PM"},
    {"name": "Michael De Ramos", "message": "Ma ano Ulam!!", "image": "images/mike.jpg", "time": "12:32 PM"},
    {"name": "John Lloyd Guevarra", "message": "Code code din di puro tulog", "image": "images/JL.jpg", "time": "12:35 PM"},
    {"name": "Jhuniel Galang", "message": "Ay payag kayo non?", "image": "images/Jhuniel.jpg", "time": "12:37 PM"},
  ];


  //aso this???
  //di akosure sa design ko or sakto lang
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.black,
      navigationBar: CupertinoNavigationBar(
        middle: const Text("DevOps Gc"),
      ),
      child: SafeArea(
        child: Column(
          children: [


            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                itemCount: messages.length,
                itemBuilder: (context, index) {
                  final message = messages[index];

                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Profile image (same for all)
                        ClipOval(
                          child: Image.asset(
                            message["image"]!,
                            height: 40,
                            width: 40,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(width: 10),
                        // Message bubble
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                message["name"]!,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: CupertinoColors.white,
                                  fontSize: 14,
                                ),
                              ),
                              const SizedBox(height: 5),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 15),
                                decoration: BoxDecoration(
                                  color: CupertinoColors.white,
                                  borderRadius: BorderRadius.circular(15),
                                  boxShadow: const [
                                    BoxShadow(
                                      color: CupertinoColors.systemGrey,
                                      offset: Offset(0, 2),
                                      blurRadius: 5,
                                    ),
                                  ],
                                ),
                                child: Text(
                                  message["message"]!,
                                  style: const TextStyle(
                                    color: CupertinoColors.black,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                message["time"]!,
                                style: const TextStyle(
                                  fontSize: 10,
                                  color: CupertinoColors.systemGrey,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),


            Container(
              margin: const EdgeInsets.symmetric(horizontal: 15), // Added margin to the input container
              child: CupertinoTextField(
                placeholder: "Type a message...",
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
                decoration: BoxDecoration(
                  color: CupertinoColors.systemGrey5, // Set background color for the text field
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
