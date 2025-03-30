class AppConstant {

  static const String countryFlag = 'https://open-meteo.com/images/country-flags/';
  static const String weatherAPI = 'https://api.open-meteo.com/v1/forecast';
  static const String latitude = '?latitude=';
  static const String longitude = '&longitude=';
  static const String variables = '&daily=temperature_2m_max,temperature_2m_min,wind_speed_10m_max,snowfall_sum,precipitation_sum,precipitation_probability_max,sunrise,sunset,uv_index_max&current=temperature_2m,relative_humidity_2m,apparent_temperature,precipitation,snowfall,cloud_cover,wind_speed_10m&timezone=auto';


  static const List<String> weatherText = ['Sunny', 'Cloudy', 'Windy', 'Rainy', 'Snowing'];
}