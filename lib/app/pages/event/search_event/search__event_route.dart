import 'package:flutter/material.dart';
import 'package:olimpiadas_paris/app/pages/event/search_event/search_event_controller.dart';
import 'package:olimpiadas_paris/app/pages/event/search_event/search_event_page.dart';
import 'package:olimpiadas_paris/app/repositories/discipline/discipline_repository.dart';
import 'package:olimpiadas_paris/app/repositories/discipline/discipline_repository_impl.dart';
import 'package:olimpiadas_paris/app/repositories/event/event_repository.dart';
import 'package:olimpiadas_paris/app/repositories/event/event_repository_impl.dart';
import 'package:olimpiadas_paris/app/services/event/event_service.dart';
import 'package:olimpiadas_paris/app/services/event/event_service_impl.dart';
import 'package:provider/provider.dart';

class SearchEventRoute {
  SearchEventRoute._();

  static Widget get pages => MultiProvider(
        providers: [
          Provider<DisciplineRepository>(create: (context) => DisciplineRepositoryImpl(dio: context.read()),),
          Provider<EventRepository>(create: (context) => EventRepositoryImpl(dio: context.read()),),
          Provider<EventService>(create: (context) => EventServiceImpl(eventRepository: context.read()),),
          Provider(create: (context) => SearchEventController(countryRepository: context.read(), disciplineRepository: context.read(), eventService: context.read()),)
        ],
        child: const SearchEventPage(),
      );
}
