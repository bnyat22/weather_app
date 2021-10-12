import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/network.dart';
import 'package:weather_app/models/weatherMap.dart';
import 'package:weather_app/providers/SearchBarState.dart';
import 'package:weather_icons/weather_icons.dart';

import 'mywidgets/myListView.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => SearchBarState(name: ""), child: MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather cheater',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: MyHomePage(title: 'Weather cheater'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late TextEditingController textEditingController;
  @override
  void initState() {
    super.initState();
    textEditingController = TextEditingController();
    init();
  }

  @override
  void dispose() {
    super.dispose();
    textEditingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.indigo[900],
        title: Text("Weather Seeker"),
      ),
      body: Container(
        alignment: Alignment.topCenter,
        child: Column(
          children: <Widget>[
            AnimatedContainer(
              duration: Duration(milliseconds: 400),
              width: Provider.of<SearchBarState>(context, listen: false).folded
                  ? 56
                  : 200,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(36),
                boxShadow: kElevationToShadow[6],
                color: Colors.white,
              ),
              child: Row(
                children: [
                  Expanded(
                      child: Container(
                          padding: EdgeInsets.all(16),
                          child: Provider.of<SearchBarState>(context,
                                      listen: false)
                                  .folded
                              ? null
                              : TextField(
                                  controller: textEditingController,
                                  autofocus: true,
                                  decoration: InputDecoration(
                                      hintText: "Chercher",
                                      hintStyle:
                                          TextStyle(color: Colors.indigo[300])),
                                ))),
                  IconButton(
                      onPressed: () async {
                        if (!Provider.of<SearchBarState>(context, listen: false)
                            .folded) {
                          analyseUrl();
                          print(textEditingController.text.trim());
                        }
                        Provider.of<SearchBarState>(context, listen: false)
                            .fold();
                      },
                      icon: Icon(Icons.search))
                ],
              ),
            ),
            SizedBox(height: 40),
            Text(Provider.of<SearchBarState>(context).name,
                style: TextStyle(
                    fontStyle: FontStyle.italic,
                    fontSize: 24,
                    color: Colors.indigo)),
            Text(Provider.of<SearchBarState>(context).date),
            Image.asset(Provider.of<SearchBarState>(context).main),
            SizedBox(
              height: 15,
            ),
            Row(children: [
              SizedBox(
                width: 120,
              ),
              Text(
                Provider.of<SearchBarState>(context).temp.toString() + "°F",
                style: TextStyle(
                    fontSize: 20,
                    fontStyle: FontStyle.italic,
                    color: Colors.indigo),
              ),
              SizedBox(
                width: 3,
              ),
              Text(Provider.of<SearchBarState>(context).description,
                  style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic)),
            ]),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                SizedBox(
                  width: 115,
                ),
                Column(
                  children: [
                    Text(
                        Provider.of<SearchBarState>(context).wind.toString() +
                            " ml/h",
                        style: TextStyle(color: Colors.indigo)),
                    Icon(
                      WeatherIcons.windy,
                      color: Colors.indigo,
                    ),
                  ],
                ),
                SizedBox(
                  width: 25,
                ),
                Column(
                  children: [
                    Text(
                        Provider.of<SearchBarState>(context).hum.toString() +
                            "%",
                        style: TextStyle(color: Colors.indigo)),
                    Icon(WeatherIcons.humidity, color: Colors.indigo),
                  ],
                ),
                SizedBox(
                  width: 25,
                ),
                Column(
                  children: [
                    Text(
                      Provider.of<SearchBarState>(context).temp.toString() +
                          "°F",
                      style: TextStyle(color: Colors.indigo),
                    ),
                    Icon(WeatherIcons.barometer, color: Colors.indigo),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 40,
            ),
            Text(
              "4 Jours d'après",
              style: TextStyle(color: Colors.indigo),
            ),
            MyListView()
          ],
        ),
      ),

      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  void analyseUrl() async {
    print(textEditingController.text.trim());
    Network n = Network();
    Weathermap get =
        await n.getWeatherForecast(cityName: textEditingController.text.trim());
    Provider.of<SearchBarState>(context, listen: false).search(get);
  }

  void init() async {
    Network n = Network();
    Weathermap get = await n.getWeatherForecast(cityName: "Paris");
    Provider.of<SearchBarState>(context, listen: false).search(get);
  }
}
