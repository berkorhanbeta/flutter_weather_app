import 'dart:convert';

import 'package:weather_app/data/model/city_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {

  SharedPreferences? pref;
  Future<bool> saveCities(List<CityModel> cities) async {
    pref = await SharedPreferences.getInstance();
    List<String> sCities = cities.map((v) => jsonEncode(v.toJson())).toList();
    try {
      await pref!.setStringList('cities', sCities);
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<List<CityModel>> getCities() async {
    List<CityModel> cities = [];
    pref = await SharedPreferences.getInstance();
    if(pref!.getStringList('cities') != null) {
      cities = (jsonDecode(pref!.getStringList('cities').toString()) as List).map((v) => CityModel.fromJson(v)).toList();
    }
    return cities;
  }

  Future<bool> addCity(CityModel city) async {
    try {
      List<CityModel> cities = await getCities();
      cities.add(city);
      await saveCities(cities);
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> removeAll() async {
    List<CityModel> empty = [];
    if(await saveCities(empty)){
      return true;
    } else {
      return false;
    }
  }

}