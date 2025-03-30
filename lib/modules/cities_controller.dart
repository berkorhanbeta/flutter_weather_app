import 'package:flutter/foundation.dart';
import 'package:weather_app/data/model/city_model.dart';
import 'package:weather_app/data/model/weather_model.dart';
import 'package:weather_app/modules/dio_controller.dart';
import 'package:weather_app/modules/shared_pref.dart';
import 'package:weather_app/utils/app_constant.dart';

class CitiesController extends ChangeNotifier {


  List<CityModel> cities = [];
  Future<void> getCities() async {
    cities = await SharedPref().getCities();
    notifyListeners();
  }

  Future<bool> removeAll() async {
    if(await SharedPref().removeAll()){
      return true;
    } else {
      return false;
    }
  }

  List<WeatherModel> weather = [];
  Future<void> citiesWeather() async {
    weather = [];
    await getCities();

    if(cities.length > 0) {
      String lat = cities.map((v) => v.lat!.toString()).join(',');
      String long = cities.map((v) => v.lat!.toString()).join(',');

      final response = await DioController().getAPI(
          AppConstant.weatherAPI +
              AppConstant.latitude + lat +
              AppConstant.longitude + long +
              AppConstant.variables
      );

      (response.data).forEach((i) => weather.add(WeatherModel.fromJson(i)));
    }

    notifyListeners();
  }

}