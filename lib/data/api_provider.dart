// ignore_for_file: import_of_legacy_library_into_null_safe

import 'dart:convert';
import 'package:http/http.dart';
import '../model/popular_movies.dart';
class ApiProvider {
  String apiKey = '51b76aeef6126a6cb894e4b1840faa8c';
  String baseUrl = 'https://api.themoviedb.org/3';

  Client client = Client();

  Future<PopularMovies> getPopularMovies() async {
    Response response =
        await client.get(Uri.parse('$baseUrl/movie/popular?api_key=$apiKey'));

    if (response.statusCode == 200) {
      return PopularMovies.fromJson(jsonDecode(response.body));
    } else {
      throw Exception(response.statusCode);
    }
  }
}
