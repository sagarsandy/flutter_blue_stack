import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_blue_stack/screens/home_screen.dart';
import 'package:flutter_blue_stack/widgets/textfield_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LogInScreen extends StatefulWidget {
  @override
  _LogInScreenState createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  final TextEditingController userNameTEC = TextEditingController();
  final TextEditingController passwordTEC = TextEditingController();
  final formKey = GlobalKey<FormState>(); // Used for login form
  final GlobalKey<ScaffoldState> signInScaffoldKey =
      GlobalKey<ScaffoldState>(); // Used to display snack bar
  String userName, userPassword;
  bool showSubmitButton = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: signInScaffoldKey,
      backgroundColor: Colors.orange[100],
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Brand logo image
            Image.asset(
              "assets/images/game_logo.png",
              width: 250,
              height: 80,
            ),
            // Login Form widget
            Form(
              key: formKey,
              child: Padding(
                padding: EdgeInsets.only(left: 30, right: 30, top: 10),
                child: Column(
                  children: [
                    // Username Text field widget
                    TextFieldWidget(
                      textEditingController: userNameTEC,
                      hintText: "Username",
                      isSecureData: false,
                      onChanged: (String value) {
                        userName = value;
                        if (value.isStringLengthValid &&
                            userPassword.isStringLengthValid) {
                          setState(() {
                            showSubmitButton = true;
                          });
                        } else {
                          setState(() {
                            showSubmitButton = false;
                          });
                        }
                      },
                      validateFieldValue: (String username) {
                        if (!username.isStringLengthValid) {
                          return "Minimum 3 and maximum 10 characters allowed";
                        }
                        userName = username;
                        return null;
                      },
                    ),
                    SizedBox(height: 15),
                    // Password text field widget
                    TextFieldWidget(
                      textEditingController: passwordTEC,
                      hintText: "Password",
                      isSecureData: true,
                      onChanged: (String value) {
                        userPassword = value;
                        if (value.isStringLengthValid &&
                            userName.isStringLengthValid) {
                          setState(() {
                            showSubmitButton = true;
                          });
                        } else {
                          setState(() {
                            showSubmitButton = false;
                          });
                        }
                      },
                      validateFieldValue: (String password) {
                        if (!password.isStringLengthValid) {
                          return "Minimum 3 and maximum 10 characters allowed";
                        }
                        userPassword = password;
                        return null;
                      },
                    ),
                    SizedBox(height: 20),
                    // Submit button
                    InkWell(
                      splashColor: Colors.deepOrangeAccent,
                      onTap: () {
                        if (showSubmitButton) {
                          validateLoginDetails();
                        }
                      },
                      child: Container(
                        height: 45,
                        width: MediaQuery.of(context).size.width - 60,
                        decoration: BoxDecoration(
                          color: showSubmitButton
                              ? Colors.orangeAccent
                              : Colors.white24,
                          borderRadius: new BorderRadius.circular(40.0),
                        ),
                        child: Center(
                          child: Text(
                            "Submit",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: showSubmitButton
                                  ? Colors.white
                                  : Colors.black45,
                            ),
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
    );
  }

  // Function to validate login details
  validateLoginDetails() {
    FocusScope.of(context).requestFocus(FocusNode());
    if (formKey.currentState.validate()) {
      formKey.currentState.save();
      // Hardcoded list of users to check login
      const List users = [
        {"username": "9898989898", "password": "password"},
        {"username": "9876543210", "password": "password"}
      ];

      users.map((user) {
        if (user["username"] == userName && user["password"] == userPassword) {
          // Calling a method to store login data
          storeLoginData();
          // Redirecting user to dashboard screen
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HomeScreen(),
            ),
          );
          return;
        }
      });
      for (final user in users) {
        if (user["username"] == userName && user["password"] == userPassword) {
          // Calling a method to store login data
          storeLoginData();
          // Redirecting user to dashboard screen
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HomeScreen(),
            ),
          );
          return;
        }
      }
      // Displaying error, if user entered invalid login details
      signInScaffoldKey.currentState.showSnackBar(SnackBar(
          backgroundColor: Colors.red, content: Text("Invalid login details")));
      print("User not found");
    }
  }

  // Storing user login data in shared preferences, so that we can auto login next time
  storeLoginData() async {
    SharedPreferences spf = await SharedPreferences.getInstance();
    spf.setBool("isLoggedIn", true);
  }
}

// String length validation extension
extension StringOperations on String {
  bool get isStringLengthValid {
    if (this.length > 3 && this.length < 11) {
      return true;
    }
    return false;
  }
}
