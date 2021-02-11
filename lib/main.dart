import 'package:flutter/material.dart';
import 'package:flutter_blue_stack/screens/home_screen.dart';
import 'package:flutter_blue_stack/screens/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Blue Stack',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<bool> future;

  @override
  void initState() {
    // TODO: implement initState
    checkLoginStatus();
    super.initState();
  }

  checkLoginStatus() async {
    SharedPreferences spf = await SharedPreferences.getInstance();
    setState(() {
      future = Future.value(spf.getBool('isLoggedIn') ?? false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: future,
      builder: (context, snapShot) {
        return snapShot.data == true ? HomeScreen() : LogInScreen();
      },
    );
  }
}
