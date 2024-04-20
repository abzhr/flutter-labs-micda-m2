import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class WeatherDetails extends StatefulWidget {
  final String myCity;

  const WeatherDetails({required this.myCity});

  @override
  State<WeatherDetails> createState() => WeatherDetails_State();
}

class WeatherDetails_State extends State<WeatherDetails> {
  //final String city;
  //dynamic weatherData;
  String temp = "";
  int deg = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getWeatherData();
  }

  Future<void> _getWeatherData() async {
    final response = await http.get(Uri.parse(
        "https://api.openweathermap.org/data/2.5/weather?q=${widget.myCity}&appid=37234c0dc03a125fd544cfc5a9f05b5f&units=metric%27;"));

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);

      setState(() {
        temp = jsonData['weather'][0]['description'];
        deg = jsonData['main']['temp'].toInt();
      });
    } else {
      // Handle error response
      final errorMessage = json.decode(response.body)['message'];
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Error'),
          content: Text(errorMessage),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.myCity} Details'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            '${widget.myCity}',
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16),
          Text(
            'Weather: $temp',
            style: TextStyle(fontSize: 24),
          ),
          SizedBox(height: 16),
          Text(
            'Temp: $deg°C',
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
