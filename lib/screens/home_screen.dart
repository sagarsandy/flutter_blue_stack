import 'package:flutter/material.dart';
import 'package:flutter_blue_stack/widgets/events_sliver_list_widget.dart';
import 'package:flutter_blue_stack/widgets/menu_button_widget.dart';
import 'package:flutter_blue_stack/widgets/player_info_widget.dart';
import 'package:flutter_blue_stack/widgets/player_stats_widget.dart';

class HomeScreen extends StatelessWidget {
  final List events = [
    "Bingo boys",
    "Nano Nams",
    "Net beans",
    "Pillow powers",
    "kOkoko ko"
  ];
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: CustomScrollView(
          slivers: [
            // Rendering player info widget
            SliverToBoxAdapter(
              child: PlayerInfoWidget(),
            ),
            // Rendering player stats widget
            SliverToBoxAdapter(
              child: PlayerStatsWidget(),
            ),
            // Rendering recommended label widget
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(top: 12.0, left: 5, bottom: 10),
                child: Text(
                  "Recommended for you",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                ),
              ),
            ),
            // Rendering events sliver list
            EventsSliverListWidget(),
          ],
        ),
      ),
    );
  }
}
