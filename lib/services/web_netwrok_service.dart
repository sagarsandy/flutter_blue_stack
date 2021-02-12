import 'dart:async';

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
      final response = await get(url).timeout(Duration(seconds: 30));
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
          final data = {"error": "11 Tournament data not found!!"};
          return data;
        }
      } else {
        print("Something went wrong, handle error here 1");
        final data = {"error": " 12 Tournament data not found!!"};
        return data;
      }
    } on TimeoutException catch (e) {
      print("Something went wrong, handle error here 2");
      print(e.toString());
      final data = {"error": "Network timeout!!"};
      return data;
    } on Error catch (e) {
      print("Something went wrong, handle error here 2");
      print(e.toString());
      final data = {"error": e.toString()};
      return data;
    }
  }

  // Service call to fetch user profile data
  Future<Map> getProfileData(url) async {
    try {
      final response = await get(
              "https://6026b9eb186b4a0017780865.mockapi.io/api/v1/player/1")
          .timeout(const Duration(seconds: 30));
      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        Player player = Player.fromJson(jsonData);
        final data = {"player": player};

        return data;
      } else {
        print("Something went wrong, handle error here 3");
        final data = {"error": " 22 Profile data not found!!"};
        return data;
      }
    } on TimeoutException catch (e) {
      print("Something went wrong, network time out");
      print(e.toString());
      final data = {"error": "Network timeout!!"};
      return data;
    } on Error catch (e) {
      print("Something went wrong, handle error here 4");
      print(e.toString());
      final data = {"error": e.toString()};
      return data;
    }
  }
}
