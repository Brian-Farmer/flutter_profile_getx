import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:profile_try_1/model/profil_model.dart';
import 'package:http/http.dart' as http;

class RemoteServices {
  static var client = http.Client();
  static Future<List<Profil>> fetchProfil() async {
    http.Response response =
    await client.get(Uri.https("testerinooooo.bplaced.net", "/profil.json/"));

    if (response.statusCode == 200) {
      var result = profilFromJson(response.body);
      return result;
    } else {
      return [];
    }
  }

  // Loading from Assets

  static Future<List<Profil>> fetchProfileFromAssets() async {
    String jsonString = await rootBundle.loadString("../assets/profil.json");

    var result = profilFromJson(jsonString);
    return result;
  }
}
