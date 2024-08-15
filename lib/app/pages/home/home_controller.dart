import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:olimpiadas_paris/app/core/exceptions/repository_exception.dart';
import 'package:olimpiadas_paris/app/pages/home/home_state.dart';
import 'package:olimpiadas_paris/app/repositories/country/country_repository.dart';
import 'package:olimpiadas_paris/app/repositories/discipline/discipline_repository.dart';
import 'package:olimpiadas_paris/app/services/event/event_service.dart';

class HomeController extends Cubit<HomeState> {
  final CountryRepository _countryRepository;
  final DisciplineRepository _sportsRepository;
  final EventService _eventService;

  HomeController(
      {required CountryRepository countryRepository,
      required DisciplineRepository sportsRepository,
      required EventService eventService})
      : _countryRepository = countryRepository,
        _sportsRepository = sportsRepository,
        _eventService = eventService,
        super(HomeState.initial());

  Future<void> getCountriesMedalBoard() async {
    try {
      emit(state.copyWith(status: HomeStatus.loading));
      var countries = await _countryRepository.getAll();
      final top = countries.take(3).toList();
      emit(state.copyWith(status: HomeStatus.loaded, countries: top));
    } on RepositoryException catch (e) {
      emit(state.copyWith(errorMessage: e.message));
    } catch (e, s) {
      log("Erro inesperado ao buscar os paises do Quadro de Medalhas - HomeController: getCountriesMedalBoard",
          error: e, stackTrace: s);
      emit(state.copyWith(
          errorMessage: "Erro ao buscar os paises do Quadro de Medalhas"));
    }
  }

  Future<void> getAllSports() async {
    try {
      emit(state.copyWith(status: HomeStatus.loading));
      final sports = await _sportsRepository.getAll();
      emit(state.copyWith(
          status: HomeStatus.loaded, sports: sports, searchSports: sports));
    } on RepositoryException catch (e) {
      emit(state.copyWith(errorMessage: e.message));
    } catch (e, s) {
      log("Erro inesperado ao buscar os esportes - HomeController: getAllSports",
          error: e, stackTrace: s);
      emit(state.copyWith(errorMessage: "Erro ao buscar os esportes"));
    }
  }

  void searchSports(String value) {
    if (value != "") {
      final newList = state.sports
          .where(
              (sport) => sport.name.toLowerCase().contains(value.toLowerCase()))
          .toList();
      emit(state.copyWith(searchSports: newList));
    } else {
      emit(state.copyWith(searchSports: state.sports));
    }
  }

  Future<void> getAllFavoriteCountryEvents() async {
    try {
      emit(state.copyWith(status: HomeStatus.loading));
      final events = await _eventService.getAll();
      emit(state.copyWith(status: HomeStatus.loaded, events: events));
    } on RepositoryException catch (e) {
      emit(state.copyWith(errorMessage: e.message));
    } catch (e, s) {
      log("Erro inesperado ao buscar os eventos - HomeController: getAllFavoriteCountryEvents", error: e, stackTrace: s);
      emit(state.copyWith(errorMessage: "Erro ao buscar os eventos"));
    }
  }
}
