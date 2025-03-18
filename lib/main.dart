import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:members_lists/homepage.dart';
import 'dart:async';

void main() {
  runApp(
    CupertinoApp(
      debugShowCheckedModeBanner: false,
      theme: CupertinoThemeData(brightness: Brightness.light),
      home: SplashScreen(),
    ),
  );
}

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
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("images/logo.png", width: 150, fit: BoxFit.cover),
          ],
        ),
      ),
    );
  }
}

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
  bool isLoading = false;

  bool isLogin(String username, String password) {
    if (username == "admin" && password == "123") {
      setState(() {
        _username.clear();
        _password.clear();
        error = "";
      });
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: SafeArea(
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Stack(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildLoginScreen(),
                  ],
                ),

                /// Info Icon (Top-Right Corner)
                Positioned(
                  top: 10,
                  right: 10,
                  child: CupertinoButton(
                    padding: EdgeInsets.zero,
                    child: Icon(CupertinoIcons.info_circle, size: 28, color: CupertinoColors.systemGrey),
                    onPressed: () {
                      _showInfoDialog();
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLoginScreen() {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 50),
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage("images/ChristianCaparra.jpg"),
            ),
            SizedBox(height: 30),

            /// Display Default Login Credentials
            Text(
              "Username: admin\nPassword: 123",
              style: TextStyle(color: CupertinoColors.systemGrey, fontSize: 16),
              textAlign: TextAlign.center,
            ),

            SizedBox(height: 20),
            _buildInputField(_username, "Username, email or mobile number", CupertinoIcons.person, false),
            SizedBox(height: 10),
            _buildInputField(_password, "Password", CupertinoIcons.padlock_solid, true),
            SizedBox(height: 20),
            _buildLoginButton(),
            SizedBox(height: 10),

            CupertinoButton(
              onPressed: () {},
              child: Text("Forgot password?", style: TextStyle(color: CupertinoColors.systemGrey)),
            ),
            Text(error, style: TextStyle(color: CupertinoColors.destructiveRed)),
            SizedBox(height: 20),

            _buildFacebookLoginButton(),
            SizedBox(height: 30),

            Text("Beta", style: TextStyle(color: CupertinoColors.systemGrey)),
          ],
        ),
      ),
    );
  }

  Widget _buildInputField(TextEditingController controller, String placeholder, IconData icon, bool isPassword) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: CupertinoTextField(
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
      ),
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
          CupertinoPageRoute(builder: (context) => const Homepage()),
        );
      } else {
        setState(() {
          error = "Incorrect Username or Password";
        });
      }
    });
  }

  Widget _buildFacebookLoginButton() {
    return _buildFullWidthButton(
      "Sign in with Facebook",
      CupertinoColors.systemBlue,
      isLoading
          ? null
          : () {
        setState(() {
          isLoading = true;
        });

        Future.delayed(Duration(seconds: 3), () {
          if (mounted) {
            setState(() {
              isLoading = false;
            });
          }
        });
      },
    );
  }

  Widget _buildFullWidthButton(String text, Color borderColor, VoidCallback? onPressed) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Container(
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
      ),
    );
  }

  /// Info Dialog - Educational Purpose & Copyright
  void _showInfoDialog() {
    showCupertinoDialog(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: Text("Educational Purpose Only"),
        content: Column(
          children: [
            Text(
              "This application is for educational purposes only. It does not intend to infringe on any copyrights.",
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10),
            Text(
              "⚠ Copyrights by:\n• PlayStore\n• Garena\n• League of Legends\n• Call of Duty\n• Free Fire\n• Point Blank\n• PUBG\n• Fortnite\n• Clash Royale\n• Minecraft\n• Among Us\n• Roblox",
              style: TextStyle(fontSize: 14),
              textAlign: TextAlign.center,
            ),
          ],
        ),
        actions: [
          CupertinoDialogAction(
            child: Text("OK"),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }
}
