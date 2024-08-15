import 'package:equatable/equatable.dart';
import 'package:match/match.dart';
import 'package:olimpiadas_paris/app/models/country_model.dart';

part 'medal_board_state.g.dart';

@match
enum MedalBoardStatus { initial, loading, loaded, error }

class MedalBoardState extends Equatable {
  final MedalBoardStatus status;
  final List<CountryModel> countries;
  final String errorMessage;
  final CountryModel? favoriteCountry;

  const MedalBoardState({
    required this.status,
    required this.countries,
    required this.errorMessage,
    this.favoriteCountry,
  });

  MedalBoardState.initial()
      : status = MedalBoardStatus.initial,
        countries = [],
        errorMessage = "",
        favoriteCountry = null;

  @override
  List<Object?> get props => [status, countries, errorMessage, favoriteCountry];

  MedalBoardState copyWith({
    MedalBoardStatus? status,
    List<CountryModel>? countries,
    String? errorMessage,
    CountryModel? favoriteCountry,
  }) {
    return MedalBoardState(
      status: status ?? this.status,
      countries: countries ?? this.countries,
      errorMessage: errorMessage ?? this.errorMessage,
      favoriteCountry: favoriteCountry ?? this.favoriteCountry,
    );
  }
}
