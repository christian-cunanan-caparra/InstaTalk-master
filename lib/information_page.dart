import 'package:flutter/cupertino.dart';


class information_page extends StatelessWidget {
  const information_page({super.key});

  final List<Map<String, String>> contactInfo = const [
    {
      "name": "Christian Caparra",
      "message": "Address: Sta Lucia Sta Ana, Pampanga\nPhone: +639942060319\ncaparrachristian47@gmail.com",
      "image": "images/ChristianCaparra.jpg",
      "time": "12:30 PM"
    },
    {
      "name": "Jhuniel Galang",
      "message": "Address: San Nicolas Sta Ana, Pampanga\nPhone: +63123456789\nJhunielGalang@gmail.com",
      "image": "images/Jhuniel.jpg",
      "time": "12:32 PM"
    },
    {
      "name": "John Lloyd Guevarra",
      "message": "Address: San Luis Pampanga\nPhone: +639106284501\njohnlloydguevarra0405@gmail.com",
      "image": "images/JL.jpg",
      "time": "12:35 PM"
    },
    {
      "name": "Michael De Ramos",
      "message": "Address: San Nicolas Sta Ana, Pampanga\nPhone: +639871654565\nderamosmichael27@gmail.com",
      "image": "images/mike.jpg",
      "time": "12:40 PM"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.black,
      navigationBar: CupertinoNavigationBar(
        middle: const Text("Members Resume's"),
      ),
      child: SafeArea(
        child: Column(
          children: [
            // Contact  list
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                itemCount: contactInfo.length,
                itemBuilder: (context, index) {
                  final contact = contactInfo[index];

                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [


                        ClipOval(
                          child: Image.asset(
                            contact["image"]!,
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
                              Text(
                                contact["name"]!,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: CupertinoColors.white,
                                  fontSize: 16,
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
                                  contact["message"]!,
                                  style: const TextStyle(
                                    color: CupertinoColors.black,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                contact["time"]!,
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
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
