import 'dart:convert';

import 'package:covid_tracker/Model/countriesdata.dart';
import 'package:covid_tracker/services/utilities/app_urls.dart';
import 'package:http/http.dart' as http;
import 'package:covid_tracker/Model/statsmodel.dart';

class Statservices {
  Future<WorldStatsModel> getpostapi() async {
    final response = await http.get(Uri.parse(appurl.baseurl));

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return WorldStatsModel.fromJson(data);
    } else {
      throw Exception('error');
    }
  }

  // Future<List<CountriesData>> getcountrieslist() async {
  //   final response =
  //       await http.get(Uri.parse('https://disease.sh/v3/covid-19/countries'));

  //   if (response.statusCode == 200) {
  //     var data = jsonDecode(response.body);
  //     //  return CountriesData.fromJson(data);
  //     return data;
  //   } else {
  //     throw Exception('error api');
  //   }
  // }

  Future<List<dynamic>> getworldstats() async {
    final response = await http.get(Uri.parse(appurl.secondurl));
    var data;
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return data;
    } else {
      throw Exception('error');
    }
  }
}
