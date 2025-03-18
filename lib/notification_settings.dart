import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NotificationSettings extends StatefulWidget {
  @override
  _NotificationSettingsState createState() => _NotificationSettingsState();
}

class _NotificationSettingsState extends State<NotificationSettings> {
  bool isNotificationEnabled = true;
  bool isSoundEnabled = true;
  bool isVibrationEnabled = true;
  bool isMessagePreviewEnabled = true;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        backgroundColor: CupertinoColors.white,
        border: Border(
          bottom: BorderSide(color: CupertinoColors.systemGrey, width: 0.5),
        ),
        leading: CupertinoButton(
          padding: EdgeInsets.zero,
          child: Icon(CupertinoIcons.chevron_left, size: 25, color: CupertinoColors.black),
          onPressed: () => Navigator.pop(context),
        ),
        middle: Text(
          "Notification",
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
                  title: Text("Enable Notifications"),
                  trailing: CupertinoSwitch(
                    value: isNotificationEnabled,
                    onChanged: (bool value) {
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
              ],
            ),
            CupertinoListSection.insetGrouped(
              children: [
                CupertinoListTile(
                  title: Text("Sound"),
                  trailing: CupertinoSwitch(
                    value: isSoundEnabled,
                    onChanged: isNotificationEnabled
                        ? (bool value) {
                      setState(() {
                        isSoundEnabled = value;
                      });
                    }
                        : null,
                  ),
                ),
                CupertinoListTile(
                  title: Text("Vibration"),
                  trailing: CupertinoSwitch(
                    value: isVibrationEnabled,
                    onChanged: isNotificationEnabled
                        ? (bool value) {
                      setState(() {
                        isVibrationEnabled = value;
                      });
                    }
                        : null,
                  ),
                ),
              ],
            ),
            CupertinoListSection.insetGrouped(
              children: [
                CupertinoListTile(
                  title: Text("Message Preview"),
                  subtitle: Text(
                    "If turned off, notification messages will not contain preview texts.",
                    style: TextStyle(
                      fontSize: 12,
                      color: isNotificationEnabled ? CupertinoColors.systemGrey : CupertinoColors.systemGrey3,
                    ),
                  ),
                  trailing: CupertinoSwitch(
                    value: isMessagePreviewEnabled,
                    onChanged: isNotificationEnabled
                        ? (bool value) {
                      setState(() {
                        isMessagePreviewEnabled = value;
                      });
                    }
                        : null,
                  ),
                ),
              ],
            ),
            CupertinoListSection.insetGrouped(
              children: [
                CupertinoListTile(
                  title: Text("Group List"),
                  trailing: CupertinoListTileChevron(),
                  onTap: () {
                    // Navigate to Group List Page
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
