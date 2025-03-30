import 'package:flutter/material.dart';
import 'package:weather_app/data/model/weather_model.dart';

class DailyForecastWidget extends StatelessWidget {

  DailyModel? daily;
  DailyForecastWidget({this.daily});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: daily?.days?.length ?? 0, // Adjust count as needed
      itemBuilder: (BuildContext context, int index) {
        return Container(
          width: 80,
          margin: EdgeInsets.symmetric(horizontal: 8),
          decoration: BoxDecoration(
            color: Colors.blueAccent,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: Text(
              'Item ${daily?.days?[index]}',
              style: TextStyle(color: Colors.white),
            ),
          ),
        );
      },
    );
  }
}
