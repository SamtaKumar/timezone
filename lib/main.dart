import 'package:flutter/material.dart';
import 'package:timezone/Pages/loading.dart';
import 'package:timezone/Pages/home.dart';
import 'package:timezone/Pages/choose_location.dart';

//Commented by Himadrie
void main() {
  runApp(MaterialApp(
    //home: ChooseLocation(),
    //home: Loading(),
    initialRoute: "/",
    routes: {
      "/": (context) => Loading(),
      "/home": (context) => const Home(),
      "/location": (context) => const ChooseLocation(),
    },
  ));
}
