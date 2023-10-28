import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:weather_2/models/weatther_model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  // Weather weather = Weather();
  Future<Weather> getWeatherApi() async {
    final response = await http.get(Uri.parse(
        "https://api.open-meteo.com/v1/forecast?latitude=8.792390&longitude=76.669121&hourly=temperature_2m,rain&daily=temperature_2m_max,temperature_2m_min,sunrise,sunset,uv_index_max&current_weather=true&timezone=auto#"));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      return Weather.fromJson(data);
    } else {
      print("Error!");
      return Weather.fromJson(data);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Location"),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Expanded(
              child: Column(children: [
            FutureBuilder(
                future: getWeatherApi(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return (Text("Loading"));
                    // } else if (snapshot.hasData) {
                    // return (Text("has data"));
                  } else {
                    return Text(snapshot.data!.latitude.toString());
                  }
                }),
          ]))
        ],
      ),
    );
  }
}
