import 'package:flutter/cupertino.dart';
import 'package:weather_app/data/model/city_model.dart';
import 'package:weather_app/modules/dio_controller.dart';

class SearchingController extends ChangeNotifier {

  List<CityModel> results = [];
  bool isLoading = false;

  Future<void> searchCity(String keyword) async {
    isLoading = true;
    notifyListeners();
    var response = await DioController().getAPI('https://geocoding-api.open-meteo.com/v1/search?name=${keyword}');
    results = [];
    print(response.data);
    if(response.data['results'] != null) {
      results = (response.data['results'] as List).map((v) => CityModel.fromJson(v)).toList();
    }
    isLoading = false;
    notifyListeners();
  }
}