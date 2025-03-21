import 'package:flutter/cupertino.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  // Privacy Settings
  bool messageFromStranger = false;
  bool requestFromStranger = false;

  // Notification Settings
  bool isNotificationEnabled = true;
  bool isSoundEnabled = true;
  bool isVibrationEnabled = true;
  bool isMessagePreviewEnabled = true;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(middle: Text("Settings")),
      child: SafeArea(
        child: ListView(
          children: [
            /// 🔔 Notification Settings
            CupertinoListSection.insetGrouped(
              header: Text("NOTIFICATIONS", style: TextStyle(fontSize: 13, color: CupertinoColors.systemGrey)),
              children: [
                CupertinoListTile(
                  leading: Icon(CupertinoIcons.bell, color: CupertinoColors.systemOrange),
                  title: Text("Notifications"),
                  subtitle: Text("Manage sound, vibration, and previews",
                      style: TextStyle(fontSize: 12, color: CupertinoColors.systemGrey)),
                  trailing: CupertinoListTileChevron(),
                  onTap: () => Navigator.push(
                    context,
                    CupertinoPageRoute(builder: (context) => notificationSettings()),
                  ).then((_) => setState(() {})),
                ),
              ],
            ),

            /// 🔒 Privacy Settings
            CupertinoListSection.insetGrouped(
              header: Text("PRIVACY", style: TextStyle(fontSize: 13, color: CupertinoColors.systemGrey)),
              children: [
                CupertinoListTile(
                  leading: Icon(CupertinoIcons.lock, color: CupertinoColors.systemOrange),
                  title: Text("Privacy"),
                  subtitle: Text("Control who can contact you",
                      style: TextStyle(fontSize: 12, color: CupertinoColors.systemGrey)),
                  trailing: CupertinoListTileChevron(),
                  onTap: () => Navigator.push(
                    context,
                    CupertinoPageRoute(builder: (context) => privacySettings()),
                  ).then((_) => setState(() {})),
                ),
              ],
            ),

            /// 🌍 Language & Other Settings
            CupertinoListSection.insetGrouped(
              header: Text("GENERAL", style: TextStyle(fontSize: 13, color: CupertinoColors.systemGrey)),
              children: [
                CupertinoListTile(
                  leading: Icon(CupertinoIcons.globe, color: CupertinoColors.systemBlue),
                  title: Text("Language & Region"),
                  subtitle: Text("Change language and region settings",
                      style: TextStyle(fontSize: 12, color: CupertinoColors.systemGrey)),
                  trailing: CupertinoListTileChevron(),
                  onTap: () {},
                ),
                CupertinoListTile(
                  leading: Icon(CupertinoIcons.square_list, color: CupertinoColors.systemBlue),
                  title: Text("Others"),
                  subtitle: Text("Additional settings",
                      style: TextStyle(fontSize: 12, color: CupertinoColors.systemGrey)),
                  trailing: CupertinoListTileChevron(),
                  onTap: () {},
                ),
              ],
            ),

            /// 💬 Feedback & About
            CupertinoListSection.insetGrouped(
              header: Text("SUPPORT", style: TextStyle(fontSize: 13, color: CupertinoColors.systemGrey)),
              children: [
                CupertinoListTile(
                  leading: Icon(CupertinoIcons.chat_bubble_text, color: CupertinoColors.systemGreen),
                  title: Text("Feedback"),
                  subtitle: Text("Send your feedback",
                      style: TextStyle(fontSize: 12, color: CupertinoColors.systemGrey)),
                  trailing: CupertinoListTileChevron(),
                  onTap: () {},
                ),
                CupertinoListTile(
                  leading: Icon(CupertinoIcons.info, color: CupertinoColors.systemPurple),
                  title: Text("About"),
                  subtitle: Text("App version, terms, and privacy policy",
                      style: TextStyle(fontSize: 12, color: CupertinoColors.systemGrey)),
                  trailing: CupertinoListTileChevron(),
                  onTap: () {},
                ),
              ],
            ),

            /// 🚪 Logout
            CupertinoListSection.insetGrouped(
              children: [
                CupertinoListTile(
                  leading: Icon(CupertinoIcons.square_arrow_right, color: CupertinoColors.systemRed),
                  title: Text("Logout", style: TextStyle(color: CupertinoColors.systemRed)),
                  subtitle: Text("Sign out of your account",
                      style: TextStyle(fontSize: 12, color: CupertinoColors.systemGrey)),
                  onTap: () {
                    showCupertinoDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return CupertinoAlertDialog(
                          title: Text("Are you sure you want to log out?"),
                          actions: [
                            CupertinoDialogAction(
                              child: Text("Cancel"),
                              onPressed: () => Navigator.pop(context),
                            ),
                            CupertinoDialogAction(
                              isDestructiveAction: true,
                              child: Text("Log Out"),
                              onPressed: () {
                                Navigator.pushReplacementNamed(context, '/');
                              },
                            ),
                          ],
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  /// 📌 Privacy Settings Page
  Widget privacySettings() {
    return StatefulBuilder(
      builder: (context, setState) {
        return CupertinoPageScaffold(
          navigationBar: CupertinoNavigationBar(
            leading: CupertinoButton(
              padding: EdgeInsets.zero,
              child: Icon(CupertinoIcons.chevron_left, size: 25),
              onPressed: () => Navigator.pop(context),
            ),
            middle: Text("Privacy"),
          ),
          child: SafeArea(
            child: ListView(
              children: [
                CupertinoListTile(
                  title: Text("Message from strangers"),
                  subtitle: Text("Allow messages from unknown users.",
                      style: TextStyle(fontSize: 12, color: CupertinoColors.systemGrey)),
                  trailing: CupertinoSwitch(
                    value: messageFromStranger,
                    onChanged: (value) {
                      setState(() {
                        messageFromStranger = value;
                      });
                    },
                  ),
                ),
                CupertinoListTile(
                  title: Text("Requests from strangers"),
                  subtitle: Text("Receive friend requests from anyone.",
                      style: TextStyle(fontSize: 12, color: CupertinoColors.systemGrey)),
                  trailing: CupertinoSwitch(
                    value: requestFromStranger,
                    onChanged: (value) {
                      setState(() {
                        requestFromStranger = value;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  /// 📌 Notification Settings Page
  Widget notificationSettings() {
    return StatefulBuilder(
      builder: (context, setState) {
        return CupertinoPageScaffold(
          navigationBar: CupertinoNavigationBar(
            leading: CupertinoButton(
              padding: EdgeInsets.zero,
              child: Icon(CupertinoIcons.chevron_left, size: 25),
              onPressed: () => Navigator.pop(context),
            ),
            middle: Text("Notification"),
          ),
          child: SafeArea(
            child: ListView(
              children: [
                CupertinoListTile(
                  title: Text("Enable Notifications"),
                  subtitle: Text("Turn notifications on or off.",
                      style: TextStyle(fontSize: 12, color: CupertinoColors.systemGrey)),
                  trailing: CupertinoSwitch(
                    value: isNotificationEnabled,
                    onChanged: (value) {
                      setState(() {
                        isNotificationEnabled = value;
                        if (!value) {
                          isSoundEnabled = false;
                          isVibrationEnabled = false;
                          isMessagePreviewEnabled = false;
                        }
                      });
                    },
                  ),
                ),
                CupertinoListTile(
                  title: Text("Sound"),
                  subtitle: Text("Play sound for notifications.",
                      style: TextStyle(fontSize: 12, color: CupertinoColors.systemGrey)),
                  trailing: CupertinoSwitch(
                    value: isSoundEnabled,
                    onChanged: isNotificationEnabled ? (value) => setState(() => isSoundEnabled = value) : null,
                  ),
                ),
                CupertinoListTile(
                  title: Text("Vibration"),
                  subtitle: Text("Vibrate for new notifications.",
                      style: TextStyle(fontSize: 12, color: CupertinoColors.systemGrey)),
                  trailing: CupertinoSwitch(
                    value: isVibrationEnabled,
                    onChanged: isNotificationEnabled ? (value) => setState(() => isVibrationEnabled = value) : null,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
