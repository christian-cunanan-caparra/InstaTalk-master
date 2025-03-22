import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'homepage.dart';

void main() {
  runApp(
    CupertinoApp(
      debugShowCheckedModeBanner: false,
      theme: CupertinoThemeData(brightness: Brightness.light),
      home: SplashScreen(),
    ),
  );
}

/// Splash Screen
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      if (mounted) {
        Navigator.pushReplacement(
          context,
          CupertinoPageRoute(builder: (context) => MyApp()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.systemBackground,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("images/logo.png", width: 150, fit: BoxFit.cover),
            SizedBox(height: 20),
            CupertinoActivityIndicator(),
          ],
        ),
      ),
    );
  }
}

/// Main Login Screen
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final TextEditingController _username = TextEditingController();
  final TextEditingController _password = TextEditingController();
  bool hidePassword = true;
  String error = "";

  bool isLogin(String username, String password) {
    return username == "admin" && password == "123";
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Stack(
        children: [
          SafeArea(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 50),
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage("images/MIMA.GIF"),
                  ),
                  SizedBox(height: 30),

                  Text(
                    "Username: admin\nPassword: 123",
                    style: TextStyle(color: CupertinoColors.systemGrey, fontSize: 16),
                    textAlign: TextAlign.center,
                  ),

                  SizedBox(height: 20),
                  _buildInputField(_username, "Username", CupertinoIcons.person, false),
                  SizedBox(height: 10),
                  _buildInputField(_password, "Password", CupertinoIcons.padlock_solid, true),
                  SizedBox(height: 10),

                  if (error.isNotEmpty)
                    Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Text(
                        error,
                        style: TextStyle(color: CupertinoColors.destructiveRed, fontSize: 14),
                      ),
                    ),

                  SizedBox(height: 20),
                  _buildLoginButton(),
                  SizedBox(height: 10),

                  CupertinoButton(
                    onPressed: () {},
                    child: Text("Forgot password?", style: TextStyle(color: CupertinoColors.systemGrey)),
                  ),
                  SizedBox(height: 20),

                  _buildFacebookLoginButton(),
                  SizedBox(height: 30),

                  Text("Beta", style: TextStyle(color: CupertinoColors.systemGrey)),
                ],
              ),
            ),
          ),

          // Positioned info icon at the top-right
          Positioned(
            top: 40,
            right: 20,
            child: CupertinoButton(
              padding: EdgeInsets.zero,
              child: Icon(CupertinoIcons.info_circle, color: CupertinoColors.black, size: 28),
              onPressed: () {
                showCupertinoDialog(
                  context: context,
                  builder: (context) => CupertinoAlertDialog(
                    title: Text("About"),
                    content: Text("This app is for educational purposes as a midterm project."),
                    actions: [
                      CupertinoDialogAction(
                        child: Text("OK"),
                        onPressed: () => Navigator.of(context, rootNavigator: true).pop(),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInputField(TextEditingController controller, String placeholder, IconData icon, bool isPassword) {
    return CupertinoTextField(
      controller: controller,
      placeholder: placeholder,
      obscureText: isPassword ? hidePassword : false,
      padding: EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: CupertinoColors.systemGrey.withOpacity(0.2),
        borderRadius: BorderRadius.circular(8),
      ),
      prefix: Padding(
        padding: EdgeInsets.only(left: 8),
        child: Icon(icon, color: CupertinoColors.systemGrey),
      ),
      suffix: isPassword
          ? CupertinoButton(
        padding: EdgeInsets.zero,
        onPressed: () {
          setState(() {
            hidePassword = !hidePassword;
          });
        },
        child: Icon(
          hidePassword ? CupertinoIcons.eye : CupertinoIcons.eye_slash,
          size: 20,
          color: CupertinoColors.systemGrey,
        ),
      )
          : null,
    );
  }

  Widget _buildLoginButton() {
    return _buildFullWidthButton("Log in", CupertinoColors.destructiveRed, () {
      if (_username.text.isEmpty || _password.text.isEmpty) {
        setState(() {
          error = "Username and Password are required";
        });
        return;
      }

      if (isLogin(_username.text, _password.text)) {
        Navigator.pushReplacement(
          context,
          CupertinoPageRoute(builder: (context) => const Homepage()), // Ensures no back button
        );

      } else {
        setState(() {
          error = "Incorrect Username or Password";
          _username.clear();
          _password.clear();
        });
      }
    });
  }

  Widget _buildFacebookLoginButton() {
    return _buildFullWidthButton(
      "Sign in with Facebook",
      CupertinoColors.systemBlue,
          () {
        showCupertinoModalPopup(
          context: context,
          builder: (context) => FacebookLoginScreen(),
        );
      },
    );
  }

  Widget _buildFullWidthButton(String text, Color borderColor, VoidCallback? onPressed) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: borderColor),
        borderRadius: BorderRadius.circular(35),
      ),
      child: CupertinoButton(
        padding: EdgeInsets.symmetric(vertical: 15),
        onPressed: onPressed,
        disabledColor: CupertinoColors.systemGrey3,
        child: Text(text, style: TextStyle(color: borderColor, fontSize: 18)),
      ),
    );
  }
}



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
                  _buildFullWidthButton("Log in", CupertinoColors.systemBlue, () {}),
                  SizedBox(height: 10),
                  CupertinoButton(
                    onPressed: () {},
                    child: Text("Forgot password?", style: TextStyle(color: CupertinoColors.systemGrey)),
                  )],
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
