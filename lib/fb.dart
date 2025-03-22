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
              SizedBox(height: 100), // AnimatedBuilder for the image transition
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
                          backgroundImage: AssetImage("images/00.png"),
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
                          backgroundImage: AssetImage("images/Capture.PNG"),
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
                    showCupertinoModalPopup(
                      context: context,
                      builder: (context) => FacebookLoginScreen(),
                    );
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

/// Facebook Login Modal (with Full-Width Button & ScrollView)
class FacebookLoginScreen extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20.0),
        topRight: Radius.circular(20.0),
      ),
      child: CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          leading: CupertinoButton(
            padding: EdgeInsets.zero,
            child: Icon(CupertinoIcons.back, color: CupertinoColors.black),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("images/00.png", width: 60),
                  SizedBox(height: 40),
                  _buildTextField(_emailController, "Mobile number or email", false),
                  SizedBox(height: 10),
                  _buildTextField(_passwordController, "Password", true),
                  SizedBox(height: 20),
                  _buildFullWidthButton("Log in", CupertinoColors.systemBlue, () {}), // Add your Facebook login logic here
                  SizedBox(height: 10),
                  CupertinoButton(
                    onPressed: () {},
                    child: Text("Forgot password?", style: TextStyle(color: CupertinoColors.systemGrey)),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String placeholder, bool isPassword) {
    return CupertinoTextField(
      controller: controller,
      placeholder: placeholder,
      obscureText: isPassword,
      padding: EdgeInsets.all(14),
      decoration: BoxDecoration(color: CupertinoColors.systemGrey6, borderRadius: BorderRadius.circular(8)),
    );
  }

  Widget _buildFullWidthButton(String text, Color borderColor, VoidCallback? onPressed) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: borderColor,
      ),
      child: CupertinoButton(
        padding: EdgeInsets.symmetric(vertical: 15),
        onPressed: onPressed,
        child: Text(text, style: TextStyle(color: CupertinoColors.white, fontSize: 18)),
      ),
    );
  }
}
