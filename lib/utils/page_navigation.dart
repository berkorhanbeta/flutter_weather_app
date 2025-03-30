import 'package:get/get.dart';
import 'package:weather_app/screen/cities/cities_screen.dart';
import 'package:weather_app/screen/home/home_screen.dart';
import 'package:weather_app/screen/search/search_screen.dart';
import 'package:weather_app/screen/splash/splash_screen.dart';

class PageNavigation {

  static const String home = '/';
  static const String splash = '/splash';
  static const String search = '/search';
  static const String cities = '/cities';

  static final routes = [
    GetPage(name: home, page: () => HomeScreen()),
    GetPage(name: splash, page: () => SplashScreen()),
    GetPage(name: search, page: () => SearchScreen()),
    GetPage(name: cities, page: () => CitiesScreen())
  ];
}