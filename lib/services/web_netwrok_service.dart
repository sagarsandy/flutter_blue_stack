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
        paginationCursor = jsonData["data"]["cursor"];
        final tournamentsData = jsonData["data"]["tournaments"] as List;
        if (tournamentsData != null) {
          tournaments = tournamentsData
              .map<Tournament>((json) => Tournament.fromJson(json))
              .toList();

          final data = {"tournaments": tournaments, "cursor": paginationCursor};
          return data;
        } else {
          print("No records found");
          final data = {"error": "Tournament data not found!!"};
          return data;
        }
      } else {
        print("Something went wrong, handle error here 1");
        final data = {"error": "Tournament data not found!!"};
        return data;
      }
    } catch (e) {
      print("Something went wrong, handle error here 2");
      print(e.toString());
      final data = {"error": "Tournament data not found!!"};
      return data;
    }
  }

  // Service call to fetch user profile data
  Future<Map> getProfileData(url) async {
    try {
      final response =
          await get("https://sagarflutterdev.mock.pw/api/playerinfo");
      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        Player player = Player.fromJson(jsonData);
        final data = {"player": player};

        return data;
      } else {
        print("Something went wrong, handle error here 3");
        final data = {"error": "Profile data not found!!"};
        return data;
      }
    } catch (e) {
      print("Something went wrong, handle error here 4");
      print(e.toString());
      final data = {"error": "Profile data not found!!"};
      return data;
    }
  }
}
