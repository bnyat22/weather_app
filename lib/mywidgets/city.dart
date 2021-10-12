import 'package:flutter/material.dart';

class City extends StatefulWidget {
  final String name;
  final DateTime dateTime;
  const City({required this.name, required this.dateTime});

  @override
  _CityState createState() => _CityState();
}

class _CityState extends State<City> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text("f"),
        ],
      ),
    );
  }
}
