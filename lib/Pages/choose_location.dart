import 'package:flutter/material.dart';
import 'package:timezone/Services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({super.key});

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTime> locations = [
    WorldTime('London', 'UK.png', 'Europe/London'),
    WorldTime('Berlin', 'Berlin.png', 'Europe/Berlin'),
    WorldTime('Colombo', 'srilanka.png', 'Asia/Colombo'),
    WorldTime('Kolkata', 'India.jpeg', 'Asia/Kolkata'),
    WorldTime('New_York', 'america.png', 'America/New_York'),
    WorldTime('Chicago', 'canada.png', 'America/Chicago'),
    WorldTime('Cairo', 'Alexandria.png', 'Africa/Cairo'),
    WorldTime('Nairobi', 'ghana.png', 'Africa/Nairobi'),
  ];

  void updateTime(index) async {
    WorldTime instance = locations[index];
    await instance.getTime();
    Navigator.pop(context, {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDaytime': instance.isDaytime,
    }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan[400],
      appBar: AppBar(
        title: Text(
          "Choose Location",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),
        ),
        backgroundColor: Colors.indigo,
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              child: ListTile(
                onTap: (){
                  updateTime(index);
                },
                title: Text(locations[index].location),
                leading: CircleAvatar(
                  backgroundImage: AssetImage("images/${locations[index].flag}"),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}