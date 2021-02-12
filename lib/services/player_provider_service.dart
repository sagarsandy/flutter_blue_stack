import 'package:flutter/material.dart';
import 'package:flutter_blue_stack/models/player.dart';
import 'package:flutter_blue_stack/models/tournament.dart';
import 'package:flutter_blue_stack/services/web_netwrok_service.dart';

class PlayerProviderService extends ChangeNotifier {
  List<Tournament> tournaments = [];
  String paginationToken = '';
  Player currentPlayer = null;

  // Service call to fetch player profile info data
  getPlayerData(GlobalKey<ScaffoldState> scaffoldKey) async {
    print("Called get player data function");
    Map<String, dynamic> playerData = await WebNetworkService()
        .getProfileData("https://sagarflutterdev.mock.pw/api/playerinfo");

    if (playerData.containsKey("player")) {
      currentPlayer = playerData["player"];
      notifyListeners();
    } else {
      // Displaying error, if there is any issue in fetching data
      scaffoldKey.currentState.showSnackBar(SnackBar(
          backgroundColor: Colors.red, content: Text(playerData["error"])));
    }
  }

  // Service call to fetch player tournaments info data
  getTournamentsData(GlobalKey<ScaffoldState> scaffoldKey) async {
    print("Called get tournaments function");
    print(paginationToken);
    final url =
        "http://tournaments-dot-game-tv-prod.uc.r.appspot.com/tournament/api/tournaments_list_v2?limit=5&status=all&cursor=" +
            paginationToken;
    Map<String, dynamic> tournamentsData =
        await WebNetworkService().getTournaments(url);
    if (tournamentsData.containsKey("tournaments")) {
      paginationToken = tournamentsData["cursor"];
      tournaments.addAll(tournamentsData["tournaments"]);
      notifyListeners();
    } else {
      // Displaying error, if there is any issue in fetching data
      scaffoldKey.currentState.showSnackBar(SnackBar(
          backgroundColor: Colors.red,
          content: Text(tournamentsData["error"])));
    }
  }
}
