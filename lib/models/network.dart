import 'dart:convert';

import 'package:http/http.dart';
import 'package:weather_app/models/weatherMap.dart';

class Network {
  Future<Weathermap> getWeatherForecast({required String cityName}) async {
    var finalUrl = "http://api.openweathermap.org/data/2.5/forecast?q=" +
        cityName +
        "&APPID=8c56269822dbe2299cf7c85dda571e1c";
    final reponse = await get(Uri.parse(finalUrl));
    if (reponse.statusCode == 200) {
      print("ob" + reponse.body);
      return Weathermap.fromJson(jsonDecode(reponse.body));
    } else {
      throw Exception("error");
    }
  }
}
