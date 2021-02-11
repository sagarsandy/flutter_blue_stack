import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blue_stack/widgets/menu_button_widget.dart';
import 'package:flutter_blue_stack/widgets/player_info_widget.dart';
import 'package:flutter_blue_stack/widgets/player_stats_widget.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
        title: Text(
          "Flyingwolf",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        leading: MenuButtonWidget(),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              // Rendering player info widget
              PlayerInfoWidget(),
              SizedBox(height: 10),
              // Rendering player game stats widget
              PlayerStatsWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
