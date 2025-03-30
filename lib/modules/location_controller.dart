import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:weather_app/data/model/weather_model.dart';
import 'package:weather_app/modules/dio_controller.dart';
import 'package:weather_app/utils/app_constant.dart';
import 'package:weather_app/utils/page_navigation.dart';

class LocationController extends ChangeNotifier {

  var position;
  String city = '';
  List<Placemark>? placemarks;
  Future<bool> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if(!serviceEnabled) {
      return false;
    }

    permission = await Geolocator.checkPermission();
    if(permission == LocationPermission.denied) {
      permission == await Geolocator.requestPermission();
      if(permission == LocationPermission.denied) {
        return false;
      }
    }

    if(permission == LocationPermission.deniedForever) {
      return Future.error('Location permission denied forever.');
    }

    position = await Geolocator.getCurrentPosition();
    placemarks = await placemarkFromCoordinates(
        position.latitude, position.longitude);
    print('${placemarks?[0].locality}');
    city = '${placemarks?.first.subAdministrativeArea}, ${placemarks?.first.administrativeArea}';
    await positionWeather();
    notifyListeners();
    Get.offNamed(PageNavigation.home);

    return true;
  }


  WeatherModel? userWeather;
  Future<void> positionWeather() async {
    final response = await DioController().getAPI(
        AppConstant.weatherAPI +
            AppConstant.latitude + position.latitude.toString() +
            AppConstant.longitude + position.longitude.toString() +
            AppConstant.variables
    );

    userWeather = WeatherModel.fromJson(response.data);
  }
}