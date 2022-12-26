import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather Forecast',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Weather Forecast',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        backgroundColor: Colors.red,
        body: MainScreen(),
      ),
    );
  }
}

class MainScreen extends StatelessWidget {
  MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 8.0),
        SearchWidget(),
        SizedBox(height: 12.0),
        CityDetail(),
        SizedBox(height: 24.0),
        TemperatureDetail(),
        SizedBox(height: 30.0),
        ExtraWidgetDetail(),
        SizedBox(height: 40),
        Text(
          '7-DAY WEATHER FORECAST',
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        SizedBox(height: 20),
        BottomDetail()
      ],
    );
  }
}

class SearchWidget extends StatelessWidget {
  const SearchWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      dragStartBehavior: DragStartBehavior.down,
      obscureText: true,
      expands: true,
      decoration: InputDecoration(
        prefixIcon: Icon(
          Icons.search_rounded,
          color: Colors.white,
        ),
        labelText: 'Enter City Name',
        labelStyle: TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}

class CityDetail extends StatelessWidget {
  const CityDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Text(
          'Murmansk Oblast, RU',
          style: TextStyle(
            color: Colors.white,
            fontSize: 38,
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(height: 8.0),
        Text(
          'Friday, Mar 20, 2020',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w300,
          ),
        ),
      ],
    );
  }
}

class TemperatureDetail extends StatelessWidget {
  const TemperatureDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          Icons.sunny,
          color: Colors.white,
          size: 100,
        ),
        SizedBox(width: 16.0),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '14 C',
              style: TextStyle(
                color: Colors.white,
                fontSize: 70,
                fontWeight: FontWeight.w200,
              ),
            ),
            Text(
              'LIGHT SNOW',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w300,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class ExtraWidgetDetail extends StatelessWidget {
  ExtraWidgetDetail({Key? key}) : super(key: key);

  final TextStyle textStyle = TextStyle(
    color: Colors.white,
    fontSize: 30,
  );
  final icon = Icon(
    Icons.ac_unit,
    color: Colors.white,
    size: 40,
  );

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            icon,
            Text(
              '5',
              style: textStyle,
            ),
            Text(
              'km/hr',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ],
        ),
        SizedBox(width: 70),
        Column(
          children: [
            icon,
            Text(
              '3',
              style: textStyle,
            ),
            Text(
              '%',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ],
        ),
        SizedBox(width: 70),
        Column(
          children: [
            icon,
            Text(
              '20',
              style: textStyle,
            ),
            Text(
              '%',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ],
        )
      ],
    );
  }
}

class BottomDetail extends StatelessWidget {
  BottomDetail({Key? key}) : super(key: key);

  final List<WeatherPerDay> items = [
    WeatherPerDay(
        day: 'Friday',
        temperature: 6,
        icon: Icon(Icons.sunny, color: Colors.white)),
    WeatherPerDay(
        day: 'Saturday',
        temperature: 5,
        icon: Icon(Icons.sunny, color: Colors.white)),
    WeatherPerDay(
        day: 'Sunday',
        temperature: 4,
        icon: Icon(Icons.cloud, color: Colors.white)),
    WeatherPerDay(
        day: 'Monday',
        temperature: 6,
        icon: Icon(Icons.cloud, color: Colors.white)),
    WeatherPerDay(
        day: 'Tuesday',
        temperature: 10,
        icon: Icon(Icons.sunny, color: Colors.white)),
    WeatherPerDay(
        day: 'Wednesday',
        temperature: 20,
        icon: Icon(Icons.sunny, color: Colors.white)),
    WeatherPerDay(
        day: 'Thursday',
        temperature: 20,
        icon: Icon(Icons.sunny, color: Colors.white)),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 100,
        child: ListView.builder(
            itemCount: items.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return WeatherDayCard(
                day: items[index].day,
                icon: items[index].icon,
                temperature: items[index].temperature,
              );
            }));
  }
}

class WeatherPerDay {
  final String day;
  final int temperature;
  final Icon icon;

  WeatherPerDay(
      {required this.day, required this.temperature, required this.icon});
}

class WeatherDayCard extends StatelessWidget {
  final String day;
  final int temperature;
  final Icon icon;
  const WeatherDayCard(
      {Key? key,
      required this.day,
      required this.temperature,
      required this.icon})
      : super(key: key);

  final Color color = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      color: Colors.white30,
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(day,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: color, fontSize: 20)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(temperature.toString() + 'F',
                  style: TextStyle(
                      color: color, fontSize: 30, fontWeight: FontWeight.w300)),
              icon,
            ],
          )
        ],
      ),
    );
  }
}
