import 'package:cached_network_svg_image/cached_network_svg_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/data/model/city_model.dart';
import 'package:weather_app/modules/searching_controller.dart';
import 'package:weather_app/modules/shared_pref.dart';
import 'package:weather_app/utils/app_constant.dart';

class SearchScreen extends StatefulWidget {
  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {

  TextEditingController searchController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Consumer<SearchingController>(
        builder: (context, controller, child) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: SearchBar(
                  hintText: 'Search City..',
                  controller: searchController,
                  leading: Icon(CupertinoIcons.search_circle),
                  onSubmitted: (query) {
                    controller.searchCity(query);
                  },
                ),
              ),
              controller.isLoading == true
                  ? CircularProgressIndicator()
                  : Expanded(
                child: controller.results.isEmpty
                    ? Center(child: Text(""))
                    : ListView.builder(
                  itemCount: controller.results.length,
                  itemBuilder: (context, index) {
                    final CityModel item = controller.results[index];
                    return ListTile(
                      title: Text('${item.district} ${item.city.toString().isEmpty ? '' : '/ ${item.city}'}'),
                      subtitle: Text('${item.country}'),
                      leading: CachedNetworkSVGImage(
                        '${AppConstant.countryFlag}${item.countryCode}.svg',
                        placeholder: const CircularProgressIndicator(color: Colors.green),
                        errorWidget: const Icon(Icons.error, color: Colors.red),
                        width: 50.0,
                        height: 50.0,
                        fadeDuration: const Duration(milliseconds: 500),
                      ),
                      onTap: () async {
                        if(await SharedPref().addCity(item)){
                          setState(() {
                            controller.results = [];
                            searchController.text = '';
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('City successfully added.'))
                            );
                          });
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('An error occur.'))
                          );
                        }
                      },
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}