import 'package:flutter/cupertino.dart';
import 'package:members_lists/homepage.dart';

void main() {
  runApp(CupertinoApp(
    theme: CupertinoThemeData(brightness: Brightness.dark),
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // Controllers
  TextEditingController _username = TextEditingController();
  TextEditingController _password = TextEditingController();

  bool hidePassword = true;
  String error = "";

  bool isLogin(String username, String password) {
    if (username == "admin" && password == "123") {
      setState(() {
        _username.text = "";
        _password.text = "";
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
        child: CupertinoScrollbar(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 40),

                SizedBox(height: 30),

                Icon(CupertinoIcons.camera, size: 80, color: CupertinoColors.systemPink),

                SizedBox(height: 30),

                CupertinoTextField(
                  controller: _username,
                  placeholder: "Username, email or mobile number",
                  padding: EdgeInsets.all(14),
                  style: TextStyle(color: CupertinoColors.white),
                  prefix: Padding(
                    padding: EdgeInsets.only(left: 8),
                    child: Icon(CupertinoIcons.person, color: CupertinoColors.systemGrey),
                  ),
                  decoration: BoxDecoration(
                    color: CupertinoColors.systemGrey.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),

                SizedBox(height: 10),

                CupertinoTextField(
                  controller: _password,
                  placeholder: "Password",
                  padding: EdgeInsets.all(14),
                  obscureText: hidePassword,
                  style: TextStyle(color: CupertinoColors.white),
                  prefix: Padding(
                    padding: EdgeInsets.only(left: 8),
                    child: Icon(CupertinoIcons.padlock_solid, color: CupertinoColors.systemGrey),
                  ),
                  decoration: BoxDecoration(
                    color: CupertinoColors.systemGrey.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  suffix: CupertinoButton(
                    padding: EdgeInsets.zero,
                    child: Icon(
                      hidePassword ? CupertinoIcons.eye : CupertinoIcons.eye_slash,
                      color: CupertinoColors.systemGrey,
                      size: 20,
                    ),
                    onPressed: () {
                      setState(() {
                        hidePassword = !hidePassword;
                      });
                    },
                  ),
                ),

                SizedBox(height: 20),

                Container(
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    color: CupertinoColors.systemBlue,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: CupertinoButton(
                    child: Text(
                      "Log in",
                      style: TextStyle(color: CupertinoColors.white, fontSize: 18),
                    ),
                    onPressed: () {
                      isLogin(_username.text, _password.text)
                          ? Navigator.pushReplacement(
                        context,
                        CupertinoPageRoute(builder: (context) => Homepage()),
                      )
                          : setState(() {
                        _username.text = "";
                        _password.text = "";
                        error = "Incorrect Username or Password";
                      });
                    },
                  ),
                ),

                SizedBox(height: 10),

                CupertinoButton(
                  child: Text("Forgot password?", style: TextStyle(color: CupertinoColors.systemGrey)),
                  onPressed: () {},
                ),

                Text(
                  error,
                  style: TextStyle(color: CupertinoColors.destructiveRed),
                ),




                Container(
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    border: Border.all(color: CupertinoColors.systemGrey),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: CupertinoButton(
                    child: Text(
                      "Create new account",
                      style: TextStyle(color: CupertinoColors.white, fontSize: 18),
                    ),
                    onPressed: () {},
                  ),
                ),
                SizedBox(height: 30),

                Text("Meta", style: TextStyle(color: CupertinoColors.systemGrey)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
