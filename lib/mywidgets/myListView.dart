import 'package:flutter/material.dart';
import 'package:weather_app/mywidgets/listItems.dart';

class MyListView extends StatelessWidget {
  const MyListView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      height: 200,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          ListItems(number: 1),
          SizedBox(width: 4),
          ListItems(number: 2),
          SizedBox(width: 4),
          ListItems(number: 3),
          SizedBox(width: 4),
          ListItems(number: 4),
        ],
      ),
    );
  }
}
