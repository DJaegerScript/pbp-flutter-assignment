import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:pbp_assignment_flutter/models/watchlist_model.dart';
import 'package:path/path.dart' as path;

class WatchListService {
  static const String baseUrl = 'https://pbp-assigments-adjie.herokuapp.com';

  static Future httpFetch(String endpoint) async {
    Uri url = Uri.parse(path.join(baseUrl, endpoint));

    Map<String, String> headers = {
      "Access-Control-Allow-Origin": "*",
      "Content-Type": "application/json",
    };

    Response response = await http.get(url, headers: headers);

    return jsonDecode(utf8.decode(response.bodyBytes));
  }

  static Future<List<WatchList>> getAllWatchList() async {
    List<dynamic> responses = await httpFetch('mywatchlist/json');

    List<WatchList> watchLists = [];

    for (var response in responses) {
      if (response != null) {
        watchLists.add(WatchList.fromJson(response));
      }
    }

    return watchLists;
  }

  static Future<WatchList> getWatchList(int id) async {
    List<dynamic> responses = await httpFetch('mywatchlist/json/$id');

    WatchList watchList = WatchList.fromJson(responses[0]);

    return watchList;
  }

  static Future<WatchList> updateWatchList(int id) async {
    List<dynamic> responses = await httpFetch('mywatchlist/json/update/$id');

    WatchList watchList = WatchList.fromJson(responses[0]);

    return watchList;
  }
}
