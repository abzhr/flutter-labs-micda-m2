import 'package:calc_weather/CalcApp.dart';
import 'package:flutter/material.dart';

import 'WeatherInput.page.dart';



void main(){
  runApp(new MyApp0());
}

//creer une class statless
class MyApp0 extends StatelessWidget {
  //const MyApp0({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //return const Placeholder();
    return MaterialApp(
      routes: {
        "/":(context)=>new CalcApp(),
        "/weather":(context)=>WeatherInput(),
      },
      initialRoute: "",
      //home: new MyHomePage(),
      //home:Weather()
    );
  }
}
