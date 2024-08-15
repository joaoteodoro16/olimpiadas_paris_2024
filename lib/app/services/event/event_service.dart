import 'package:olimpiadas_paris/app/models/event_model.dart';

abstract class EventService {

  Future<List<EventModel>> getAll();
  Future<List<EventModel>> getAllByFilters({DateTime? date, String? idCountry, String? discipline});
}