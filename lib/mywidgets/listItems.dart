import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/providers/SearchBarState.dart';

class ListItems extends StatelessWidget {
  final int number;
  const ListItems({required this.number});

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = TextStyle(color: Colors.white);
    return Container(
      width: 160,
      child: Stack(
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                "images/sky.jpg",
              )),
          Positioned(
              top: 20,
              left: 10,
              child: Container(
                width: 100,
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.white),
                child: Image.asset(number == 1
                    ? Provider.of<SearchBarState>(context).one
                    : number == 2
                        ? Provider.of<SearchBarState>(context).two
                        : number == 3
                            ? Provider.of<SearchBarState>(context).three
                            : Provider.of<SearchBarState>(context).four),
              )),
          Positioned(
            top: 35,
            left: 120,
            child: Text(
              number == 1
                  ? Provider.of<SearchBarState>(context).tempOneH.toString() +
                      "°F"
                  : number == 2
                      ? Provider.of<SearchBarState>(context)
                              .tempTwoH
                              .toString() +
                          "°F"
                      : number == 3
                          ? Provider.of<SearchBarState>(context)
                                  .tempThreeH
                                  .toString() +
                              "°F"
                          : Provider.of<SearchBarState>(context)
                                  .tempFourH
                                  .toString() +
                              "°F",
              style: textStyle,
            ),
          ),
          Positioned(
            top: 55,
            left: 120,
            child: Text(
              number == 1
                  ? Provider.of<SearchBarState>(context).tempOneL.toString() +
                      "°F"
                  : number == 2
                      ? Provider.of<SearchBarState>(context)
                              .tempTwoL
                              .toString() +
                          "°F"
                      : number == 3
                          ? Provider.of<SearchBarState>(context)
                                  .tempThreeL
                                  .toString() +
                              "°F"
                          : Provider.of<SearchBarState>(context)
                                  .tempFourL
                                  .toString() +
                              "°F",
              style: textStyle,
            ),
          ),
          Positioned(
            top: 75,
            left: 95,
            child: Text(
              number == 1
                  ? "Hum: " +
                      Provider.of<SearchBarState>(context).humOne.toString() +
                      "%"
                  : number == 2
                      ? "Hum: " +
                          Provider.of<SearchBarState>(context)
                              .humTwo
                              .toString() +
                          "%"
                      : number == 3
                          ? "Hum: " +
                              Provider.of<SearchBarState>(context)
                                  .humThree
                                  .toString() +
                              "%"
                          : "Hum: " +
                              Provider.of<SearchBarState>(context)
                                  .humFour
                                  .toString() +
                              "%",
              style: textStyle,
            ),
          ),
          Positioned(
            top: 95,
            left: 70,
            child: Text(
              number == 1
                  ? "Win: " +
                      Provider.of<SearchBarState>(context).windOne.toString() +
                      "ml/h"
                  : number == 2
                      ? "Win: " +
                          Provider.of<SearchBarState>(context)
                              .windTwo
                              .toString() +
                          "ml/h"
                      : number == 3
                          ? "Win: " +
                              Provider.of<SearchBarState>(context)
                                  .windThree
                                  .toString() +
                              "ml/h"
                          : "Win: " +
                              Provider.of<SearchBarState>(context)
                                  .windFour
                                  .toString() +
                              "ml/h",
              style: textStyle,
            ),
          )
        ],
      ),
    );
  }
}
