import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FacebookReconnectScreen extends StatefulWidget {
  const FacebookReconnectScreen({super.key});

  @override
  FacebookReconnectScreenState createState() => FacebookReconnectScreenState();
}

class FacebookReconnectScreenState extends State<FacebookReconnectScreen>
    with SingleTickerProviderStateMixin {
  bool showFacebook = true;
  late AnimationController _controller;
  late Animation<double> _animation;
  Timer? _timer;

  @override
  void initState() {
    super.initState();

    // Controller for the image animation
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800), // Shorter duration for smoother feel
    );

    // Animation for the opacity transition
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    // Start the animation immediately to avoid initial lag
    _controller.forward();

    // Timer for toggling the Facebook image
    _timer = Timer.periodic(const Duration(seconds: 2), (timer) {
      if (mounted) {
        setState(() {
          showFacebook = !showFacebook;
          _controller.forward(from: 0.0); // Restart the animation
        });
      } else {
        timer.cancel();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        leading: Navigator.of(context).canPop()
            ? CupertinoNavigationBarBackButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
        )
            : null, // Hide the back button if the screen is not poppable
        middle: const Text("Facebook"),
      ),


      child: SingleChildScrollView(
        // Make the content scrollable
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 100),// AnimatedBuilder for the image transition
              AnimatedBuilder(
                animation: _animation,
                builder: (context, child) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // First image (ChristianCaparra.jpg)
                      Opacity(
                        opacity: showFacebook ? _animation.value : 1 - _animation.value,
                        child: const CircleAvatar(
                          radius: 40,
                          backgroundImage: AssetImage("images/ChristianCaparra.jpg"),
                        ),
                      ),
                      const SizedBox(width: 10),
                      const Icon(Icons.link, color: Colors.grey),
                      const SizedBox(width: 10),
                      // Second image (legends.jpg)
                      Opacity(
                        opacity: showFacebook ? 1 - _animation.value : _animation.value,
                        child: const CircleAvatar(
                          radius: 40,
                          backgroundImage: AssetImage("images/legends.jpg"),
                        ),
                      ),
                    ],
                  );
                },
              ),
              const SizedBox(height: 10),
              const Text("Chan", style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 20),
              // Full-width "Reconnect with Facebook" button
              SizedBox(
                width: double.infinity, // Make the button full width
                child: CupertinoButton(
                  color: Colors.blue,
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center, // Center the content
                    children: [
                      Icon(Icons.facebook, color: Colors.white),
                      SizedBox(width: 8),
                      Text(
                        "Reconnect with Facebook",
                        style: TextStyle(color: Colors.white), // White text color
                      ),
                    ],
                  ),
                  onPressed: () {
                    // Add your onPressed logic here
                  },
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "Sorry, your Facebook token has expired. For security reasons, you need to reconnect with Facebook.",
                textAlign: TextAlign.center,
                style: TextStyle(color: CupertinoColors.systemGrey),
              ),
            ],
          ),
        ),
      ),
    );
  }
}