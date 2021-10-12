import 'package:flutter/material.dart';
import 'package:weather_app/models/weatherMap.dart';

class SearchBarState extends ChangeNotifier {
  String name;
  String date = "";
  bool folded = true;
  String main = "images/g.gif";
  String one = "images/g.gif";
  String two = "images/rai.gif";
  String three = "images/sno.gif";
  String four = "images/lightning.gif";

  num temp = 0;
  num tempOneH = 0;
  num tempOneL = 0;
  num tempTwoH = 0;
  num tempTwoL = 0;
  num tempThreeH = 0;
  num tempThreeL = 0;
  num tempFourH = 0;
  num tempFourL = 0;

  String description = "";
  num hum = 0;
  num humOne = 0;
  num humTwo = 0;
  num humThree = 0;
  num humFour = 0;
  num wind = 0;
  num windOne = 0;
  num windTwo = 0;
  num windThree = 0;
  num windFour = 0;
  SearchBarState({required this.name});
  search(Weathermap weather) {
    this.name = weather.city!.name + "," + weather.city!.country;
    this.date = weather.list![0].dtTxt!.split(" ")[0];

    checkMainWeather(weather);

    temp = ((weather.list![0].main!.temp - 279) * 9 / 5 + 32).round();
    tempOneH = ((weather.list![7].main!.tempMax - 279) * 9 / 5 + 32).round();
    tempOneL = ((weather.list![7].main!.tempMin - 279) * 9 / 5 + 32).round();
    tempFourH = ((weather.list![14].main!.tempMax - 279) * 9 / 5 + 32).round();
    tempFourL = ((weather.list![14].main!.tempMin - 279) * 9 / 5 + 32).round();
    tempThreeH = ((weather.list![21].main!.tempMax - 279) * 9 / 5 + 32).round();
    tempThreeL = ((weather.list![21].main!.tempMin - 279) * 9 / 5 + 32).round();
    tempTwoH = ((weather.list![28].main!.tempMax - 279) * 9 / 5 + 32).round();
    tempTwoL = ((weather.list![28].main!.tempMin - 279) * 9 / 5 + 32).round();
    description = weather.list![0].weather![0].description;
    hum = weather.list![0].main!.humidity;
    humOne = weather.list![7].main!.humidity;
    humTwo = weather.list![14].main!.humidity;
    humThree = weather.list![21].main!.humidity;
    humFour = weather.list![28].main!.humidity;

    wind = weather.list![0].wind!.speed;
    windOne = weather.list![7].wind!.speed;
    windTwo = weather.list![14].wind!.speed;
    windThree = weather.list![21].wind!.speed;
    windFour = weather.list![28].wind!.speed;

    notifyListeners();
  }

  fold() {
    this.folded ? folded = false : folded = true;
    notifyListeners();
  }

  void checkMainWeather(Weathermap weather) {
    for (int i = 0; i < 5; i++) {
      switch (weather.list![i].weather![0].main) {
        case "Clouds":
          i == 0
              ? this.main = "images/g.gif"
              : i == 1
                  ? this.one = "images/g.gif"
                  : i == 2
                      ? this.two = "images/g.gif"
                      : i == 3
                          ? this.three = "images/g.gif"
                          : this.four = "images/g.gif";
          break;
        case "Partly Clouds":
          i == 0
              ? this.main = "images/g.gif"
              : i == 1
                  ? this.one = "images/g.gif"
                  : i == 2
                      ? this.two = "images/g.gif"
                      : i == 3
                          ? this.three = "images/g.gif"
                          : this.four = "images/g.gif";
          break;
        case "Snow":
          i == 0
              ? this.main = "images/sno.gif"
              : i == 1
                  ? this.one = "images/sno.gif"
                  : i == 2
                      ? this.two = "images/sno.gif"
                      : i == 3
                          ? this.three = "images/sno.gif"
                          : this.four = "images/sno.gif";
          break;
        case "Rain":
          i == 0
              ? this.main = "images/rai.gif"
              : i == 1
                  ? this.one = "images/rai.gif"
                  : i == 2
                      ? this.two = "images/rai.gif"
                      : i == 3
                          ? this.three = "images/rai.gif"
                          : this.four = "images/rai.gif";
          break;
        case "Clear":
          i == 0
              ? this.main = "images/sun.gif"
              : i == 1
                  ? this.one = "images/sun.gif"
                  : i == 2
                      ? this.two = "images/sun.gif"
                      : i == 3
                          ? this.three = "images/sun.gif"
                          : this.four = "images/sun.gif";
          break;
        case "Windy":
          i == 0
              ? this.main = "images/win.gif"
              : i == 1
                  ? this.one = "images/win.gif"
                  : i == 2
                      ? this.two = "images/win.gif"
                      : i == 3
                          ? this.three = "images/win.gif"
                          : this.four = "images/win.gif";
          break;
        case "Lightning":
          i == 0
              ? this.main = "images/lightning.gif"
              : i == 1
                  ? this.one = "images/lightning.gif"
                  : i == 2
                      ? this.two = "images/lightning.gif"
                      : i == 3
                          ? this.three = "images/lightning.gif"
                          : this.four = "images/lightning.gif";
          break;
        default:
          i == 0
              ? this.main = "images/g.gif"
              : i == 1
                  ? this.one = "images/g.gif"
                  : i == 2
                      ? this.two = "images/g.gif"
                      : i == 3
                          ? this.three = "images/g.gif"
                          : this.four = "images/g.gif";
      }
    }
  }

  void checkMainWeatherTomorrow(String main) {
    switch (main) {
      case "Clouds":
        this.main = "images/g.gif";
        break;
      case "Partly Clouds":
        this.main = "images/g.gif";
        break;
      case "Snow":
        this.main = "images/sno.gif";
        break;
      case "Rain":
        this.main = "images/rai.gif";
        break;
      case "Clear":
        this.main = "images/sun.gif";
        break;
      case "Windy":
        this.main = "images/win.gif";
        break;
      case "Lightning":
        this.main = "images/lightning.gif";
        break;
      default:
        this.main = "images/g.gif";
    }
  }
}
