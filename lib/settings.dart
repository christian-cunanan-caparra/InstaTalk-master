import 'package:flutter/cupertino.dart';
import 'notification_settings.dart';
import 'privacy_settings.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});
//lilinisin
  @override

  Widget build(BuildContext context) {

    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        backgroundColor: CupertinoColors.white,
        border: Border(
          bottom: BorderSide(color: CupertinoColors.systemGrey, width: 0.5),
        ),
        leading: Container(
          padding: EdgeInsets.all(8),
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              CupertinoIcons.chevron_left,
              size: 25,
              color: CupertinoColors.black,
            ),
          ),
        ),
        middle: Text(
          "Settings",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: CupertinoColors.black,
          ),
        ),
      ),
      child: SafeArea(
        child: ListView(
          children: [
            CupertinoListSection.insetGrouped(
              children: [
                CupertinoListTile(
                  leading: Icon(CupertinoIcons.bell, color: CupertinoColors.systemOrange),
                  title: Text("Notificationn"),
                  trailing: CupertinoListTileChevron(),
                  onTap: () {Navigator.push(
                    context,
                    CupertinoPageRoute(builder: (context) => NotificationSettings()),
                  );},
                ),


                CupertinoListTile(
                  leading: Icon(CupertinoIcons.lock, color: CupertinoColors.systemOrange),
                  title: Text("Privacy"),
                  trailing: CupertinoListTileChevron(),
                  onTap: () {
                    Navigator.push(
                      context,
                      CupertinoPageRoute(builder: (context) => PrivacySettings()),
                    );

                  },
                ),
              ],
            ),


            CupertinoListSection.insetGrouped(
              children: [
                CupertinoListTile(
                  leading: Icon(CupertinoIcons.globe, color: CupertinoColors.systemBlue),
                  title: Text("Language/Region"),
                  trailing: CupertinoListTileChevron(),
                  onTap: () {},
                ),
                CupertinoListTile(
                  leading: Icon(CupertinoIcons.square_list, color: CupertinoColors.systemBlue),
                  title: Text("Others"),
                  trailing: CupertinoListTileChevron(),
                  onTap: () {},
                ),
              ],
            ),
            CupertinoListSection.insetGrouped(
              children: [
                CupertinoListTile(
                  leading: Icon(CupertinoIcons.chat_bubble_text, color: CupertinoColors.systemGreen),
                  title: Text("Feedback"),
                  trailing: CupertinoListTileChevron(),
                  onTap: () {},
                ),
                CupertinoListTile(
                  leading: Icon(CupertinoIcons.info, color: CupertinoColors.systemPurple),
                  title: Text("About"),
                  trailing: CupertinoListTileChevron(),
                  onTap: () {},
                ),
              ],
            ),
            CupertinoListSection.insetGrouped(
              children: [
                CupertinoListTile(
                  leading: Icon(CupertinoIcons.square_arrow_right, color: CupertinoColors.systemRed),
                  title: Text("Logout", style: TextStyle(color: CupertinoColors.systemRed)),
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
}
