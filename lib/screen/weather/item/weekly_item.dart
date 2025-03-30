import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/data/model/weather_model.dart';
import 'package:weather_app/utils/images.dart';

class WeeklyItem extends StatelessWidget {

  final DailyModel? day;
  final int? i;
  WeeklyItem({this.day, this.i});

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.deepPurple, Colors.purple],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            spacing: 20,
            children: [
              Column(
                children: [
                  Text(
                      '${DateFormat('EEEE').format(DateTime.parse(day?.days?[i ?? 0])) ?? '--'}',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold
                      )
                  ),
                  Text(
                      '${DateFormat('MMMM, d').format(DateTime.parse(day?.days?[i ?? 0])) ?? '--'}',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.normal
                      )
                  ),
                ],
              ),
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  child: Text(
                      '${day?.maxTemp?[i ?? 0].round() ?? '--'}°',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold
                      )
                  ),
                ),
              ),
              Container(
                alignment: Alignment.topRight,
                child: CircleAvatar(
                  backgroundImage: AssetImage(Images.weatherList[day?.weatherTypes?[i ?? 0] ?? 0]),
                  backgroundColor: Colors.transparent,
                  radius: 50,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }


}