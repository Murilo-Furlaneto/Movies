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

      final response = await http
          .get(url, headers: ApiConstants.headers)
          .timeout(const Duration(seconds: 10));

      log("fetchMovies - Código de status da resposta: ${response.statusCode}",
          name: "ApiService");

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        return List.from(
            data['results'].map((element) => MovieModel.fromJson(element)));
      } else {
        log("fetchMovies - Falha com código de status: ${response.statusCode}",
            name: "ApiService");
        throw Exception("Erro ao carregar filmes: ${response.statusCode}");
      }
    } on SocketException {
      log("fetchMovies - Erro: Sem conexão com a Internet", name: "ApiService");
      throw RequestException("Sem conexão com a Internet");
    } on HttpException {
      log("fetchMovies - Erro: Não foi possível encontrar os filmes",
          name: "ApiService");
      throw RequestException("Não foi possível encontrar os filmes");
    } on FormatException {
      log("fetchMovies - Erro: Formato de resposta inválido",
          name: "ApiService");
      throw RequestException("Formato de resposta inválido");
    } catch (e) {
      log("fetchMovies - Erro inesperado: ${e.toString()}", name: "ApiService");
      throw RequestException("Erro inesperado: $e");
    }
  }

  Future<List<MoviesGenre>> fetchGenres({int page = 1}) async {
    try {
      final url =
          Uri.parse("${ApiConstants.baseUrl}/genre/tv/list?language=en");

      final response = await http
          .get(url, headers: ApiConstants.headers)
          .timeout(const Duration(seconds: 10));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        return List.from(
            data['genres'].map((element) => MoviesGenre.fromJson(element)));
      } else {
        log("fetchGenres - Falha com código de status: ${response.statusCode}",
            name: "ApiService");
        throw Exception("Erro ao carregar gêneros: ${response.statusCode}");
      }
    } on SocketException {
      log("fetchGenres - Erro: Sem conexão com a Internet", name: "ApiService");
      throw RequestException("Sem conexão com a Internet");
    } on HttpException {
      log("fetchGenres - Erro: Não foi possível encontrar os gêneros",
          name: "ApiService");
      throw RequestException("Não foi possível encontrar os gêneros");
    } on FormatException {
      log("fetchGenres - Erro: Formato de resposta inválido",
          name: "ApiService");
      throw RequestException("Formato de resposta inválido");
    } catch (e) {
      log("fetchGenres - Erro inesperado: ${e.toString()}", name: "ApiService");
      throw RequestException("Erro inesperado: $e");
    }
  }
}
