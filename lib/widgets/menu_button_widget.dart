import 'package:flutter/material.dart';
import 'package:flutter_blue_stack/screens/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MenuButtonWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        SharedPreferences spf = await SharedPreferences.getInstance();
        spf.remove('isLoggedIn');
        if (Navigator.canPop(context)) {
          Navigator.of(context).pop();
        } else {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => LogInScreen(),
            ),
          );
        }
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 10.0, top: 19),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 17,
              child: Divider(
                height: 3,
                thickness: 3.0,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 9),
            Container(
              width: 30,
              child: Divider(
                height: 3,
                thickness: 3.0,
                color: Colors.black87,
              ),
            )
          ],
        ),
      ),
    );
  }
}
