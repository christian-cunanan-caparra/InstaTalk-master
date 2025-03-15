import 'package:flutter/cupertino.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        backgroundColor: CupertinoColors.white,
        border:  Border(
          bottom: BorderSide(color: CupertinoColors.systemGrey, width: 0.5),
        ),
        leading: Container(
          padding:  EdgeInsets.all(8),
          child: GestureDetector(onTap: () {
            Navigator.pop(context);
            },
            child:  Icon(CupertinoIcons.chevron_left, size: 25, color: CupertinoColors.black,
            ),
          ),
        ),
        middle: Text("Notifications & offers", style: TextStyle(fontWeight: FontWeight.bold, color: CupertinoColors.black,
          ),
        ),
      ),

      child: SafeArea(child: Padding(
          padding:  EdgeInsets.only(top: 10),
          child: Center(
            child: Column(mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Container(width: 100, height: 100,
                  decoration: BoxDecoration(shape: BoxShape.circle,
                    gradient:  RadialGradient(colors: [CupertinoColors.systemGrey5, CupertinoColors.systemBlue],
                      center: Alignment.center, radius: 0.6,
                    ),
                  ),
                  child:  Center(child: Icon(CupertinoIcons.check_mark, size: 50, color: CupertinoColors.black,
                    ),
                  ),
                ),
                 SizedBox(height: 20),


                 Text("You're all caught up", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),

                 SizedBox(height: 10),


                 Text("This is where you'll see notifications about your Barena Store account", textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 14, color: CupertinoColors.systemGrey),

                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
