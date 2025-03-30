class CityModel {

  int? _id;
  String? _district;
  String? _city;
  String? _country;
  double? _lat;
  double? _long;
  String? _countryCode;


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic> {};
    data['id'] = _id;
    data['name'] = _district;
    data['admin1'] = _city;
    data['country'] = _country;
    data['countryCode'] = _countryCode;
    data['latitude'] = _lat;
    data['longtitude'] = _long;
    return data;
  }

  CityModel.fromJson(Map<String, dynamic> json) {
    _id = json['id'] ?? 0;
    _district = json['name'] ?? '';
    _city = json['admin1'] ?? '';
    _country = json['country'] ?? '';
    _countryCode = json['country_code'].toString().toLowerCase();
    _lat = json['latitude'] ?? 0;
    _long = json['longtitude'] ?? 0;
  }

  String? get district => _district;
  String? get city => _city;
  String? get country => _country;
  String? get countryCode => _countryCode;
  double? get lat => _lat;
  double? get lang => _long;
}