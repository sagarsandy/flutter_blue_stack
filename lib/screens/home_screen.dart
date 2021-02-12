import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_blue_stack/services/player_provider_service.dart';
import 'package:flutter_blue_stack/widgets/events_sliver_list_widget.dart';
import 'package:flutter_blue_stack/widgets/loader_widget.dart';
import 'package:flutter_blue_stack/widgets/menu_button_widget.dart';
import 'package:flutter_blue_stack/widgets/player_details_widget.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ScrollController _scrollController = ScrollController();
  bool showLoader = false;
  Map<String, dynamic> playerProfileData = {};

  @override
  void initState() {
    loadTournamentsData();
    loadUserProfileData();
    _scrollController.addListener(() {
      if (_scrollController.position.atEdge) {
        if (_scrollController.position.pixels == 0) {
          // Top
          print("Top Scroller");
        } else {
          setState(() {
            showLoader = true;
            loadTournamentsData();
          });
        }
      }
    });

    super.initState();
  }

  loadTournamentsData() {
    Timer(Duration(microseconds: 10), () {
      Provider.of<PlayerProviderService>(context, listen: false)
          .getTournamentsData();
    });
  }

  loadUserProfileData() {
    Timer(Duration(microseconds: 5), () {
      Provider.of<PlayerProviderService>(context, listen: false)
          .getPlayerData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFF9F9F9),
      appBar: AppBar(
        backgroundColor: Color(0XFFF9F9F9),
        centerTitle: true,
        elevation: 0,
        title: Text(
          "Flyingwolf",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        leading: MenuButtonWidget(),
      ),
      body: Consumer<PlayerProviderService>(
        builder: (context, playerNotifyProvider, _) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: CustomScrollView(
              controller: _scrollController,
              slivers: [
                playerNotifyProvider.currentPlayer != null
                    ? SliverToBoxAdapter(
                        child: PlayerDetailsWidget(
                            player: playerNotifyProvider.currentPlayer),
                      )
                    : LoaderWidget("....."),
                // Rendering recommended label widget
                SliverToBoxAdapter(
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 12.0, left: 5, bottom: 10),
                    child: Text(
                      "Recommended for you",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                playerNotifyProvider.tournaments.length > 0
                    ? EventsSliverListWidget(playerNotifyProvider.tournaments)
                    : LoaderWidget("Loading"),
                // Display loader
                if (showLoader) LoaderWidget("Loading..."),
              ],
            ),
          );
        },
      ),
    );
  }
}
