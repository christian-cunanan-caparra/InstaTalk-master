import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:barena/settings.dart';
import 'fb.dart';

class Chat extends StatelessWidget {
  const Chat({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        backgroundColor: CupertinoColors.systemBackground.resolveFrom(context),
        border: Border(
          bottom: BorderSide(color: CupertinoColors.systemGrey5, width: 0.5),
        ),
        leading: CupertinoButton(
          padding: EdgeInsets.zero,
          child: const Icon(CupertinoIcons.chevron_left, size: 25),
          onPressed: () => Navigator.pop(context),
        ),
        middle: const Text("Menu", style: TextStyle(fontWeight: FontWeight.bold)),
        trailing: CupertinoButton(
          padding: EdgeInsets.zero,
          child: const Icon(CupertinoIcons.info_circle, size: 25),
          onPressed: () => _showTeamDialog(context),
        ),
      ),
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              /// **User Profile Section**
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    ClipOval(
                      child: Image.asset(
                        "images/user.jpg",
                        height: 50,
                        width: 50,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text("User Name", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                        Text("Profile", style: TextStyle(color: CupertinoColors.systemGrey)),
                      ],
                    ),
                  ],
                ),
              ),

              /// **My Games Section**
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                width: double.infinity,
                color: CupertinoColors.systemGrey5.resolveFrom(context),
                child: const Text(
                  "My Games",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(
                        "images/legends.jpg",
                        height: 100,
                        width: 100,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text("League of Legends", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                    const Text("MOBA | Action-Packed", style: TextStyle(color: CupertinoColors.systemGrey)),
                  ],
                ),
              ),

              /// **Menu List Section**
              CupertinoListSection.insetGrouped(
                header: const Text("SOCIAL & SETTINGS",
                    style: TextStyle(fontSize: 13, color: CupertinoColors.systemGrey)),
                children: [
                  _buildMenuTile(
                    icon: Icons.facebook,
                    color: Colors.blue,
                    title: "Facebook",
                    subtitle: "Reconnect to sync your game progress",
                    onTap: () => Navigator.push(
                      context,
                      CupertinoPageRoute(builder: (context) => FacebookReconnectScreen()),
                    ),
                  ),
                  _buildMenuTile(
                    icon: CupertinoIcons.gear,
                    color: CupertinoColors.systemGrey,
                    title: "Settings",
                    subtitle: "Manage app preferences",
                    onTap: () => Navigator.push(
                      context,
                      CupertinoPageRoute(builder: (context) => SettingsScreen()),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// **Team Members Dialog**
  void _showTeamDialog(BuildContext context) {
    showCupertinoDialog(
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: const Text("Team Members"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildTeamMember("Christian Caparra", "images/ChristianCaparra.jpg"),
              _buildTeamMember("John Lloyd Guevarra", "images/JL1.jpg"),
              _buildTeamMember("Samuel Miranda", "images/sam.jpg"),
              _buildTeamMember("Jhuniel Galang", "images/Jhuniel.jpg"),
              _buildTeamMember("Michael Deramos", "images/mike.jpg"),
            ],
          ),
          actions: [
            CupertinoDialogAction(
              child: const Text("Close"),
              onPressed: () => Navigator.pop(context),
            ),
          ],
        );
      },
    );
  }

  /// **Build Team Member Row**
  Widget _buildTeamMember(String name, String imagePath) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          ClipOval(
            child: Image.asset(imagePath, height: 40, width: 40, fit: BoxFit.cover),
          ),
          const SizedBox(width: 12),
          Text(name, style: const TextStyle(fontSize: 16)),
        ],
      ),
    );
  }

  /// **Reusable Menu Tile**
  Widget _buildMenuTile({
    required IconData icon,
    required Color color,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return CupertinoListTile(
      leading: Icon(icon, color: color),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
      subtitle: Text(subtitle, style: const TextStyle(fontSize: 14)),
      trailing: const CupertinoListTileChevron(),
      onTap: onTap,
    );
  }
}
