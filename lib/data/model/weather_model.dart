class WeatherModel {

  double? lat;
  DailyModel? dailyWeather;
  CurrentModel? currentWeater;

  WeatherModel.fromJson(Map<String, dynamic> json) {
    lat = json['latitude'] ?? 0;
    dailyWeather = DailyModel.fromJson(json['daily']);
    currentWeater = CurrentModel.fromJson(json['current']);
    print('${currentWeater!.temp}');
  }

  double? get lati => lat;

}


class DailyModel {

  List<dynamic>? maxTemp;
  List<dynamic>? minTemp;
  List<dynamic>? days;
  List<dynamic>? windSpeed;
  List<dynamic>? snowFall;
  List<dynamic>? precipitation;
  List<dynamic>? probability;
  List<int>? weatherTypes;
  List<dynamic>? sunset;
  List<dynamic>? sunrise;
  List<dynamic>? uvIndex;

  DailyModel.fromJson(Map<String, dynamic> json) {

    if(json['time'] != null) {
      days = (json['time']);
    }

    if(json['temperature_2m_max'] != null) {
      maxTemp = (json['temperature_2m_max']);
    }

    if(json['temperature_2m_min'] != null) {
      minTemp = (json['temperature_2m_min']);
    }

    if(json['wind_speed_10m_max'] != null) {
      windSpeed = json['wind_speed_10m_max'];
    }

    if(json['snowfall_sum'] != null) {
      snowFall = json['snowfall_sum'];
    }

    if(json['precipitation_sum'] != null) {
      precipitation = json['precipitation_sum'];
    }

    if(json['precipitation_probability_max'] != null) {
      probability = json['precipitation_probability_max'];
    }

    if(json['sunrise'] != null) {
      sunrise = json['sunrise'];
    }

    if(json['sunset'] != null) {
      sunset = json['sunset'];
    }

    if(json['uv_index_max'] != null) {
      uvIndex = json['uv_index_max'];
    }

    weatherTypes = List.generate(maxTemp?.length ?? 0, (index) {
      double? temp = maxTemp?[index];
      double? windSpeedValue = windSpeed?[index];
      double? snow = snowFall?[index];
      int? precip = probability?[index];

      if (snow != null && snow > 0) {
        return 4;
      } else if (precip != null && precip >= 30) {
        return 3;
      } else if (windSpeedValue != null && windSpeedValue >= 30) {
        return 2;
      } else if (temp != null && temp < 0) {
        return 1;
      } else {
        return 0;
      }
    });
  }
}


class CurrentModel {

  double? temp;
  double? tempApparent;
  int? humidity;
  double? precipitation;
  double? snowfall;
  int? cloud;
  double? windSpeed;
  int? weatherType;

  CurrentModel.fromJson(Map<String, dynamic> json) {

    temp = json['temperature_2m'];
    humidity = json['relative_humidity_2m'];
    tempApparent = json['apparent_temperature'];
    windSpeed = json['wind_speed_10m'];
    cloud = json['cloud_cover'];
    snowfall = json['snowfall'];
    precipitation = json['precipitation'];

    if (snowfall! > 0) {
      // Kar yağışı varsa öncelikli olarak karlı hava
      weatherType = 4;
    } else if (precipitation! >= 30) {
      // Yoğun yağış varsa yağmurlu hava
      weatherType = 3;
    } else if (windSpeed! >= 30) {
      // Kuvvetli rüzgar varsa fırtına modu
      weatherType = 2;
    } else if (cloud! >= 50) {
      // Bulut oranı %50'den fazlaysa bulutlu hava
      weatherType = 1;
    } else {
      // Açık hava
      weatherType = 0;
    }


  }
}