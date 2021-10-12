import 'dart:core';

import 'package:weather_app/models/clouds.dart';
import 'package:weather_app/models/main.dart';
import 'package:weather_app/models/rain.dart';
import 'package:weather_app/models/sys.dart';
import 'package:weather_app/models/weather.dart';
import 'package:weather_app/models/wind.dart';

class ListWeather {
  int? dt;
  Main? main;
  List<Weather>? weather;
  Clouds? clouds;
  Wind? wind;
  int? visibility;
  num? pop;
  Sys? sys;
  String? dtTxt;
  Rain? rain;

  ListWeather(
      {this.dt,
      this.main,
      this.weather,
      this.clouds,
      this.wind,
      this.visibility,
      this.pop,
      this.sys,
      this.dtTxt,
      this.rain});

  ListWeather.fromJson(Map<String, dynamic> json) {
    dt = json['dt'];
    main = (json['main'] != null ? new Main.fromJson(json['main']) : null)!;
    if (json['weather'] != null) {
      weather = List.empty(growable: true);
      json['weather'].forEach((v) {
        weather!.add(new Weather.fromJson(v));
      });
    }
    clouds =
        (json['clouds'] != null ? new Clouds.fromJson(json['clouds']) : null)!;
    wind = (json['wind'] != null ? new Wind.fromJson(json['wind']) : null)!;
    visibility = json['visibility'];
    pop = json['pop'];
    sys = (json['sys'] != null ? new Sys.fromJson(json['sys']) : null)!;
    dtTxt = json['dt_txt'];
    rain = (json['rain'] == null ? null : new Rain.fromJson(json['rain']));
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['dt'] = this.dt;
    if (this.main != null) {
      data['main'] = this.main!.toJson();
    }
    if (this.weather != null) {
      data['weather'] = this.weather!.map((v) => v.toJson()).toList();
    }
    if (this.clouds != null) {
      data['clouds'] = this.clouds!.toJson();
    }
    if (this.wind != null) {
      data['wind'] = this.wind!.toJson();
    }
    data['visibility'] = this.visibility;
    data['pop'] = this.pop;
    if (this.sys != null) {
      data['sys'] = this.sys!.toJson();
    }
    data['dt_txt'] = this.dtTxt;
    if (this.rain != null) {
      data['rain'] = this.rain!.toJson();
    }
    return data;
  }
}
