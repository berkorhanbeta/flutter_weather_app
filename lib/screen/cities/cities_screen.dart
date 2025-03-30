import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/modules/cities_controller.dart';
import 'package:weather_app/screen/cities/widget/city_item.dart';
import 'package:weather_app/screen/weather/weather_screen.dart';

class CitiesScreen extends StatefulWidget {
  @override
  State<CitiesScreen> createState() => _CitiesScreenState();
}

class _CitiesScreenState extends State<CitiesScreen> {

  @override
  void initState() {
    super.initState();
    _loadCities();
  }

  void _loadCities() async {
    await Provider.of<CitiesController>(context, listen: false).getCities();
    await Provider.of<CitiesController>(context, listen: false).citiesWeather();
  }


  @override
  Widget build(BuildContext context) {
    return Consumer<CitiesController>(
      builder: (context, controller, child) {
        return Container(
          child: ListView.separated(
              itemBuilder: (context, index) {
                final city = controller.cities[index];
                final weather = index < controller.weather.length ? controller.weather[index] : null;

                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => WeatherScreen(isHome: false, weather: controller.weather[index], city: city.district,)
                      )
                    );
                  },
                  child: CityItem(city: city, weather: weather),
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(height: 5);
              },
              itemCount: controller.cities.length),
        );
      },
    );
  }
}