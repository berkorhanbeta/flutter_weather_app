import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/data/model/weather_model.dart';
import 'package:weather_app/screen/weather/item/weekly_item.dart';
import 'package:weather_app/screen/weather/widget/today_widget.dart';

class WeatherModalWidget extends StatefulWidget {

  WeatherModel? weather;
  bool? isHome;
  WeatherModalWidget({this.weather, required this.isHome});

  @override
  State<WeatherModalWidget> createState() => _WeatherModalWidgetState();
}

class _WeatherModalWidgetState extends State<WeatherModalWidget> {

  double initialSize = 0.2;
  double maxSize = 1;
  double minSize = 0.2;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    if(widget.isHome!){
      return DraggableScrollableSheet(
        initialChildSize: initialSize,
        maxChildSize: maxSize,
        minChildSize: minSize,
        builder: (BuildContext context, ScrollController scrollController) {
          return Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(36))
            ),
            child: SingleChildScrollView(
              controller: scrollController,
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.only(top: 20, bottom: 20),
                    child: SizedBox(
                      width: 100,
                      child: Divider(
                        height: 5,
                        thickness: 5,
                      ),
                    ),
                  ),
                  homePage()
                ],
              )
            ),
          );
        },
      );
    } else {
      return homePage();
    }
  }


  Widget homePage(){
    return Column(
      children: [
        ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          primary: false,
          itemCount: widget.weather?.dailyWeather?.days?.length ?? 0,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: WeeklyItem(day: widget.weather?.dailyWeather, i: index),
            );
          },
        ),
        TodayWidget(today: widget.weather?.dailyWeather)
      ],
    );
  }
}