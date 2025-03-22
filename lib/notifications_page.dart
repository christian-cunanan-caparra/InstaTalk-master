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
  final ScrollController _scrollController = ScrollController();

  final List<String> reviewMessages = [
    "User A: ⭐⭐⭐⭐⭐ Amazing experience!",
    "User B: 👍 'Loved the app!'",
    "User C: 🤔 'Could use some improvements.'",
    "User D: ⚡ 'Fast and reliable service!'",
    "User E: 🎉 'Would definitely recommend!'"
  ];

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 1), () {
      if (mounted) {
        setState(() {
          isLoading = false;
          _startReviewLoop();
        });
      }
    });
  }

  void _startReviewLoop() {
    Timer.periodic(const Duration(seconds: 2), (timer) {
      if (mounted) {
        setState(() {
          final randomReview = reviewMessages[Random().nextInt(reviewMessages.length)];
          reviews.add(randomReview);

          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (_scrollController.hasClients) {
              _scrollController.animateTo(
                _scrollController.position.maxScrollExtent,
                duration: const Duration(milliseconds: 500),
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
        middle: const Text("Notifications & Offers"),
      ),
      child: SafeArea(
        child: Column(
          children: [
            /// **Review Section**
            Expanded(
              child: isLoading
                  ? const Center(child: CupertinoActivityIndicator(radius: 18))
                  : CupertinoScrollbar(
                child: ListView.builder(
                  controller: _scrollController,
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  itemCount: reviews.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.symmetric(vertical: 6),
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: CupertinoColors.systemGrey6.resolveFrom(context),
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: CupertinoColors.systemGrey2.withOpacity(0.5),
                            blurRadius: 4,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Icon(CupertinoIcons.person_circle_fill, size: 32),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Text(
                              reviews[index],
                              style: const TextStyle(fontSize: 16),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),

            /// **Total Reviews Counter**
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text(
                "Total Reviews: ${reviews.length}",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: CupertinoColors.systemGrey,
                ),
              ),
            ),

            /// **Offers & Promotions**
            CupertinoListSection.insetGrouped(
              header: const Text(
                "OFFERS & PROMOTIONS",
                style: TextStyle(fontSize: 13, color: CupertinoColors.systemGrey),
              ),
              children: [
                _buildOfferTile(
                  icon: CupertinoIcons.gift,
                  color: CupertinoColors.systemPink,
                  title: "Limited Time Offer",
                  subtitle: "Get 20% off on your next purchase",
                ),
                _buildOfferTile(
                  icon: CupertinoIcons.bag_fill,
                  color: CupertinoColors.systemBlue,
                  title: "New Builds Available",
                  subtitle: "Check out our latest applications",
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOfferTile({
    required IconData icon,
    required Color color,
    required String title,
    required String subtitle,
  }) {
    return CupertinoListTile(
      leading: Icon(icon, color: color),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
      subtitle: Text(subtitle, style: const TextStyle(fontSize: 14)),
      trailing: const CupertinoListTileChevron(),
      onTap: () {},
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
