import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:olimpiadas_paris/app/core/exceptions/repository_exception.dart';
import 'package:olimpiadas_paris/app/pages/favorite_country/favorite_country_state.dart';
import 'package:olimpiadas_paris/app/repositories/country/country_repository.dart';

class FavoriteCountryController extends Cubit<FavoriteCountryState> {
  final CountryRepository _repository;

  FavoriteCountryController({required CountryRepository repository})
      : _repository = repository,
        super(FavoriteCountryState.initial());

  Future<void> getAllCountries() async {
    try {
      emit(state.copyWith(status: FavoriteCountryStatus.loading));
      final countries = await _repository.getAll();
      emit(
        state.copyWith(
          status: FavoriteCountryStatus.loaded,
          countries: countries,
          searchContries: countries,
        ),
      );
    } on RepositoryException catch (e) {
      emit(state.copyWith(
          status: FavoriteCountryStatus.error, errorMessage: e.message));
    } catch (e, s) {
      log("Erro inesperado ao buscar paises - Controller: FavoriteCountryController", error: e, stackTrace: s);
      emit(state.copyWith(
          status: FavoriteCountryStatus.error,
          errorMessage: "Erro ao buscar paises"));
    }
  }

  void searchCountry({required String value}) {
    if (value != "") {
      final newList = state.countries
          .where((country) =>
              country.name.toLowerCase().contains(value.toLowerCase()))
          .toList();
      emit(state.copyWith(searchContries: newList));
    } else {
      emit(state.copyWith(searchContries: state.countries));
    }
  }
}
