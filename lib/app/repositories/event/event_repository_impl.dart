import 'dart:developer';

import 'package:dio/dio.dart';

import 'package:olimpiadas_paris/app/core/exceptions/repository_exception.dart';
import 'package:olimpiadas_paris/app/core/shared_preferences/shared_preferences_util.dart';
import 'package:olimpiadas_paris/app/core/ui/rest_client/custom_dio.dart';
import 'package:olimpiadas_paris/app/core/util/date_formatter_util.dart';
import 'package:olimpiadas_paris/app/models/event_model.dart';

import './event_repository.dart';

class EventRepositoryImpl extends EventRepository {
  final CustomDio _dio;
  EventRepositoryImpl({required CustomDio dio}) : _dio = dio;

  @override
  Future<List<EventModel>> getAllEvents() async {
    try {
      final favoriteCountry = await SharedPreferencesUtil.getFavoriteCountry();
      
      // Comentado pois nesse momento as Olimpiadas já acabaram, ou seja, a API não vai retornar nenhum evento se eu passar a data
      // atual
      //String date = DateFormatterUtil.formatDateToUSA(DateTime.now().toIso8601String());
      String date = "2024-08-06";

      final result = await _dio.get(
          '/events?country=${favoriteCountry!.id}&date=$date');
      final data = result.data['data'];

      return data
          .map<EventModel>((event) => EventModel.fromMap(event))
          .toList();
    } on DioException catch (e, s) {
      log("Erro ao buscar os eventos", error: e, stackTrace: s);
      throw RepositoryException(message: "Erro ao buscar os eventos");
    } catch (e, s) {
      log("Erro inesperado ao buscar os eventos - EventRepositoryImpl", error: e, stackTrace: s);
      throw RepositoryException(message: "Erro ao buscar os eventos");
    }
  }

  @override
  Future<List<EventModel>> getAllByFilters({required String endpoint}) async {
    try {
      final result = await _dio.get(endpoint);
      final data = result.data['data'];

      return data
          .map<EventModel>((event) => EventModel.fromMap(event))
          .toList();
    } on DioException catch (e, s) {
      log("Erro ao buscar os eventos", error: e, stackTrace: s);
      throw RepositoryException(message: "Erro ao buscar os eventos");
    }catch (e, s) {
      log("Erro inesperado ao buscar os eventos - EventRepositoryImpl: getAllByFilters", error: e, stackTrace: s);
      throw RepositoryException(message: "Erro ao buscar os eventos");
    }
  }
}
