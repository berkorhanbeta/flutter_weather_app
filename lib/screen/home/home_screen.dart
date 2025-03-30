import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/screen/cities/cities_screen.dart';
import 'package:weather_app/screen/search/search_screen.dart';
import 'package:weather_app/screen/weather/weather_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  static List<Widget> _widgets = [
    WeatherScreen(isHome: true),
    SearchScreen(),
    CitiesScreen()
  ];

  int _selected = 0;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather App'),
      ),
      floatingActionButton: FloatingActionButton.large(
        child: Icon(CupertinoIcons.search),
        onPressed: () {
          setState(() {
            _selected = 1;
          });
        },
        shape: CircleBorder(),

      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: Stack(
        alignment: Alignment.center,
        children: [
          BottomAppBar(
            shape: CircularNotchedRectangle(),
            notchMargin: 15,
            child: Container(),
          ),
          BottomNavigationBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            items: [
              BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.location_solid),
                  label: 'Weather'
              ),
              BottomNavigationBarItem(
                icon: Icon(null),
                  label: ''
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.list),
                  label: 'List'
              ),
            ],
            currentIndex: _selected,
            onTap: (index) {
              setState(() {
                _selected = index;
              });
            },
          )
        ],
      ),
      body: Container(
        child: Stack(
          children: [
            _widgets.elementAt(_selected)
          ],
        ),
      )
    );
  }
}