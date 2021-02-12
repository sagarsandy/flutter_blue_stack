import 'package:flutter_blue_stack/models/player.dart';
import 'package:flutter_blue_stack/models/tournament.dart';
import 'package:http/http.dart';
import 'dart:convert';

class WebNetworkService {
  // Service call to fetch user tournaments data
  Future<Map> getTournaments(url) async {
    List<Tournament> tournaments = [];
    String paginationCursor = '';
    try {
      final response = await get(url);
      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        print(jsonData['data']['tournaments']);
        paginationCursor = jsonData["data"]["cursor"];
        final tournamentsData = jsonData["data"]["tournaments"] as List;
        if (tournamentsData != null) {
          // print(tournamentsData);
          tournaments = tournamentsData
              .map<Tournament>((json) => Tournament.fromJson(json))
              .toList();

          final data = {"tournaments": tournaments, "cursor": paginationCursor};
          return data;
        } else {
          print("No records found");
        }
      } else {
        print("Something went wrong, handle error here 1");
      }
    } catch (e) {
      print("Something went wrong, handle error here 2");
      print(e.toString());
    }
    print("API call failed");
    return null;
  }

  // Service call to fetch user profile data
  Future<Player> getProfileData(url) async {
    try {
      final response =
          await get("https://sagarflutterdev.mock.pw/api/playerinfo");
      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        print(jsonData);
        Player player = Player.fromJson(jsonData);
        print(player);
        return player;
      } else {
        print("Something went wrong, handle error here 3");
      }
    } catch (e) {
      print("Something went wrong, handle error here 4");
      print(e.toString());
    }
    print("API call failed 2");
    return null;
  }
}
