import 'dart:convert';
import 'package:covid_nineteen/Services/Utilites/urls.dart';
import 'package:http/http.dart' as http;
import '../Model/world.dart';

class ApiService {
  Future<World> fetchWorld() async {
    final response = await http.get(Uri.parse(ApiURL.worldall));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return World.fromJson(data);
    } else {
      throw Exception('Error on Server');
    }
  }

  //Uses a List of Data
  Future<List<dynamic>> fetchCountry() async {
    var data;
    final response = await http.get(Uri.parse(ApiURL.countryall));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return data;
    } else {
      throw Exception('Error on Server');
    }
  }
}
