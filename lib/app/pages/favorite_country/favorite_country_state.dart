import 'package:equatable/equatable.dart';
import 'package:match/match.dart';
import 'package:olimpiadas_paris/app/models/country_model.dart';

part 'favorite_country_state.g.dart';

@match
enum FavoriteCountryStatus { initial, loading, loaded, error }

class FavoriteCountryState extends Equatable {
  final FavoriteCountryStatus status;
  final String? errorMessage;
  final List<CountryModel> countries;
  final List<CountryModel> searchContries;

    const FavoriteCountryState(this.searchContries, {
    required this.status,
    required this.countries,
    this.errorMessage
  });

  FavoriteCountryState.initial()
      : status = FavoriteCountryStatus.initial,
        errorMessage = "",
        countries = [],
        searchContries = [];

  @override
  List<Object?> get props => [status, errorMessage, countries, searchContries];
  FavoriteCountryState copyWith({
    FavoriteCountryStatus? status,
    String? errorMessage,
    List<CountryModel>? countries,    
    List<CountryModel>? searchContries,    
  }) {
    return FavoriteCountryState(
          status: status ?? this.status,
      errorMessage: errorMessage ?? '',
      countries: countries ?? this.countries,
      searchContries = searchContries ?? this.searchContries,
    );
  }
}
