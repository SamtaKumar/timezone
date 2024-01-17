import 'package:flutter/material.dart';
import 'package:timezone/Services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.cyan[900],
      child: SpinKitFadingCircle(
        color: Colors.white,
        size: 100,
      ),
    );
  }

  void setupWorldTime() async{
    //WorldTime instance = WorldTime("Kolkata", "2:10", "Asia/Kolkata");
    WorldTime instance = WorldTime("Kolkata", "India.jpeg", "Asia/Kolkata");
    await instance.getTime();

    Navigator.pushReplacementNamed(context, "/home", arguments: {
      "location": instance.location,
      "flag": instance.flag,
      "time": instance.time,
      "isDaytime": instance.isDaytime,
    });
  }
}
