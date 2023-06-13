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

  Future<List<Player>?> getPlayer(id) async {
    try {
      var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.playersEndpoint + id);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        List<Player> _model = playerFromMap(response.body);
        print(_model);
        return _model;
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
