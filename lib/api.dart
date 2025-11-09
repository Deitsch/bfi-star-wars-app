import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:star_wars_app/models/planet.dart';

class StarWarsApi {
  static const String _baseUrl = 'https://swapi.dev/api';

  Future<List<Planet>> fetchPlanets() async {
    final response = await http.get(Uri.parse('$_baseUrl/planets'));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final List<dynamic> results = data['results'];
      return results.map((e) => Planet.fromJson(e)).toList();
    } else {
      throw Exception(
        'Failed to load planets (status: ${response.statusCode})',
      );
    }
  }
}
