import 'dart:convert';
import 'dart:developer';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:soccerapp/core/models/data/player_model.dart';

import 'constants.dart';

class ApiService {
  Future<List<Player>?> getPlayers() async {
    try {
      var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.playersEndpoint);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        List<Player> _model = playerFromMap(response.body);
        return _model;
      }
    } catch (e) {
      log(e.toString());
    }
  }

  Future<List<dynamic>?> getPlayer(id) async {
    try {
      var url = Uri.parse(
          ApiConstants.baseUrl + ApiConstants.playerEndpoint + id.toString());
      var response = await http.get(url);
      if (response.statusCode == 200) {
        var jsonResponse = json.decode(response.body);
        
        Map<String, dynamic> data = Map<String, dynamic>.from(jsonResponse);

        List<Map<String, dynamic>> model = [data];

        return model;
      }
    } catch (e) {
      log(e.toString());
    }
  }

  Future<List<dynamic>?> getTeam(id) async {
    try {
      var url = Uri.parse(
          ApiConstants.baseUrl + ApiConstants.teamEndpoint + id.toString());
      var response = await http.get(url);
      if (response.statusCode == 200) {
        var jsonResponse = json.decode(response.body);
      
        Map<String, dynamic> data = Map<String, dynamic>.from(jsonResponse);

        List<Map<String, dynamic>> model = [data];

        return model;
      }
    } catch (e) {
      log(e.toString());
    }
  }

  Future<List<dynamic>?> getLeague(id) async {
    try {
      var url = Uri.parse(
          ApiConstants.baseUrl + ApiConstants.leagueEndpoint + id.toString());
      var response = await http.get(url);
      if (response.statusCode == 200) {
        var jsonResponse = json.decode(response.body);

        Map<String, dynamic> data = Map<String, dynamic>.from(jsonResponse);

        List<Map<String, dynamic>> model = [data];

        return model;
      }
    } catch (e) {
      log(e.toString());
    }
  }

  Future<List<dynamic>?> getCountry(id) async {
    try {
      var url = Uri.parse(
          ApiConstants.baseUrl + ApiConstants.countryEndpoint + id.toString());
      var response = await http.get(url);
      if (response.statusCode == 200) {
        var jsonResponse = json.decode(response.body);

        Map<String, dynamic> data = Map<String, dynamic>.from(jsonResponse);

        List<Map<String, dynamic>> model = [data];


        if (kDebugMode) {
          print(model);
        }
        return model;
      }
    } catch (e) {
      log(e.toString());
    }
  }

}
