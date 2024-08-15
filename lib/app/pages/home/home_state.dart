import 'package:equatable/equatable.dart';
import 'package:match/match.dart';

import 'package:olimpiadas_paris/app/models/country_model.dart';
import 'package:olimpiadas_paris/app/models/event_model.dart';
import 'package:olimpiadas_paris/app/models/discipline_model.dart';

part 'home_state.g.dart';

@match
enum HomeStatus {
  initial,
  loading,
  loaded,
  error,
}

class HomeState extends Equatable {
  final HomeStatus status;
  final String? errorMessage;
  final List<CountryModel> countries;
  final List<DisciplineModel> sports;
  final List<DisciplineModel> searchSports;
  final List<EventModel> events;

  const HomeState({
    required this.status,
    required this.countries,
    required this.sports,
    required this.searchSports,
    required this.events,
    this.errorMessage,
  });

  HomeState.initial()
      : errorMessage = "",
        countries = [],
        status = HomeStatus.initial,
        events = [],
        searchSports = [],
        sports = [];

  @override
  List<Object?> get props =>
      [status, events, sports, searchSports, countries, errorMessage];

  HomeState copyWith({
    HomeStatus? status,
    String? errorMessage,
    List<CountryModel>? countries,
    List<DisciplineModel>? sports,
    List<DisciplineModel>? searchSports,
    List<EventModel>? events,
  }) {
    return HomeState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      countries: countries ?? this.countries,
      sports: sports ?? this.sports,
      searchSports: searchSports ?? this.searchSports,
      events: events ?? this.events,
    );
  }
}
