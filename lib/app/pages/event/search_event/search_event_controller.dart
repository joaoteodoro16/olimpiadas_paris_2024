import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:olimpiadas_paris/app/core/exceptions/repository_exception.dart';
import 'package:olimpiadas_paris/app/core/exceptions/service_exception.dart';
import 'package:olimpiadas_paris/app/models/country_model.dart';
import 'package:olimpiadas_paris/app/models/discipline_model.dart';
import 'package:olimpiadas_paris/app/pages/event/search_event/search_event_state.dart';
import 'package:olimpiadas_paris/app/repositories/country/country_repository.dart';
import 'package:olimpiadas_paris/app/repositories/discipline/discipline_repository.dart';
import 'package:olimpiadas_paris/app/services/event/event_service.dart';

class SearchEventController extends Cubit<SearchEventState> {
  final DisciplineRepository _disciplineRepository;
  final CountryRepository _countryRepository;
  final EventService _eventService;

  SearchEventController({
    required DisciplineRepository disciplineRepository,
    required CountryRepository countryRepository,
    required EventService eventService,
  })  : _disciplineRepository = disciplineRepository,
        _countryRepository = countryRepository,
        _eventService = eventService,
        super(SearchEventState.initial());

  Future<void> getValueFilters() async {
    try {
      emit(state.copyWith(status: SearchEventStatus.loading));
      final sports = await _disciplineRepository.getAll();
      final countries = await _countryRepository.getAll();
      emit(
        state.copyWith(
          status: SearchEventStatus.loaded,
          countries: countries,
          disciplines: sports,
        ),
      );
    } on ServiceException catch (e) {
      emit(state.copyWith(
          status: SearchEventStatus.error, errorMessage: e.message));
    } catch (e, s) {
      log("Erro inesperado ao buscar eventos - SearchEventController: getValueFilters",
          error: e, stackTrace: s);
      emit(state.copyWith(
          status: SearchEventStatus.error,
          errorMessage: "Erro ao buscar os eventos"));
    }
  }

  Future<void> getEventsByFilter() async {
    try {
      emit(state.copyWith(status: SearchEventStatus.loading));
      final events = await _eventService.getAllByFilters(
        date: state.selectedDate,
        discipline: state.disciplineSelected?.id,
        idCountry: state.countrySelected?.id,
      );

      if (state.isFinishedEventCheck) {
        final finishedEvents = state.events
            .where((event) => event.status.toLowerCase().contains("finished"))
            .toList();
        emit(state.copyWith(status: SearchEventStatus.loaded, events: finishedEvents));
      } else {
        emit(state.copyWith(status: SearchEventStatus.loaded, events: events));
      }
    } on RepositoryException catch (e, s) {
      log(e.message, error: e, stackTrace: s);
      emit(
        state.copyWith(
          status: SearchEventStatus.error,
          errorMessage: "Erro ao buscar os eventos",
        ),
      );
    } on ServiceException catch (e) {
      emit(state.copyWith(
          status: SearchEventStatus.error, errorMessage: e.message));
    } catch (e, s) {
      log("Erro inesperado  ao buscar eventos - SearchEventController: getEvents",
          error: e, stackTrace: s);
      emit(state.copyWith(
          status: SearchEventStatus.error,
          errorMessage: "Erro ao buscar os eventos"));
    }
  }

  void setCountryFilter(CountryModel country) {
    emit(state.copyWith(countrySelected: country));
  }

  void setSportFilter(DisciplineModel sport) {
    emit(state.copyWith(disciplineSelected: sport));
  }

  void updateEventFinishedStatus({required bool? value}) {
    emit(state.copyWith(isFinishedEventCheck: value));
  }

  void updateEventDatePicked({required DateTime? date}) {
    emit(state.copyWith(selectedDate: date));
  }
}
