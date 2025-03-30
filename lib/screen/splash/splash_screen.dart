import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/modules/cities_controller.dart';
import 'package:weather_app/modules/location_controller.dart';
import 'package:weather_app/utils/page_navigation.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  @override
  void initState() {
    super.initState();
    _loadCities();
  }

  void _loadCities() async {
    await Provider.of<CitiesController>(context, listen: false).citiesWeather();
    await Provider.of<LocationController>(context, listen: false).determinePosition();

  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Text('data');
  }
}