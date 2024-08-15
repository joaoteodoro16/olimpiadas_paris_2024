import 'package:equatable/equatable.dart';
import 'package:match/match.dart';
import 'package:olimpiadas_paris/app/models/country_model.dart';
import 'package:olimpiadas_paris/app/models/event_model.dart';
import 'package:olimpiadas_paris/app/models/discipline_model.dart';

part 'search_event_state.g.dart';

@match
enum SearchEventStatus { initial, loading, loaded, error }

class SearchEventState extends Equatable {
  final SearchEventStatus status;
  final List<DisciplineModel> disciplines;
  final List<CountryModel> countries;
  final String? errorMessage;
  final CountryModel? countrySelected;
  final DisciplineModel? disciplineSelected;
  final bool isFinishedEventCheck;
  final DateTime? selectedDate;
  final List<EventModel> events;

  const SearchEventState(
      {required this.status,
      required this.disciplines,
      required this.countries,
      required this.isFinishedEventCheck,
      this.errorMessage,
      this.countrySelected,
      this.disciplineSelected,
      this.selectedDate,
      required this.events});

  SearchEventState.initial()
      : status = SearchEventStatus.initial,
        disciplines = [],
        countries = [],
        isFinishedEventCheck = false,
        errorMessage = "",
        countrySelected = null,
        disciplineSelected = null,
        selectedDate = DateTime.now(),
        events = [];

  @override
  List<Object?> get props => [
        status,
        disciplines,
        countries,
        errorMessage,
        countrySelected,
        disciplineSelected,
        isFinishedEventCheck,
        selectedDate,
        events,
      ];
  SearchEventState copyWith(
      {SearchEventStatus? status,
      List<DisciplineModel>? disciplines,
      List<CountryModel>? countries,
      String? errorMessage,
      CountryModel? countrySelected,
      DisciplineModel? disciplineSelected,
      bool? isFinishedEventCheck,
      DateTime? selectedDate,
      List<EventModel>? events}) {
    return SearchEventState(
      status: status ?? this.status,
      disciplines: disciplines ?? this.disciplines,
      countries: countries ?? this.countries,
      errorMessage: errorMessage ?? this.errorMessage,
      countrySelected: countrySelected ?? this.countrySelected,
      disciplineSelected: disciplineSelected ?? this.disciplineSelected,
      isFinishedEventCheck: isFinishedEventCheck ?? this.isFinishedEventCheck,
      selectedDate: selectedDate ?? this.selectedDate,
      events: events ?? this.events
    );
  }
}
