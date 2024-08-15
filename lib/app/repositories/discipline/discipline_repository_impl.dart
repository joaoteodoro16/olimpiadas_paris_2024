import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:olimpiadas_paris/app/core/exceptions/repository_exception.dart';
import 'package:olimpiadas_paris/app/core/ui/rest_client/custom_dio.dart';
import 'package:olimpiadas_paris/app/models/discipline_model.dart';
import 'discipline_repository.dart';

class DisciplineRepositoryImpl extends DisciplineRepository {
  final CustomDio _dio;

  DisciplineRepositoryImpl({required CustomDio dio}) : _dio = dio;

  @override
  Future<List<DisciplineModel>> getAll() async {
    try {
      final result = await _dio.get('/disciplines');
      final data = result.data["data"];
      return data
          .map<DisciplineModel>((country) => DisciplineModel.fromMap(country))
          .toList();
    } on DioException catch (e, s) {
      log("Erro ao buscar os esportes", error: e, stackTrace: s);
      throw RepositoryException(message: "Erro ao buscar os esportes");
    }catch(e,s){
      log("Erro inesperado ao buscar os esportes - DisciplineRepositoryImpl: getAll", error: e, stackTrace: s);
      throw RepositoryException(message: "Erro ao buscar os esportes");
    }
  }
}
