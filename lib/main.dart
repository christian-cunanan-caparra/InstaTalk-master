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
    Future.delayed( Duration(seconds: 3), () {
      if (mounted) {
        Navigator.pushReplacement(context, CupertinoPageRoute(builder: (context) =>  MyApp()),
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
            Image.asset("images/logo.png", width: 150, fit: BoxFit.cover)



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
  bool showGarenaScreen = false;
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
      child: SafeArea(child: Center(
          child: Padding(
            padding:  EdgeInsets.all(20),
            child: AnimatedSwitcher(
              duration:  Duration(milliseconds: 500),
              child: isLoading
                  ?  CupertinoActivityIndicator(radius: 20, key: ValueKey("loading"))
                  : Column(
                key: ValueKey("content"),
                children: [
                  showGarenaScreen ? _buildGarenaScreen() : _buildLoginScreen(),
                ],
              ),
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

             CircleAvatar(radius: 50, backgroundImage:
             AssetImage("images/ChristianCaparra.jpg"),
            ),

             SizedBox(height: 30),

            _buildInputField(_username, "Username, email or mobile number", CupertinoIcons.person, false),

             SizedBox(height: 10),

            _buildInputField(_password, "Password", CupertinoIcons.padlock_solid, true),

             SizedBox(height: 20),

            _buildLoginButton(),

             SizedBox(height: 10),

            CupertinoButton(
              onPressed: () {},
              child:  Text("Forgot password?", style: TextStyle(color: CupertinoColors.systemGrey)),
            ),
            Text(error, style:  TextStyle(color: CupertinoColors.destructiveRed)),

             SizedBox(height: 20),

            _buildFacebookLoginButton(),

             SizedBox(height: 30),

             Text("Beta", style: TextStyle(color: CupertinoColors.systemGrey)),
          ],
        ),
      ),
    );
  }


  Widget _buildGarenaScreen() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [

         SizedBox(height: 50),

         CircleAvatar(
          radius: 50,
          backgroundImage:
          AssetImage("images/ChristianCaparra.jpg"),
        ),


         SizedBox(height: 30),

         Text("Welcome to Barena", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),


         SizedBox(height: 10),


         Center(
          child: Text("Do you want to link to an existing Barena account?", textAlign: TextAlign.center,
          ),
        ),

         SizedBox(height: 20),

        _buildFullWidthButton("Yes", CupertinoColors.systemRed, () {}),

         SizedBox(height: 10),

        _buildFullWidthButton("No, sign up a new Barena account", CupertinoColors.systemGrey, () {}),

         SizedBox(height: 20),


        CupertinoButton(
          onPressed: () {
            setState(() {
              showGarenaScreen = false;
            });
          },

          child:  Text("Back to Log In", style: TextStyle(color: CupertinoColors.systemGrey2),
          ),
        ),
      ],
    );
  }


  Widget _buildInputField(TextEditingController controller, String placeholder, IconData icon, bool isPassword) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 20),
      child: CupertinoTextField(
        controller: controller,
        placeholder: placeholder,
        obscureText: isPassword ? hidePassword : false,
        padding:  EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: CupertinoColors.systemGrey.withOpacity(0.2),
          borderRadius: BorderRadius.circular(8),
        ),
        prefix: Padding(
          padding:  EdgeInsets.only(left: 8),
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
          child: Icon(hidePassword ? CupertinoIcons.eye : CupertinoIcons.eye_slash, size: 20, color: CupertinoColors.systemGrey,
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
        Navigator.pushReplacement(context, CupertinoPageRoute(builder: (context) => const Homepage()),
        );
      } else {
        setState(() {
          error = "Incorrect Username or Password";
        });
      }
    });
  }


  Widget _buildFacebookLoginButton() {
    return
      _buildFullWidthButton("Sign in with Facebook", CupertinoColors.systemBlue,
      isLoading ? null : () {
        setState(() {
          showGarenaScreen = false;
          isLoading = true;
        });

        Future.delayed(const Duration(seconds: 3), () {
          if (mounted) {
            setState(() {
              isLoading = false;
              showGarenaScreen = true;
            });
          }
        });
      },
    );
  }

  Widget _buildFullWidthButton(String text, Color borderColor, VoidCallback? onPressed) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(color: borderColor),
          borderRadius: BorderRadius.circular(35),
        ),
        child: CupertinoButton(
          padding:  EdgeInsets.symmetric(vertical: 15),
          onPressed: onPressed,
          disabledColor: CupertinoColors.systemGrey3,
          child: Text(text, style: TextStyle(color: borderColor, fontSize: 18)),
        ),
      ),
    );
  }
}




























