import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:olimpiadas_paris/app/core/exceptions/repository_exception.dart';
import 'package:olimpiadas_paris/app/core/shared_preferences/shared_preferences_util.dart';
import 'package:olimpiadas_paris/app/pages/medal_board/medal_board_state.dart';
import 'package:olimpiadas_paris/app/repositories/country/country_repository.dart';

class MedalBoardController extends Cubit<MedalBoardState> {
  final CountryRepository _countryRepository;
  MedalBoardController({required CountryRepository countryRepository})
      : _countryRepository = countryRepository,
        super(MedalBoardState.initial());

  Future<void> getCountriesMedalBoard() async {
    try {
      emit(state.copyWith(status: MedalBoardStatus.loading));
      var countries = await _countryRepository.getAll();
      final favoriteCountry = await SharedPreferencesUtil.getFavoriteCountry();
      emit(state.copyWith(
          status: MedalBoardStatus.loaded,
          countries: countries,
          favoriteCountry: favoriteCountry));
    } on RepositoryException catch(e){
      emit(state.copyWith(
          errorMessage: e.message));
    }catch (e, s) {
      log("Erro inesperado ao buscar os paises do Quadro de Medalhas - MedalBoardController: getCountriesMedalBoard ",
          error: e, stackTrace: s);
      emit(state.copyWith(
          errorMessage: "Erro ao buscar os paises do Quadro de Medalhas"));
    }
  }
}
