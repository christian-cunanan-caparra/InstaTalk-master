import 'package:flutter/cupertino.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.black,
      navigationBar: const CupertinoNavigationBar(
        backgroundColor: CupertinoColors.black,
        middle: Text(
          "Notifications",
          style: TextStyle(fontWeight: FontWeight.bold, color: CupertinoColors.white),
        ),
      ),
      child: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            _buildNotificationItem(
              "Christian Caparra + 1 other",
              "Follow requests",
              "images/ChristianCaparra.jpg",
            ),
            const SizedBox(height: 16),
            _buildNotificationItem(
              "John Lloyd Guevarra and Michael DeRamos followed Christian Caparra",
              "1d",
              "images/JL.jpg",
            ),
            const SizedBox(height: 16),
            _buildNotificationItem(
              "Michael DeRamos requested to follow you",
              "3d",
              "images/mike.jpg",
            ),
            const SizedBox(height: 16),
            _buildNotificationItem(
              "Jhuniel Galang requested to follow you",
              "4d",
              "images/dpjhuniel.jpg",
            ),

            const SizedBox(height: 16),
            _buildNotificationItem(
              "Jhuniel Galang and Christian Caparra liked your post",
              "5d",
              "images/Jhuniel.jpg",
            ),
          ],
        ),
      ),
    );
  }


  Widget _buildNotificationItem(String title, String subtitle, String imagePath) {
    return Row(
      children: [
        // Profile Image
        ClipOval(
          child: Image.asset(
            imagePath,
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
                title,
                style: const TextStyle(
                  color: CupertinoColors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                subtitle,
                style: const TextStyle(
                  color: CupertinoColors.systemGrey,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),

        // CupertinoButton(
        //   padding: EdgeInsets.zero,
        //   child: const Icon(
        //     CupertinoIcons.add,
        //     color: CupertinoColors.activeBlue,
        //     size: 20,
        //   ),
        //   onPressed: () {
        //
        //   },
        // ),
      ],
    );
  }
}