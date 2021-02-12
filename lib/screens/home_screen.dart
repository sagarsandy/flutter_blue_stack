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
  final GlobalKey<ScaffoldState> homeScreenScaffoldKey =
      GlobalKey<ScaffoldState>();

  @override
  void initState() {
    loadTournamentsData();
    loadUserProfileData();
    handleScrollEvents();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: homeScreenScaffoldKey,
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
                // Rendering player details(profile) widget, if no data available then we r showing a loader
                if (playerNotifyProvider.currentPlayer != null)
                  SliverToBoxAdapter(
                    child: PlayerDetailsWidget(
                        player: playerNotifyProvider.currentPlayer),
                  )
                else
                  LoaderWidget("....."),
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
                // Rendering tournaments list widget, if no tournaments, then we r shwoing laoder
                if (playerNotifyProvider.tournaments.length > 0)
                  EventsSliverListWidget(playerNotifyProvider.tournaments)
                else
                  LoaderWidget("Loading"),
                // Displaying loader for loading more tournaments on pagination
                if (showLoader) LoaderWidget("Loading..."),
              ],
            ),
          );
        },
      ),
    );
  }

  // Service call to fetch player tournaments data
  loadTournamentsData() {
    Timer(Duration(milliseconds: 1), () {
      Provider.of<PlayerProviderService>(context, listen: false)
          .getTournamentsData(homeScreenScaffoldKey);
    });
  }

  // Service call to fetch player profile data
  loadUserProfileData() {
    Timer(Duration(milliseconds: 1), () {
      Provider.of<PlayerProviderService>(context, listen: false)
          .getPlayerData(homeScreenScaffoldKey);
    });
  }

  // Handling scroll events to load more data on scroll(pagination)
  handleScrollEvents() {
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
  }
}
