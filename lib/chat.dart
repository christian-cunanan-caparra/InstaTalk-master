import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Chat extends StatelessWidget {
  const Chat({super.key});

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
        middle:  Text("Menu", style: TextStyle(fontWeight: FontWeight.bold, color: CupertinoColors.black,
          ),
        ),
        trailing: GestureDetector(
          onTap: () {

            showCupertinoDialog(
              context: context,
              builder: (BuildContext context) {
                return CupertinoAlertDialog(
                  title:  Text("Members"),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [

                      Row(
                        children: [
                          ClipOval(
                            child:
                            Image.asset("images/ChristianCaparra.jpg", height: 40, width: 40,
                              fit: BoxFit.cover,
                            ),
                          ),
                           SizedBox(width: 10),
                           Text("Christian Caparra"),
                        ],
                      ),
                       SizedBox(height: 10),

                      Row(
                        children: [
                          ClipOval(
                            child:
                            Image.asset("images/JL1.jpg", height: 40, width: 40,
                              fit: BoxFit.cover,
                            ),
                          ),
                           SizedBox(width: 10),
                          Text("Christian Caparra"),
                        ],
                      ),
                       SizedBox(height: 10),

                      Row(
                        children: [
                          ClipOval(
                            child:
                            Image.asset("images/ChristianCaparra.jpg", height: 40, width: 40,
                              fit: BoxFit.cover,
                            ),
                          ),

                           SizedBox(width: 10),

                          Text("Christian Caparra"),
                        ],
                      ),
                    ],
                  ),
                  actions: <Widget>[
                    CupertinoDialogAction(
                      child:  Text("Close"), onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                );
              },
            );
          },
          child:  Icon(CupertinoIcons.info_circle, size: 25, color: CupertinoColors.black,
          ),
        ),
      ),
      child: SafeArea(child: SingleChildScrollView(child: Column(
            children: [
              Padding(
                padding:  EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    ClipOval(
                      child:
                      Image.asset("images/ChristianCaparra.jpg", height: 50, width: 50,
                        fit: BoxFit.cover,
                      ),
                    ),

                     SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:  [
                        Text("User Name", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                        Text("Details", style: TextStyle(color: CupertinoColors.systemGrey)),
                      ],
                    ),
                  ],
                ),
              ),


              Container(
                padding:  EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                width: double.infinity, color: CupertinoColors.systemGrey6,
                child:  Text("My Games"),
              ),

              Padding(
                padding:  EdgeInsets.all(16.0),
                child: Row(
                  children: [
                     SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                         Text("Wild Rift", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(40),
                          child:
                          Image.asset("images/legends.jpg", height: 80, width: 80,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // Menu Items
              CupertinoListSection.insetGrouped(
                children: [
                  CupertinoListTile(
                    leading:  Icon(Icons.facebook, color: Colors.blue),
                    title:  Text("Facebook"),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children:  [
                        Icon(CupertinoIcons.smallcircle_fill_circle, color: CupertinoColors.systemRed, size: 10),
                        Icon(CupertinoIcons.chevron_right),
                      ],
                    ),
                    onTap: () {},
                  ),
                  CupertinoListTile(
                    leading:  Icon(CupertinoIcons.gear),
                    title:  Text("Settings"),
                    trailing:  Icon(CupertinoIcons.chevron_right),
                    onTap: () {},
                  ),

                  CupertinoListTile(
                    leading:  Icon(CupertinoIcons.square_arrow_right),
                    title:  Text("Logout"),
                    onTap: () {

                      showCupertinoDialog(context: context,
                        builder: (BuildContext context) {
                          return CupertinoAlertDialog(
                            title:  Text("Are you sure you want to log out?"),
                            actions: <Widget>[
                              CupertinoDialogAction(
                                child:  Text("Cancel"), onPressed: () {
                                  Navigator.pop(context);
                                },
                              ),
                              CupertinoDialogAction(child:  Text("Log Out"),
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
      ),
    );
  }
}
