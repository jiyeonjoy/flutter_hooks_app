import 'dart:convert';

import 'package:http/http.dart' as http;

import 'models.dart';

/// Api wrapper to retrieve Star Wars related data
class StarWarsApi {
  /// load and return one page of planets
  Future<PlanetPageModel?> getPlanets({String page = 'https://swapi.dev/api/planets'}) async {
    final response = await http.get(Uri.parse(page));
    final dynamic json = jsonDecode(utf8.decode(response.bodyBytes));
    print('--------------json $json');
    return serializers.deserializeWith(PlanetPageModel.serializer, json);
  }
}