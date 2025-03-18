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
        middle: Text("Privacy"),
        leading: CupertinoButton(
          padding: EdgeInsets.zero,
          child: Icon(CupertinoIcons.back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      child: SafeArea(
        child: Column(
          children: [
            // Message from Stranger Toggle
            _buildToggleTile(
              "Message from stranger",
              messageFromStranger,
                  (bool value) {
                setState(() {
                  messageFromStranger = value;
                });
              },
            ),

            // Request from Stranger Toggle
            _buildToggleTile(
              "Request from stranger",
              requestFromStranger,
                  (bool value) {
                setState(() {
                  requestFromStranger = value;
                });
              },
            ),

            // Blacklist Navigation Tile
            _buildNavigationTile(
              "Blacklist",
                  () {
                // Navigate to Blacklist page (You can create a Blacklist page separately)
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildToggleTile(String title, bool value, Function(bool) onChanged) {
    return CupertinoListTile(
      title: Text(title),
      trailing: CupertinoSwitch(
        value: value,
        onChanged: onChanged,
        thumbColor: CupertinoDynamicColor.withBrightness(
          color: CupertinoColors.white, // Default color
          darkColor: CupertinoColors.systemGrey6, // Dark mode adaptation
        ),
      ),
    );
  }



  Widget _buildNavigationTile(String title, VoidCallback onTap) {
    return CupertinoListTile(
      title: Text(title),
      trailing: Icon(CupertinoIcons.right_chevron, color: CupertinoColors.systemGrey),
      onTap: onTap,
    );
  }
}
