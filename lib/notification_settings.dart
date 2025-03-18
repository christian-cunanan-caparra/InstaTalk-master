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
        middle: Text("Notification"),
        leading: CupertinoButton(
          padding: EdgeInsets.zero,
          child: Icon(CupertinoIcons.back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      child: ListView(
        children: [
          CupertinoListTile(
            title: Text("Notification"),
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
            onTap: isNotificationEnabled ? null : () {},
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
            onTap: isNotificationEnabled ? null : () {},
          ),
          CupertinoListTile(
            title: Text("Message Previeww"),
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
            onTap: isNotificationEnabled ? null : () {},
          ),
          CupertinoListTile(
            title: Text("Group List"),
            trailing: CupertinoListTileChevron(),
            onTap: () {
              // Navigate to the group list page if needed
            },
          ),
        ],
      ),
    );
  }
}
