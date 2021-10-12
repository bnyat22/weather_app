import 'package:weather_app/models/cord.dart';

class City {
 late  int id;
 late String name;
 late Coord coord;
 late String country;
 late int population;
 late int timezone;
 late int sunrise;
 late int sunset;

  City(
      {required this.id,
     required this.name,
     required this.coord,
     required this.country,
     required this.population,
     required this.timezone,
     required this.sunrise,
     required this.sunset});

  City.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    coord = (json['coord'] != null ? new Coord.fromJson(json['coord']) : null)!;
    country = json['country'];
    population = json['population'];
    timezone = json['timezone'];
    sunrise = json['sunrise'];
    sunset = json['sunset'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    if (this.coord != null) {
      data['coord'] = this.coord.toJson();
    }
    data['country'] = this.country;
    data['population'] = this.population;
    data['timezone'] = this.timezone;
    data['sunrise'] = this.sunrise;
    data['sunset'] = this.sunset;
    return data;
  }
}