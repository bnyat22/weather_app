import 'package:weather_app/models/ListWeather.dart';
import 'package:weather_app/models/city.dart';

class Weathermap {
  late String? cod;
  late int? message;
  late int? cnt;
  late List<ListWeather>? list;
  late City? city;

  Weathermap({this.cod, this.message, this.cnt, this.list, this.city});

  Weathermap.fromJson(Map<String, dynamic> json) {
    cod = json['cod'];
    message = json['message'];
    cnt = json['cnt'];
    if (json['list'] != null) {
      list = List.empty(growable: true);
      json['list'].forEach((v) {
        list!.add(new ListWeather.fromJson(v));
      });
    }
    city = json['city'] != null ? new City.fromJson(json['city']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cod'] = this.cod;
    data['message'] = this.message;
    data['cnt'] = this.cnt;
    if (this.list != null) {
      data['list'] = this.list!.map((v) => v.toJson()).toList();
    }
    if (this.city != null) {
      data['city'] = this.city!.toJson();
    }
    return data;
  }
}
