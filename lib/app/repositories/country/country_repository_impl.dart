import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:olimpiadas_paris/app/core/exceptions/repository_exception.dart';
import 'package:olimpiadas_paris/app/core/ui/rest_client/custom_dio.dart';
import 'package:olimpiadas_paris/app/models/country_model.dart';

import './country_repository.dart';

class CountryRepositoryImpl extends CountryRepository {
  final CustomDio _dio;

  CountryRepositoryImpl({required CustomDio dio}) : _dio = dio;

  @override
  Future<List<CountryModel>> getAll() async {
    try {
      final result = await _dio.get('/countries');
      final data = result.data["data"];
      return data.map<CountryModel>((country) => CountryModel.fromMap(country)).toList();
    } on DioException catch (e, s) {
      log("Erro ao buscar paises", error: e, stackTrace: s);
      throw RepositoryException(message: "Erro ao buscar paises");
    }catch(e,s){
      log("Erro inesperado ao buscar os paises CountryRepositoryImpl: getAll", error: e, stackTrace: s);
      throw RepositoryException(message: "Erro ao buscar paises");
    }
  }
}
