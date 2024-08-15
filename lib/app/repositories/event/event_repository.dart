import 'package:olimpiadas_paris/app/models/event_model.dart';

abstract class EventRepository {
  Future<List<EventModel>> getAllEvents();

  Future<List<EventModel>> getAllByFilters({required String endpoint});
}
