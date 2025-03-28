import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:barena/chat.dart';
import 'package:barena/notifications_page.dart';
import 'package:flutter/services.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override

  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.white,
      child: SingleChildScrollView(child: Column(
          children: [


             SizedBox(height: 10),


            SafeArea(child:CupertinoNavigationBar(
              backgroundColor: CupertinoColors.white,
              border: Border(
                bottom: BorderSide(color: CupertinoColors.systemGrey5, width: 0.5),
              ),
              leading: GestureDetector(
                onTap: () {
                  // Optional: Add functionality if needed (e.g., navigate home)
                },
                child: Text(
                  "BARENA",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    letterSpacing: 1.2,
                    color: CupertinoColors.black,
                  ),
                ),
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CupertinoButton(
                    padding: EdgeInsets.zero,
                    child: Icon(
                      CupertinoIcons.bell,
                      size: 26,
                      color: CupertinoColors.black,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        CupertinoPageRoute(builder: (context) => NotificationsPage()),
                      );
                    },
                  ),
                  SizedBox(width: 12), // Better spacing
                  CupertinoButton(
                    padding: EdgeInsets.zero,
                    child: Icon(
                      CupertinoIcons.person,
                      size: 26,
                      color: CupertinoColors.black,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        CupertinoPageRoute(builder: (context) => Chat()),
                      );
                    },
                  ),
                ],
              ),
            ),

            ),


             SizedBox(height: 10),


            Container(height: 1, color: CupertinoColors.systemGrey),


             SizedBox(height: 10),

            SizedBox(height: 20),

            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => _showLoLModal(context),
                    child: Container(
                      margin: EdgeInsets.only(left: 10),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child:
                        Image.asset("images/legends.jpg", width: 300, height: 200,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),

                   SizedBox(width: 12),
                  GestureDetector(
                    onTap: () => _showCODModal(context),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child:
                      Image.asset("images/codm.jpg", width: 300, height: 200,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),


                   SizedBox(width: 12),
                  GestureDetector(
                    onTap: () => _showCODModal(context),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child:
                      Image.asset("images/free4.jpg", width: 300, height: 200,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                   SizedBox(width: 12),
                  GestureDetector(
                    onTap: () => _showPBModal(context),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child:
                      Image.asset("images/pb.jpg", width: 300, height: 200,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),


                   SizedBox(width: 12),


                ],
              ),
            ),


             SizedBox(height: 20),

            // Featured
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Featured Games", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: CupertinoColors.black,
                  ),
                ),


                 SizedBox(height: 10),
                SizedBox(height: 120,


                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () => _showLoLModal(context),
                          child: Container(
                            width: 150,
                            height: 120,
                            decoration: BoxDecoration(
                              color: CupertinoColors.black,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child:
                              Image.asset("images/legends.jpg", width: 150, height: 120,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) {
                                  return const Center(
                                    child: Text("League of Legends", textAlign: TextAlign.center, style: TextStyle(fontSize: 16,
                                        fontWeight: FontWeight.bold, color: CupertinoColors.white,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                         SizedBox(width: 10),


                        GestureDetector(
                          onTap: () => _showCODModal(context),
                          child: Container(
                            width: 150,
                            height: 120,
                            decoration: BoxDecoration(
                              color: CupertinoColors.black,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child:
                              Image.asset("images/codm.jpg", width: 150, height: 120,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) {
                                  return  Center(
                                    child: Text("Call of Duty Mobile", textAlign: TextAlign.center, style: TextStyle(fontSize: 16,
                                        fontWeight: FontWeight.bold, color: CupertinoColors.white,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ),


                        SizedBox(width: 10),


                        GestureDetector(
                          onTap: () => _showFreeFireModal(context),
                          child: Container(
                            width: 150,
                            height: 120,
                            decoration: BoxDecoration(
                              color: CupertinoColors.black,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child:
                              Image.asset("images/free2.jpg", width: 150, height: 120,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) {
                                  return  Center(
                                    child: Text("Free Fire", textAlign: TextAlign.center, style: TextStyle(fontSize: 16,
                                        fontWeight: FontWeight.bold, color: CupertinoColors.white,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ),


                         SizedBox(width: 10),


                        GestureDetector(
                          onTap: () => _showPBModal(context),
                          child: Container(
                            width: 150,
                            height: 120,
                            decoration: BoxDecoration(
                              color: CupertinoColors.black,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child:
                              Image.asset("images/pb.jpg", width: 150, height: 120,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) {
                                  return  Center(
                                    child: Text("Point Blank", textAlign: TextAlign.center, style: TextStyle(fontSize: 16,
                                        fontWeight: FontWeight.bold, color: CupertinoColors.white,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),






           SizedBox(height: 20),



            // Popular
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   Text(
                    "Popular Games", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: CupertinoColors.black,
                    ),
                  ),

                  SizedBox(height: 10),
                  Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: 100,
                              decoration: BoxDecoration(
                                color: CupertinoColors.systemGrey5,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child:
                                Image.asset("images/pubg.jpg", fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) {

                                    return  Center(
                                      child: Text("PUBG Mobile", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: CupertinoColors.black,

                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),


                           SizedBox(width: 10),


                          Expanded(
                            child: Container(
                              height: 100,
                              decoration: BoxDecoration(
                                color: CupertinoColors.systemGrey5,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child:
                                Image.asset("images/fortnite.jpg", fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) {
                                    return  Center(
                                      child: Text("Fortnite", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: CupertinoColors.black,
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),


                       SizedBox(height: 10),


                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: 100,
                              decoration: BoxDecoration(
                                color: CupertinoColors.systemGrey5,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child:
                                Image.asset("images/cor.jpg", fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) {
                                    return  Center(
                                      child: Text("Clash Royale", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: CupertinoColors.black,
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),


                           SizedBox(width: 10),



                          Expanded(
                            child: Container(
                              height: 100,
                              decoration: BoxDecoration(
                                color: CupertinoColors.systemGrey5,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child:
                                Image.asset("images/minecrft.jpg", fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) {
                                    return  Center(
                                      child: Text("Minecraft", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: CupertinoColors.black,
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),


                       SizedBox(height: 10),

                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: 100,
                              decoration: BoxDecoration(
                                color: CupertinoColors.systemGrey5,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child:
                                Image.asset("images/amongus.jpg", fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) {
                                    return  Center(
                                      child: Text("Among Us", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: CupertinoColors.black,
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),


                           SizedBox(width: 10),


                          Expanded(
                            child: Container(
                              height: 100,
                              decoration: BoxDecoration(
                                color: CupertinoColors.systemGrey5,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child:
                                Image.asset("images/roblox.png", fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) {
                                    return  Center(
                                      child: Text("Roblox", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: CupertinoColors.black,
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),


                       //---------------



                       SizedBox(height: 10),


                    ],
                  ),
                ],
              ),
            ),


             SizedBox(height: 20),



          ],
        ),
      ),
    );
  }


  //para sa featured to

  //lol

  void showLeagueOfLegendsModal(BuildContext context) {
    showCupertinoModalPopup(context: context,
      builder: (context) => SizedBox(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        child: Container(
          color: CupertinoColors.white,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset("images/legends.jpg", width: double.infinity, height: MediaQuery.of(context).size.height * 0.35,
                  fit: BoxFit.cover,
                ),


                 SizedBox(height: 10),


                 Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text("League of Legends", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                ),
                 Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text("5v5 MOBA Action! Team up with friends, select a champion, & dive into the Rift.", style: TextStyle(fontSize: 14, color: Colors.black54),
                  ),
                ),


                 SizedBox(height: 10),




                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 16.0),
                  child: Wrap(
                    spacing: 8.0,
                    children: [
                      tagButton("MOBA"),
                      tagButton("Battling"),
                      tagButton("Fantasy"),
                      tagButton("Stylized"),
                    ],
                  ),
                ),


                 SizedBox(height: 10),


                Padding(

                  padding:  EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ratingInfo("3.4 ★", "2M reviews"),
                      ratingInfo("12+", "Rated for 12+"),
                      ratingInfo("50M+", "Downloads"),
                    ],
                  ),
                ),
                 SizedBox(height: 15),


                SizedBox(
                  height: 120,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    padding:  EdgeInsets.symmetric(horizontal: 16.0),
                    children: [
                      Image.asset("images/legends.jpg", width: 180, height: 100,
                        fit: BoxFit.cover,
                      ),

                       SizedBox(width: 10),
                      Image.asset(
                        "images/legends.jpg",
                        width: 180,
                        height: 100,
                        fit: BoxFit.cover,
                      ),


                       SizedBox(width: 10),

                      Image.asset("images/legends.jpg", width: 180, height: 100,
                        fit: BoxFit.cover,
                      ),
//sass

                       SizedBox(width: 10),

                      Image.asset("images/legends.jpg", width: 180, height: 100,
                        fit: BoxFit.cover,
                      ),
                    ],
                  ),
                ),


                 SizedBox(height: 15),



                Padding(
                  padding:  EdgeInsets.all(16.0),
                  child: SizedBox(
                    width: double.infinity,
                    child: CupertinoButton(color: CupertinoColors.destructiveRed, onPressed: () => Navigator.pop(context),
                      child:  Text("Play", style: TextStyle(color: CupertinoColors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }


  Widget tagButton(String text) {
    return CupertinoButton(
      padding:  EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      color: CupertinoColors.systemGrey5,
      minSize: 30,
      borderRadius: BorderRadius.circular(20),
      onPressed: () {},
      child: Text(text, style:  TextStyle(fontSize: 12, color: CupertinoColors.black),
      ),
    );
  }


  Widget ratingInfo(String title, String subtitle) {
    return Column(
      children: [
        Text(title, style:  TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
        Text(subtitle, style:  TextStyle(fontSize: 12, color: Colors.black54),
        ),
      ],
    );
  }


  //cod


  void showCODMModal(BuildContext context) {
    showCupertinoModalPopup(context: context,
      builder: (context) => SizedBox(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        child: Container(
          color: CupertinoColors.white,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Image.asset("images/codm.jpg", width: double.infinity, height: MediaQuery.of(context).size.height * 0.35,
                  fit: BoxFit.cover,
                ),

                 SizedBox(height: 10),


                 Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text("Call of Duty: Mobile", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                ),
                 Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text("A mobile battle royale and multiplayer FPS.", style: TextStyle(fontSize: 14, color: Colors.black54),
                  ),
                ),

                 SizedBox(height: 10),


                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 16.0),
                  child: Wrap(
                    spacing: 8.0,
                    children: [
                      codTagButton("Shooter"),
                      codTagButton("Battle Royale"),
                      codTagButton("FPS"),
                      codTagButton("Action"),
                    ],
                  ),
                ),

                 SizedBox(height: 10),


                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      codRatingInfo("4.2 ★", "5M reviews"),
                      codRatingInfo("16+", "Rated for 16+"),
                      codRatingInfo("100M+", "Downloads"),
                    ],
                  ),
                ),


                 SizedBox(height: 15),


                SizedBox(height: 120,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    padding:  EdgeInsets.symmetric(horizontal: 16.0),
                    children: [
                      Image.asset("images/codm.jpg", width: 180, height: 100,
                        fit: BoxFit.cover,
                      ),




                       SizedBox(width: 10),
                      Image.asset("images/codm.jpg", width: 180, height: 100, fit: BoxFit.cover,
                      ),



                       SizedBox(width: 10),
                      Image.asset(
                        "images/codm.jpg", width: 180, height: 100,
                        fit: BoxFit.cover,
                      ),


                       SizedBox(width: 10),
                      Image.asset(
                        "images/codm.jpg", width: 180, height: 100,
                        fit: BoxFit.cover,
                      ),
                    ],
                  ),
                ),



                 SizedBox(height: 15),


                Padding(
                  padding:  EdgeInsets.all(16.0),
                  child: SizedBox(
                    width: double.infinity,
                    child: CupertinoButton(color: CupertinoColors.destructiveRed, onPressed: () => Navigator.pop(context),
                      child:  Text("Play", style: TextStyle(color: CupertinoColors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }


  Widget codTagButton(String text) {
    return CupertinoButton(
      padding:  EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      color: CupertinoColors.systemGrey5,
      minSize: 30,
      borderRadius: BorderRadius.circular(20),
      onPressed: () {},
      child: Text(text, style:  TextStyle(fontSize: 12, color: CupertinoColors.black),
      ),
    );
  }


  Widget codRatingInfo(String title, String subtitle) {
    return Column(
      children: [
        Text(title, style:  TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
        Text(subtitle, style:  TextStyle(fontSize: 12, color: Colors.black54),
        ),
      ],
    );
  }



  //freefire

  void showFreeFireModal(BuildContext context) {
    showCupertinoModalPopup(context: context,
      builder: (context) => SizedBox(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        child: Container(
          color: CupertinoColors.white,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Image.asset("images/free2.jpg", width: double.infinity, height: MediaQuery.of(context).size.height * 0.35,
                  fit: BoxFit.cover,
                ),

                 SizedBox(height: 10),



                 Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text("Free Fire", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                ),
                 Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text("A fast-paced mobile battle royale game.", style: TextStyle(fontSize: 14, color: Colors.black54),
                  ),
                ),


                 SizedBox(height: 10),




                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 16.0),
                  child: Wrap(
                    spacing: 8.0,
                    children: [
                      freeFireTagButton("Battle Royale"),
                      freeFireTagButton("Shooter"),
                      freeFireTagButton("Survival"),
                      freeFireTagButton("Action"),
                    ],
                  ),
                ),
                 SizedBox(height: 10),


                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      freeFireRatingInfo("4.6 ★", "117M reviews"),
                      freeFireRatingInfo("12+", "Rated for 12+"),
                      freeFireRatingInfo("1B+", "Downloads"),
                    ],
                  ),
                ),


                 SizedBox(height: 15),




                SizedBox(height: 120,


                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    padding:  EdgeInsets.symmetric(horizontal: 16.0),
                    children: [
                      Image.asset("images/free2.jpg", width: 180, height: 100,
                        fit: BoxFit.cover,
                      ),


                      SizedBox(width: 10),


                      Image.asset("images/free2.jpg", width: 180, height: 100,
                        fit: BoxFit.cover,
                      ),


                       SizedBox(width: 10),


                      Image.asset("images/free2.jpg", width: 180, height: 100,
                        fit: BoxFit.cover,
                      ),



                       SizedBox(width: 10),

                      Image.asset("images/free2.jpg", width: 180, height: 100,
                        fit: BoxFit.cover,
                      ),
                    ],
                  ),
                ),

                 SizedBox(height: 15),


                Padding(
                  padding:  EdgeInsets.all(16.0),
                  child: SizedBox(
                    width: double.infinity,
                    child: CupertinoButton(color: CupertinoColors.destructiveRed, onPressed: () => Navigator.pop(context),
                      child:  Text("Play", style: TextStyle(color: CupertinoColors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }


  Widget freeFireTagButton(String text) {
    return CupertinoButton(
      padding:  EdgeInsets.symmetric(horizontal: 10, vertical: 5), color: CupertinoColors.systemGrey5,
      minSize: 30,
      borderRadius: BorderRadius.circular(20),
      onPressed: () {},
      child: Text(text, style:  TextStyle(fontSize: 12, color: CupertinoColors.black),
      ),
    );
  }


  Widget freeFireRatingInfo(String title, String subtitle) {
    return Column(
      children: [
        Text(title, style:  TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
        Text(subtitle, style:  TextStyle(fontSize: 12, color: Colors.black54),
        ),
      ],
    );
  }


  //pb


  void showPointBlankModal(BuildContext context) {
    showCupertinoModalPopup(context: context,
      builder: (context) => SizedBox(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        child: Container(
          color: CupertinoColors.white,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset("images/pb.jpg", width: double.infinity, height: MediaQuery.of(context).size.height * 0.35, fit: BoxFit.cover,
                ),


                 SizedBox(height: 10),




                 Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text("Point Blank", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                ),


                 Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text("A tactical FPS shooter with team-based battles.", style: TextStyle(fontSize: 14, color: Colors.black54),
                  ),
                ),


                 SizedBox(height: 10),


                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 16.0),
                  child: Wrap(
                    spacing: 8.0,
                    children: [
                      pbTagButton("FPS"),
                      pbTagButton("Tactical"),
                      pbTagButton("Team-Based"),
                      pbTagButton("Shooter"),
                    ],
                  ),
                ),
                 SizedBox(height: 10),


                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      pbRatingInfo("4.0 ★", "1.2M reviews"),
                      pbRatingInfo("18+", "Rated for 18+"),
                      pbRatingInfo("50M+", "Downloads"),
                    ],
                  ),
                ),


                 SizedBox(height: 15),



                SizedBox(height: 120,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    padding:  EdgeInsets.symmetric(horizontal: 16.0),
                    children: [

                      Image.asset("images/pb.jpg", width: 180, height: 100, fit: BoxFit.cover,
                      ),


                       SizedBox(width: 10),


                      Image.asset("images/pb.jpg", width: 180, height: 100, fit: BoxFit.cover,
                      ),


                       SizedBox(width: 10),


                      Image.asset("images/pb.jpg", width: 180, height: 100, fit: BoxFit.cover,
                      ),



                       SizedBox(width: 10),


                      Image.asset("images/pb.jpg", width: 180, height: 100, fit: BoxFit.cover,
                      ),
                    ],
                  ),
                ),



                 SizedBox(height: 15),




                Padding(
                  padding:  EdgeInsets.all(16.0),
                  child: SizedBox(
                    width: double.infinity,
                    child: CupertinoButton(color: CupertinoColors.destructiveRed, onPressed: () => Navigator.pop(context),
                      child:  Text("Play", style: TextStyle(color: CupertinoColors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }


  Widget pbTagButton(String text) {
    return CupertinoButton(
      padding:  EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      color: CupertinoColors.systemGrey5,
      minSize: 30,
      borderRadius: BorderRadius.circular(20),
      onPressed: () {},
      child: Text(text, style:  TextStyle(fontSize: 12, color: CupertinoColors.black),
      ),
    );
  }


  Widget pbRatingInfo(String title, String subtitle) {
    return Column(
      children: [
        Text(title, style:  TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
        Text(subtitle, style: const TextStyle(fontSize: 12, color: Colors.black54),
        ),
      ],
    );
  }







 //modal bannerr
  //aayusin kopaand lilinisan

  //lol


  void _showLoLModal(BuildContext context) {
    showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) {
        double progress = 0.0;
        bool isDownloading = false;
        bool isInstalling = false;
        bool isInstalled = false;

        return StatefulBuilder(
          builder: (context, setState) {
            void startDownload() {
              setState(() {
                isDownloading = true;
                progress = 0.0;
              });

              for (int i = 1; i <= 10; i++) {
                Future.delayed(Duration(seconds: i), () {
                  if (!context.mounted) return;

                  setState(() {
                    progress = i / 10;
                  });

                  if (i == 10) {
                    if (!context.mounted) return;

                    setState(() {
                      isDownloading = false;
                      isInstalling = true;
                    });

                    showCupertinoDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return CupertinoAlertDialog(
                          title: Text("Installing..."),
                          content: Padding(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            child: Text("Please wait while the installation completes."),
                          ),
                        );
                      },
                    );

                    Future.delayed(Duration(seconds: 3), () {
                      if (!context.mounted) return;

                      Navigator.pop(context);

                      setState(() {
                        isInstalling = false;
                        isInstalled = true;
                      });

                      if (!context.mounted) return;

                      showCupertinoDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return CupertinoAlertDialog(
                            title: Text("Installation Done"),
                            content: Padding(
                              padding: EdgeInsets.symmetric(vertical: 10),
                              child: Text("League of Legends is installed."),
                            ),
                            actions: [
                              CupertinoDialogAction(
                                child: Text("Open", style: TextStyle(color: CupertinoColors.systemBlue)),
                                onPressed: () {
                                  Navigator.pop(context);
                                  Navigator.push(
                                    context,
                                    CupertinoPageRoute(
                                      builder: (context) => WelcomeScreen(),
                                    ),
                                  );
                                },
                              ),
                              CupertinoDialogAction(
                                child: Text("Close", style: TextStyle(color: CupertinoColors.destructiveRed)),
                                onPressed: () {
                                  if (context.mounted) Navigator.pop(context);
                                },
                              ),
                            ],
                          );
                        },
                      );
                    });
                  }
                });
              }
            }

            return CupertinoPageScaffold(
              navigationBar: CupertinoNavigationBar(
                backgroundColor: CupertinoColors.white,
                border: Border(
                  bottom: BorderSide(color: CupertinoColors.systemGrey, width: 0.5),
                ),
                leading: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Padding(
                    padding: EdgeInsets.all(8),
                    child: Icon(
                      CupertinoIcons.chevron_left,
                      size: 25,
                      color: CupertinoColors.black,
                    ),
                  ),
                ),
                middle: Text(
                  "League of Legends",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: CupertinoColors.black,
                  ),
                ),
              ),

              child: SizedBox(
                width: double.infinity,
                height: MediaQuery.of(context).size.height,
                child: Container(
                  color: CupertinoColors.white,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          "images/legends.jpg",
                          width: double.infinity,
                          height: MediaQuery.of(context).size.height * 0.35,
                          fit: BoxFit.cover,
                        ),
                        SizedBox(height: 10),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.0),
                          child: Text(
                            "League of Legends",
                            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.0),
                          child: Text(
                            "5v5 MOBA Action! Team up with friends, select a champion, & dive into the Rift.",
                            style: TextStyle(fontSize: 14, color: Colors.black54),
                          ),
                        ),
                        SizedBox(height: 10),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.0),
                          child: Wrap(
                            spacing: 8.0,
                            children: [
                              tagButton("MOBA"),
                              tagButton("Battling"),
                              tagButton("Fantasy"),
                              tagButton("Stylized"),
                            ],
                          ),
                        ),
                        SizedBox(height: 10),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ratingInfo("3.4 ★", "2M reviews"),
                              ratingInfo("12+", "Rated for 12+"),
                              ratingInfo("50M+", "Downloads"),
                            ],
                          ),
                        ),
                        SizedBox(height: 15),
                        SizedBox(
                          height: 120,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            padding: EdgeInsets.symmetric(horizontal: 16.0),
                            children: [
                              Image.asset(
                                "images/lol3.jpg",
                                width: 180,
                                height: 100,
                                fit: BoxFit.cover,
                              ),
                              SizedBox(width: 10),
                              Image.asset(
                                "images/lol4.jpg",
                                width: 180,
                                height: 100,
                                fit: BoxFit.cover,
                              ),
                              SizedBox(width: 10),
                              Image.asset(
                                "images/lol5.jpg",
                                width: 180,
                                height: 100,
                                fit: BoxFit.cover,
                              ),
                              SizedBox(width: 10),
                              Image.asset(
                                "images/lol6.jpg",
                                width: 180,
                                height: 100,
                                fit: BoxFit.cover,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 15),
                        Padding(
                          padding: EdgeInsets.all(16.0),
                          child: SizedBox(
                            width: double.infinity,
                            child: isDownloading
                                ? Column(
                              children: [
                                Text(
                                  "Downloading... ${((progress) * 100).toInt()}%",
                                  style: TextStyle(color: CupertinoColors.black),
                                ),
                                SizedBox(height: 8),
                                LinearProgressIndicator(
                                  value: progress,
                                  minHeight: 6,
                                  color: CupertinoColors.systemRed,
                                ),
                              ],
                            )
                                : isInstalling
                                ? CupertinoButton(
                              color: CupertinoColors.systemRed,
                              padding: EdgeInsets.symmetric(vertical: 12),
                              onPressed: null,
                              child: Text(
                                "Installing...",
                                style: TextStyle(color: CupertinoColors.black),
                              ),
                            )
                                : isInstalled
                                ? CupertinoButton(
                              color: CupertinoColors.destructiveRed,
                              padding: EdgeInsets.symmetric(vertical: 12),
                              child: Text(
                                "Open",
                                style: TextStyle(color: CupertinoColors.white),
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  CupertinoPageRoute(
                                    builder: (context) => WelcomeScreen(),
                                  ),
                                );
                              },
                            )
                                : CupertinoButton(
                              color: CupertinoColors.systemRed,
                              padding: EdgeInsets.symmetric(vertical: 12),
                              onPressed: startDownload,
                              child: Text(
                                "Download",
                                style: TextStyle(color: CupertinoColors.white),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }




  //cod


  //_showCODModal
  void _showCODModal(BuildContext context) {
    showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) {
        double progress = 0.0;
        bool isDownloading = false;
        bool isInstalling = false;
        bool isInstalled = false;

        return StatefulBuilder(
          builder: (context, setState) {
            void startDownload() {
              setState(() {
                isDownloading = true;
                progress = 0.0;
              });

              for (int i = 1; i <= 10; i++) {
                Future.delayed(Duration(seconds: i), () {
                  if (!context.mounted) return;

                  setState(() {
                    progress = i / 10;
                  });

                  if (i == 10) {
                    if (!context.mounted) return;

                    setState(() {
                      isDownloading = false;
                      isInstalling = true;
                    });

                    showCupertinoDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return CupertinoAlertDialog(
                          title: Text("Installing..."),
                          content: Padding(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            child: Text("Please wait while the installation completes."),
                          ),
                        );
                      },
                    );

                    Future.delayed(Duration(seconds: 3), () {
                      if (!context.mounted) return;

                      Navigator.pop(context);

                      setState(() {
                        isInstalling = false;
                        isInstalled = true;
                      });

                      if (!context.mounted) return;

                      showCupertinoDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return CupertinoAlertDialog(
                            title: Text("Installation Done"),
                            content: Padding(
                              padding: EdgeInsets.symmetric(vertical: 10),
                              child: Text("Call of Duty is installed."),
                            ),
                            actions: [
                              CupertinoDialogAction(
                                child: Text("Open", style: TextStyle(color: CupertinoColors.systemBlue)),
                                onPressed: () {
                                  Navigator.pop(context);
                                  Navigator.push(
                                    context,
                                    CupertinoPageRoute(
                                      builder: (context) => WelcomeScreen(),
                                    ),
                                  );
                                },
                              ),
                              CupertinoDialogAction(
                                child: Text("Close", style: TextStyle(color: CupertinoColors.destructiveRed)),
                                onPressed: () {
                                  if (context.mounted) Navigator.pop(context);
                                },
                              ),
                            ],
                          );
                        },
                      );
                    });
                  }
                });
              }
            }

            return CupertinoPageScaffold(
              navigationBar: CupertinoNavigationBar(
                backgroundColor: CupertinoColors.white,
                border: Border(
                  bottom: BorderSide(color: CupertinoColors.systemGrey, width: 0.5),
                ),
                leading: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Padding(
                    padding: EdgeInsets.all(8),
                    child: Icon(
                      CupertinoIcons.chevron_left,
                      size: 25,
                      color: CupertinoColors.black,
                    ),
                  ),
                ),
                middle: Text(
                  "Call of Duty Mobile",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: CupertinoColors.black,
                  ),
                ),
              ),

              child: SizedBox(
                width: double.infinity,
                height: MediaQuery.of(context).size.height,
                child: Container(
                  color: CupertinoColors.white,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          "images/codm.jpg",
                          width: double.infinity,
                          height: MediaQuery.of(context).size.height * 0.35,
                          fit: BoxFit.cover,
                        ),
                        SizedBox(height: 10),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.0),
                          child: Text(
                            "Call of Duty Mobile",
                            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.0),
                          child: Text(
                            "Call Of Duty: Mobile (CODM) features tons of game modes for a free-to-play (F2P) game.",
                            style: TextStyle(fontSize: 14, color: Colors.black54),
                          ),
                        ),
                        SizedBox(height: 10),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.0),
                          child: Wrap(
                            spacing: 8.0,
                            children: [
                              tagButton("Team Death Match"),
                              tagButton("Free For All"),
                              tagButton("Gun Fight"),
                              tagButton("Battle Royal"),
                            ],
                          ),
                        ),
                        SizedBox(height: 10),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ratingInfo("3.4 ★", "2M reviews"),
                              ratingInfo("12+", "Rated for 12+"),
                              ratingInfo("50M+", "Downloads"),
                            ],
                          ),
                        ),
                        SizedBox(height: 15),
                        SizedBox(
                          height: 120,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            padding: EdgeInsets.symmetric(horizontal: 16.0),
                            children: [
                              Image.asset(
                                "images/codm0.jpg",
                                width: 180,
                                height: 100,
                                fit: BoxFit.cover,
                              ),
                              SizedBox(width: 10),
                              Image.asset(
                                "images/codm1.jpg",
                                width: 180,
                                height: 100,
                                fit: BoxFit.cover,
                              ),
                              SizedBox(width: 10),
                              Image.asset(
                                "images/codm2.jpg",
                                width: 180,
                                height: 100,
                                fit: BoxFit.cover,
                              ),
                              SizedBox(width: 10),
                              Image.asset(
                                "images/codm3.jpg",
                                width: 180,
                                height: 100,
                                fit: BoxFit.cover,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 15),
                        Padding(
                          padding: EdgeInsets.all(16.0),
                          child: SizedBox(
                            width: double.infinity,
                            child: isDownloading
                                ? Column(
                              children: [
                                Text(
                                  "Downloading... ${((progress) * 100).toInt()}%",
                                  style: TextStyle(color: CupertinoColors.black),
                                ),
                                SizedBox(height: 8),
                                LinearProgressIndicator(
                                  value: progress,
                                  minHeight: 6,
                                  color: CupertinoColors.systemRed,
                                ),
                              ],
                            )
                                : isInstalling
                                ? CupertinoButton(
                              color: CupertinoColors.systemRed,
                              padding: EdgeInsets.symmetric(vertical: 12),
                              onPressed: null,
                              child: Text(
                                "Installing...",
                                style: TextStyle(color: CupertinoColors.black),
                              ),
                            )
                                : isInstalled
                                ? CupertinoButton(
                              color: CupertinoColors.destructiveRed,
                              padding: EdgeInsets.symmetric(vertical: 12),
                              child: Text(
                                "Open",
                                style: TextStyle(color: CupertinoColors.white),
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  CupertinoPageRoute(
                                    builder: (context) => WelcomeScreen(),
                                  ),
                                );
                              },
                            )
                                : CupertinoButton(
                              color: CupertinoColors.systemRed,
                              padding: EdgeInsets.symmetric(vertical: 12),
                              onPressed: startDownload,
                              child: Text(
                                "Download",
                                style: TextStyle(color: CupertinoColors.white),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }





  //freefire


  //_showFreeFireModal
  void _showFreeFireModal(BuildContext context) {
    showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) {
        double progress = 0.0;
        bool isDownloading = false;
        bool isInstalling = false;
        bool isInstalled = false;

        return StatefulBuilder(
          builder: (context, setState) {
            void startDownload() {
              setState(() {
                isDownloading = true;
                progress = 0.0;
              });

              for (int i = 1; i <= 10; i++) {
                Future.delayed(Duration(seconds: i), () {
                  if (!context.mounted) return;

                  setState(() {
                    progress = i / 10;
                  });

                  if (i == 10) {
                    if (!context.mounted) return;

                    setState(() {
                      isDownloading = false;
                      isInstalling = true;
                    });

                    showCupertinoDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return CupertinoAlertDialog(
                          title: Text("Installing..."),
                          content: Padding(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            child: Text("Please wait while the installation completes."),
                          ),
                        );
                      },
                    );

                    Future.delayed(Duration(seconds: 3), () {
                      if (!context.mounted) return;

                      Navigator.pop(context);

                      setState(() {
                        isInstalling = false;
                        isInstalled = true;
                      });

                      if (!context.mounted) return;

                      showCupertinoDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return CupertinoAlertDialog(
                            title: Text("Installation Done"),
                            content: Padding(
                              padding: EdgeInsets.symmetric(vertical: 10),
                              child: Text("Free Fire is installed."),
                            ),
                            actions: [
                              CupertinoDialogAction(
                                child: Text("Open", style: TextStyle(color: CupertinoColors.systemBlue)),
                                onPressed: () {
                                  Navigator.pop(context);
                                  Navigator.push(
                                    context,
                                    CupertinoPageRoute(
                                      builder: (context) => WelcomeScreen(),
                                    ),
                                  );
                                },
                              ),
                              CupertinoDialogAction(
                                child: Text("Close", style: TextStyle(color: CupertinoColors.destructiveRed)),
                                onPressed: () {
                                  if (context.mounted) Navigator.pop(context);
                                },
                              ),
                            ],
                          );
                        },
                      );
                    });
                  }
                });
              }
            }

            return CupertinoPageScaffold(
              navigationBar: CupertinoNavigationBar(
                backgroundColor: CupertinoColors.white,
                border: Border(
                  bottom: BorderSide(color: CupertinoColors.systemGrey, width: 0.5),
                ),
                leading: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Padding(
                    padding: EdgeInsets.all(8),
                    child: Icon(
                      CupertinoIcons.chevron_left,
                      size: 25,
                      color: CupertinoColors.black,
                    ),
                  ),
                ),
                middle: Text(
                  "Free Fire",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: CupertinoColors.black,
                  ),
                ),
              ),

              child: SizedBox(
                width: double.infinity,
                height: MediaQuery.of(context).size.height,
                child: Container(
                  color: CupertinoColors.white,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          "images/free2.jpg",
                          width: double.infinity,
                          height: MediaQuery.of(context).size.height * 0.35,
                          fit: BoxFit.cover,
                        ),
                        SizedBox(height: 10),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.0),
                          child: Text(
                            "Free Fire",
                            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.0),
                          child: Text(
                            "Free Fire is a free-to-play battle royale game developed and published by Garena for Android and iOS.",
                            style: TextStyle(fontSize: 14, color: Colors.black54),
                          ),
                        ),
                        SizedBox(height: 10),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.0),
                          child: Wrap(
                            spacing: 8.0,
                            children: [
                              tagButton("Free to Play"),
                              tagButton("Battling"),
                              tagButton("Battle Royal"),
                              tagButton("Stylized"),
                            ],
                          ),
                        ),
                        SizedBox(height: 10),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ratingInfo("3.4 ★", "2M reviews"),
                              ratingInfo("12+", "Rated for 12+"),
                              ratingInfo("50M+", "Downloads"),
                            ],
                          ),
                        ),
                        SizedBox(height: 15),
                        SizedBox(
                          height: 120,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            padding: EdgeInsets.symmetric(horizontal: 16.0),
                            children: [
                              Image.asset(
                                "images/free1.jpg",
                                width: 180,
                                height: 100,
                                fit: BoxFit.cover,
                              ),
                              SizedBox(width: 10),
                              Image.asset(
                                "images/free2.jpg",
                                width: 180,
                                height: 100,
                                fit: BoxFit.cover,
                              ),
                              SizedBox(width: 10),
                              Image.asset(
                                "images/free2.jpg",
                                width: 180,
                                height: 100,
                                fit: BoxFit.cover,
                              ),
                              SizedBox(width: 10),
                              Image.asset(
                                "images/free4.jpg",
                                width: 180,
                                height: 100,
                                fit: BoxFit.cover,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 15),
                        Padding(
                          padding: EdgeInsets.all(16.0),
                          child: SizedBox(
                            width: double.infinity,
                            child: isDownloading
                                ? Column(
                              children: [
                                Text(
                                  "Downloading... ${((progress) * 100).toInt()}%",
                                  style: TextStyle(color: CupertinoColors.black),
                                ),
                                SizedBox(height: 8),
                                LinearProgressIndicator(
                                  value: progress,
                                  minHeight: 6,
                                  color: CupertinoColors.systemRed,
                                ),
                              ],
                            )
                                : isInstalling
                                ? CupertinoButton(
                              color: CupertinoColors.systemRed,
                              padding: EdgeInsets.symmetric(vertical: 12),
                              onPressed: null,
                              child: Text(
                                "Installing...",
                                style: TextStyle(color: CupertinoColors.black),
                              ),
                            )
                                : isInstalled
                                ? CupertinoButton(
                              color: CupertinoColors.destructiveRed,
                              padding: EdgeInsets.symmetric(vertical: 12),
                              child: Text(
                                "Open",
                                style: TextStyle(color: CupertinoColors.white),
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  CupertinoPageRoute(
                                    builder: (context) => WelcomeScreen(),
                                  ),
                                );
                              },
                            )
                                : CupertinoButton(
                              color: CupertinoColors.systemRed,
                              padding: EdgeInsets.symmetric(vertical: 12),
                              onPressed: startDownload,
                              child: Text(
                                "Download",
                                style: TextStyle(color: CupertinoColors.white),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }

  //pb
  //_showPBModal

  void _showPBModal(BuildContext context) {
    showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) {
        double progress = 0.0;
        bool isDownloading = false;
        bool isInstalling = false;
        bool isInstalled = false;

        return StatefulBuilder(
          builder: (context, setState) {
            void startDownload() {
              setState(() {
                isDownloading = true;
                progress = 0.0;
              });

              for (int i = 1; i <= 10; i++) {
                Future.delayed(Duration(seconds: i), () {
                  if (!context.mounted) return;

                  setState(() {
                    progress = i / 10;
                  });

                  if (i == 10) {
                    if (!context.mounted) return;

                    setState(() {
                      isDownloading = false;
                      isInstalling = true;
                    });

                    showCupertinoDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return CupertinoAlertDialog(
                          title: Text("Installing..."),
                          content: Padding(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            child: Text("Please wait while the installation completes."),
                          ),
                        );
                      },
                    );

                    Future.delayed(Duration(seconds: 3), () {
                      if (!context.mounted) return;

                      Navigator.pop(context);

                      setState(() {
                        isInstalling = false;
                        isInstalled = true;
                      });

                      if (!context.mounted) return;

                      showCupertinoDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return CupertinoAlertDialog(
                            title: Text("Installation Done"),
                            content: Padding(
                              padding: EdgeInsets.symmetric(vertical: 10),
                              child: Text("Point Blank is installed."),
                            ),
                            actions: [
                              CupertinoDialogAction(
                                child: Text("Open", style: TextStyle(color: CupertinoColors.systemBlue)),
                                onPressed: () {
                                  Navigator.pop(context);
                                  Navigator.push(
                                    context,
                                    CupertinoPageRoute(
                                      builder: (context) => WelcomeScreen(),
                                    ),
                                  );
                                },
                              ),
                              CupertinoDialogAction(
                                child: Text("Close", style: TextStyle(color: CupertinoColors.destructiveRed)),
                                onPressed: () {
                                  if (context.mounted) Navigator.pop(context);
                                },
                              ),
                            ],
                          );
                        },
                      );
                    });
                  }
                });
              }
            }

            return CupertinoPageScaffold(
              navigationBar: CupertinoNavigationBar(
                backgroundColor: CupertinoColors.white,
                border: Border(
                  bottom: BorderSide(color: CupertinoColors.systemGrey, width: 0.5),
                ),
                leading: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Padding(
                    padding: EdgeInsets.all(8),
                    child: Icon(
                      CupertinoIcons.chevron_left,
                      size: 25,
                      color: CupertinoColors.black,
                    ),
                  ),
                ),
                middle: Text(
                  "Point Blank",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: CupertinoColors.black,
                  ),
                ),
              ),

              child: SizedBox(
                width: double.infinity,
                height: MediaQuery.of(context).size.height,
                child: Container(
                  color: CupertinoColors.white,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          "images/pb.jpg",
                          width: double.infinity,
                          height: MediaQuery.of(context).size.height * 0.35,
                          fit: BoxFit.cover,
                        ),
                        SizedBox(height: 10),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.0),
                          child: Text(
                            "Point Blank",
                            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.0),
                          child: Text(
                            "Point Blank is a first-person shooter video game developed by the South Korean company Zepetto for Microsoft Windows.",
                            style: TextStyle(fontSize: 14, color: Colors.black54),
                          ),
                        ),
                        SizedBox(height: 10),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.0),
                          child: Wrap(
                            spacing: 8.0,
                            children: [
                              tagButton("Epic Battle"),
                              tagButton("Action Packed"),
                              tagButton("Multiplayer"),
                              tagButton("Competitive"),
                            ],
                          ),
                        ),
                        SizedBox(height: 10),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ratingInfo("3.4 ★", "2M reviews"),
                              ratingInfo("12+", "Rated for 12+"),
                              ratingInfo("50M+", "Downloads"),
                            ],
                          ),
                        ),
                        SizedBox(height: 15),
                        SizedBox(
                          height: 120,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            padding: EdgeInsets.symmetric(horizontal: 16.0),
                            children: [
                              Image.asset(
                                "images/pb1.jpg",
                                width: 180,
                                height: 100,
                                fit: BoxFit.cover,
                              ),
                              SizedBox(width: 10),
                              Image.asset(
                                "images/pb3.jpg",
                                width: 180,
                                height: 100,
                                fit: BoxFit.cover,
                              ),
                              SizedBox(width: 10),
                              Image.asset(
                                "images/pb4.jpg",
                                width: 180,
                                height: 100,
                                fit: BoxFit.cover,
                              ),
                              SizedBox(width: 10),
                              Image.asset(
                                "images/pb.jpg",
                                width: 180,
                                height: 100,
                                fit: BoxFit.cover,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 15),
                        Padding(
                          padding: EdgeInsets.all(16.0),
                          child: SizedBox(
                            width: double.infinity,
                            child: isDownloading
                                ? Column(
                              children: [
                                Text(
                                  "Downloading... ${((progress) * 100).toInt()}%",
                                  style: TextStyle(color: CupertinoColors.black),
                                ),
                                SizedBox(height: 8),
                                LinearProgressIndicator(
                                  value: progress,
                                  minHeight: 6,
                                  color: CupertinoColors.systemRed,
                                ),
                              ],
                            )
                                : isInstalling
                                ? CupertinoButton(
                              color: CupertinoColors.systemRed,
                              padding: EdgeInsets.symmetric(vertical: 12),
                              onPressed: null,
                              child: Text(
                                "Installing...",
                                style: TextStyle(color: CupertinoColors.black),
                              ),
                            )
                                : isInstalled
                                ? CupertinoButton(
                              color: CupertinoColors.destructiveRed,
                              padding: EdgeInsets.symmetric(vertical: 12),
                              child: Text(
                                "Open",
                                style: TextStyle(color: CupertinoColors.white),
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  CupertinoPageRoute(
                                    builder: (context) => WelcomeScreen(),
                                  ),
                                );
                              },
                            )
                                : CupertinoButton(
                              color: CupertinoColors.systemRed,
                              padding: EdgeInsets.symmetric(vertical: 12),
                              onPressed: startDownload,
                              child: Text(
                                "Download",
                                style: TextStyle(color: CupertinoColors.white),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }






}
class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeRight, DeviceOrientation.landscapeLeft]);

    return CupertinoPageScaffold(

      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/red.jpg"), fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset("images/riot.png", width: 250, height: 250),


              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
