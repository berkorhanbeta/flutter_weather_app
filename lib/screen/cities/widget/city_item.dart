import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/data/model/city_model.dart';
import 'package:weather_app/data/model/weather_model.dart';
import 'package:weather_app/utils/app_constant.dart';
import 'package:weather_app/utils/custom_path.dart';
import 'package:weather_app/utils/images.dart';

class CityItem extends StatelessWidget {

  final CityModel city;
  final WeatherModel? weather;
  CityItem({required this.city, this.weather});

  @override
  Widget build(BuildContext context) {

    return Stack(
      children: [
        ClipPath(
          clipper: CustomCardClipper(),
          child: Container(
            margin: const EdgeInsets.only(bottom: 16, left: 16, right: 16),
            padding: const EdgeInsets.all(32),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.deepPurple, Colors.purple],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('${weather?.currentWeater?.temp?.round() ?? '--'}°', style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
                    Text('H:${weather?.dailyWeather?.maxTemp?.first.round() ?? '--'}°, L:${weather?.dailyWeather?.minTemp?.first.round() ?? '--'}°', style: TextStyle(fontSize: 16)),
                    Text('${city.district ?? 'Unknown'}, ${city.country ?? 'Unknown'}', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  ],
                ),
                Expanded(
                  child: Container(
                    alignment: Alignment.bottomRight,
                    child: Text('${AppConstant.weatherText[weather?.currentWeater?.weatherType ?? 0]}', style: TextStyle(fontSize: 16)),
                  ),
                )
              ],
            ),
          ),
        ),
        Container(
          alignment: Alignment.topRight,
          child: CircleAvatar(
            backgroundImage: AssetImage(Images.weatherList[weather?.currentWeater?.weatherType ?? 0]),
            backgroundColor: Colors.transparent,
            radius: 50,
          ),
        ),
      ],
    );
  }


}