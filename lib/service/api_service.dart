import 'dart:convert';
import 'dart:io';
import 'dart:developer';
import 'package:movies/constants/api_constants.dart';
import 'package:http/http.dart' as http;
import 'package:movies/core/exception/request_exception.dart';
import 'package:movies/model/movies_genre.dart';
import 'package:movies/model/movies_model.dart';

class ApiService {
  Future<List<MovieModel>> fetchMovies({int page = 1}) async {
    try {
      final url = Uri.parse(
          "${ApiConstants.baseUrl}/movie/popular?language=en-US&page=$page");
      final response = await http.get(url, headers: ApiConstants.headers);

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        log("ApiService - fetchMovies - data: $data");
        return List.from(
            data['results'].map((element) => MovieModel.fromJson(element)));
      } else {
        throw Exception("Failed to load movies: ${response.statusCode}");
      }
    } on SocketException {
      throw RequestException("No Internet connection");
    } on HttpException {
      throw RequestException("Couldn't find the movie");
    } on FormatException {
      throw RequestException("Bad response format");
    } catch (e) {
      throw RequestException("Unexpected error: $e");
    }
  }

  Future<List<MoviesGenre>> fetchGenres({int page = 1}) async {
    try {
      final url =
          Uri.parse("${ApiConstants.baseUrl}/genre/tv/list?language=en");
      final response = await http.get(url, headers: ApiConstants.headers);

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        log("ApiService - fetchGenres - data: $data");
        return List.from(
            data['genres'].map((element) => MoviesGenre.fromJson(element)));
      } else {
        throw Exception("Failed to load movies: ${response.statusCode}");
      }
    } on SocketException {
      throw RequestException("No Internet connection");
    } on HttpException {
      throw RequestException("Couldn't find the movie");
    } on FormatException {
      throw RequestException("Bad response format");
    } catch (e) {
      throw RequestException("Unexpected error: $e");
    }
  }
}
