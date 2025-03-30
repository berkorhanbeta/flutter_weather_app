import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/data/model/weather_model.dart';

class TodayWidget extends StatelessWidget {

  DailyModel? today;
  TodayWidget({this.today});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GridView.count(
      physics: NeverScrollableScrollPhysics(),
      primary: false,
      padding: EdgeInsets.all(20),
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      crossAxisCount: 2,
      shrinkWrap: true,

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
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(CupertinoIcons.wind_snow),
                  Text('Wind Speed')
                ],
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.center,
                  child: Text('${today?.windSpeed?.first ?? 0} km/h'),
                )
              )
            ],
          ),
        ),
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
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(CupertinoIcons.umbrella),
                  Text('Precipitation')
                ],
              ),
              Expanded(
                  child: Align(
                    alignment: Alignment.center,
                    child: Text('${today?.precipitation?.first ?? 0} mm'),
                  )
              )
            ],
          ),
        ),
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
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(CupertinoIcons.sunrise),
                  Text('Sunrise')
                ],
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.center,
                  child: Text('${DateFormat('HH:yy').format(DateTime.parse(today?.sunrise?.first))}'),
                )
              )
            ],
          ),
        ),
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
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(CupertinoIcons.sunset),
                  Text('Sunset')
                ],
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.center,
                  child: Text('${DateFormat('HH:yy').format(DateTime.parse(today?.sunset?.first))}'),
                )
              )
            ],
          ),
        )
      ],
    );
  }
  
  
}