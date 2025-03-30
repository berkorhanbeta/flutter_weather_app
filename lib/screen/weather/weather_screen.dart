import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/data/model/weather_model.dart';
import 'package:weather_app/modules/location_controller.dart';
import 'package:weather_app/screen/home/widget/background_widget.dart';
import 'package:weather_app/screen/weather/widget/weather_modal_widget.dart';
import 'package:weather_app/utils/app_constant.dart';
import 'package:weather_app/utils/images.dart';

class WeatherScreen extends StatefulWidget {

  bool? isHome;
  WeatherModel? weather;
  String? city;
  WeatherScreen({required this.isHome, this.weather, this.city});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {


  @override
  void initState() {
    super.initState();
    if(widget.weather == null){
      _loadCities();
    }
  }

  var placemarks;
  void _loadCities() async {
    await Provider.of<LocationController>(context, listen: false).determinePosition();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    if(widget.weather != null){
      return Scaffold(
        appBar: AppBar(
          title: Text('Weather Details'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Column(
                  children: [
                    Text('${widget.city}', style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
                    Text('${widget.weather?.currentWeater?.temp?.round() ?? '--'}°', style: TextStyle(fontSize: 80, fontWeight: FontWeight.bold)),
                    CircleAvatar(
                      backgroundImage: AssetImage(Images.weatherList[widget.weather?.currentWeater?.weatherType ?? 0]),
                      backgroundColor: Colors.transparent,
                      radius: 100,
                    ),
                    Text('${AppConstant.weatherText[widget.weather?.currentWeater?.weatherType ?? 0]}', style: TextStyle(fontSize: 30)),
                    Text('H:${widget.weather?.dailyWeather?.maxTemp?.first.round() ?? '--'}°, L:${widget.weather?.dailyWeather?.minTemp?.first.round() ?? '--'}°', style: TextStyle(fontSize: 20)),
                  ],
                ),
              ),
              WeatherModalWidget(weather: widget.weather, isHome: widget.isHome)
            ],
          ),
        )
      );
    } else {
      return Consumer<LocationController>(
        builder: (context, controller, child) {
          return Stack(
            children: [
              Column(
                children: [
                  Expanded(child: BackgroundWidget())
                ],
              ),
              Center(
                child: Column(
                  children: [
                    Text('${controller.city}', style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
                    Text('${controller.userWeather?.currentWeater?.temp?.round() ?? '--'}°', style: TextStyle(fontSize: 80, fontWeight: FontWeight.bold)),
                    CircleAvatar(
                      backgroundImage: AssetImage(Images.weatherList[controller.userWeather?.currentWeater?.weatherType ?? 0]),
                      backgroundColor: Colors.transparent,
                      radius: 100,
                    ),
                    Text('${AppConstant.weatherText[controller.userWeather?.currentWeater?.weatherType ?? 0]}', style: TextStyle(fontSize: 30)),
                    Text('H:${controller.userWeather?.dailyWeather?.maxTemp?.first.round() ?? '--'}°, L:${controller.userWeather?.dailyWeather?.minTemp?.first.round() ?? '--'}°', style: TextStyle(fontSize: 20)),
                  ],
                ),
              ),
              WeatherModalWidget(weather: controller.userWeather, isHome: widget.isHome)
            ],
          );
        },
      );
    }
  }
}