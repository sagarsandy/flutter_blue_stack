import 'package:flutter/material.dart';
import 'package:flutter_blue_stack/screens/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LogInValidationService {
  validateLoginDetails(
      BuildContext context, String userName, String userPassword) {
    // Hardcoded list of users to check login
    const List users = [
      {"username": "9898989898", "password": "password"},
      {"username": "9876543210", "password": "password"}
    ];

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
        return true;
      }
    }
    return false;
  }

  // Storing user login data in shared preferences, so that we can auto login next time
  storeLoginData() async {
    SharedPreferences spf = await SharedPreferences.getInstance();
    spf.setBool("isLoggedIn", true);
  }
}
