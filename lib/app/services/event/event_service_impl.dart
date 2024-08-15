

import 'dart:developer';

import 'package:olimpiadas_paris/app/core/exceptions/repository_exception.dart';
import 'package:olimpiadas_paris/app/core/exceptions/service_exception.dart';
import 'package:olimpiadas_paris/app/core/util/date_formatter_util.dart';
import 'package:olimpiadas_paris/app/models/event_model.dart';
import 'package:olimpiadas_paris/app/repositories/event/event_repository.dart';

import './event_service.dart';

class EventServiceImpl extends EventService {
  final EventRepository _eventRepository;
  EventServiceImpl({
    required EventRepository eventRepository,
  }) : _eventRepository = eventRepository;

  @override
  Future<List<EventModel>> getAll() async {
    try {
      return _eventRepository.getAllEvents();
    } on RepositoryException catch (e) {
      throw ServiceException(message: e.message);
    } catch (e, s) {
      log("Erro inesperado ao buscar os eventos - EventServiceImpl: getAll", error: e, stackTrace: s);
      throw ServiceException(message: "Erro ao buscar os eventos");
    }
  }

  @override
  Future<List<EventModel>> getAllByFilters(
      {DateTime? date, String? idCountry, String? discipline}) {
    // https://apis.codante.io/olympic-games/events?country=BRA&date=2024-08-08

    try {
      String endpoint = "/events?";

      if (date == null && idCountry == null && discipline == null) {
        endpoint = "/events";
      }

      bool hasPreviousParameter = false;

      if (date != null) {
        endpoint += "date=${DateFormatterUtil.formatDateToUSA(date.toIso8601String())}";
        hasPreviousParameter = true;
      }

      if (idCountry != null) {
        if (hasPreviousParameter) {
          endpoint += "&";
        }
        endpoint += "country=$idCountry";
        hasPreviousParameter = true;
      }

      if (discipline != null) {
        if (hasPreviousParameter) {
          endpoint += "&";
        }
        endpoint += "discipline=$discipline";
      }

      return _eventRepository.getAllByFilters(endpoint: endpoint);
    } on RepositoryException catch (e) {
      throw ServiceException(message: e.message);
    } catch (e, s) {
      log("Erro inesperado ao filtrar eventos - EventServiceImpl: getAllByFilters", error: e, stackTrace: s);
      throw ServiceException(message: "Erro ao buscar os eventos");
    }
  }
}
