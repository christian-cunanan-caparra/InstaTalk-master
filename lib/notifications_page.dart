import 'dart:async';
import 'dart:math';
import 'package:flutter/cupertino.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({super.key});

  @override
  _NotificationsPageState createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  List<String> reviews = [];
  bool isLoading = true;
  final ScrollController _scrollController = ScrollController(); // Scroll controller

  final List<String> reviewMessages = [
    "User A: 5-star review!",
    "User B: 'Great experience!'",
    "User C: 'Needs improvement'",
    "User D: 'Fast and reliable service'",
    "User E: 'Would recommend!'"
  ];

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 1), () {
      if (mounted) {
        setState(() {
          isLoading = false;
          _startReviewLoop();
        });
      }
    });
  }

  void _startReviewLoop() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      if (mounted) {
        setState(() {
          final randomReview = reviewMessages[Random().nextInt(reviewMessages.length)];
          reviews.add(randomReview); // Add to the bottom

          // Auto-scroll smoothly to the latest review
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (_scrollController.hasClients) {
              _scrollController.animateTo(
                _scrollController.position.maxScrollExtent,
                duration: Duration(milliseconds: 500),
                curve: Curves.easeOut,
              );
            }
          });
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text("Notifications & Offers"),
      ),
      child: SafeArea(
        child: isLoading
            ? Center(child: CupertinoActivityIndicator(radius: 18))
            : Column(
          children: [
            /// **Dynamic List of Reviews**
            Expanded(
              child: CupertinoScrollbar(
                child: ListView.builder(
                  controller: _scrollController, // Attach scroll controller
                  itemCount: reviews.length,
                  itemBuilder: (context, index) {
                    return CupertinoListTile(
                      leading: Icon(CupertinoIcons.star_fill, color: CupertinoColors.systemYellow),
                      title: Text(reviews[index]),
                    );
                  },
                ),
              ),
            ),

            /// **Total Reviews Count**
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Center(
                child: Text(
                  "Total Reviews: ${reviews.length}",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: CupertinoColors.systemGrey,
                  ),
                ),
              ),
            ),

            /// **Fixed Bottom Sections**
            CupertinoListSection.insetGrouped(
              header: Text("OFFERS & PROMOTIONS",
                  style: TextStyle(fontSize: 13, color: CupertinoColors.systemGrey)),
              children: [
                CupertinoListTile(
                  leading: Icon(CupertinoIcons.gift, color: CupertinoColors.systemPink),
                  title: Text("Limited Time Offer"),
                  subtitle: Text("Get 20% off on your next purchase"),
                  trailing: CupertinoListTileChevron(),
                  onTap: () {},
                ),
                CupertinoListTile(
                  leading: Icon(CupertinoIcons.bag, color: CupertinoColors.systemBlue),
                  title: Text("New Builds"),
                  subtitle: Text("Check out our latest applications"),
                  trailing: CupertinoListTileChevron(),
                  onTap: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose(); // Clean up the controller
    super.dispose();
  }
}
