import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PrivacySettings extends StatefulWidget {
  @override
  _PrivacySettingsState createState() => _PrivacySettingsState();
}

class _PrivacySettingsState extends State<PrivacySettings> {
  bool messageFromStranger = false;
  bool requestFromStranger = false;

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
          "Privacy",
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
                  title: Text("Message from strangers"),
                  subtitle: Text(
                    "Allow messages from users who are not in your contacts.",
                    style: TextStyle(fontSize: 12, color: CupertinoColors.systemGrey),
                  ),
                  trailing: CupertinoSwitch(
                    value: messageFromStranger,
                    onChanged: (bool value) {
                      setState(() {
                        messageFromStranger = value;
                      });
                    },
                  ),
                ),
                CupertinoListTile(
                  title: Text("Request from strangers"),
                  subtitle: Text(
                    "Allow friend requests from users outside your contacts.",
                    style: TextStyle(fontSize: 12, color: CupertinoColors.systemGrey),
                  ),
                  trailing: CupertinoSwitch(
                    value: requestFromStranger,
                    onChanged: (bool value) {
                      setState(() {
                        requestFromStranger = value;
                      });
                    },
                  ),
                ),
              ],
            ),
            CupertinoListSection.insetGrouped(
              children: [
                CupertinoListTile(
                  title: Text("Blacklist"),
                  trailing: CupertinoListTileChevron(),
                  onTap: () {
                    // Navigate to Blacklist Page
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
