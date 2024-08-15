import 'package:flutter/material.dart';
import 'package:olimpiadas_paris/app/models/country_model.dart';
import 'package:olimpiadas_paris/app/pages/home/home_controller.dart';
import 'package:olimpiadas_paris/app/pages/home/home_page.dart';
import 'package:olimpiadas_paris/app/repositories/event/event_repository.dart';
import 'package:olimpiadas_paris/app/repositories/event/event_repository_impl.dart';
import 'package:olimpiadas_paris/app/repositories/discipline/discipline_repository.dart';
import 'package:olimpiadas_paris/app/repositories/discipline/discipline_repository_impl.dart';
import 'package:olimpiadas_paris/app/services/event/event_service.dart';
import 'package:olimpiadas_paris/app/services/event/event_service_impl.dart';
import 'package:provider/provider.dart';

class HomeRouter {
  HomeRouter._();

  static Widget get pages => MultiProvider(
        providers: [
          Provider<DisciplineRepository>(
            create: (context) => DisciplineRepositoryImpl(dio: context.read()),
          ),
          Provider<EventRepository>(
            create: (context) => EventRepositoryImpl(dio: context.read()),
          ),
          Provider<EventService>(create: (context) => EventServiceImpl(eventRepository: context.read()),),
          Provider(
            create: (context) => HomeController(
              countryRepository: context.read(),
              sportsRepository: context.read(),
              eventService: context.read()
            ),
          )
        ],
        builder: (context, child) {
          final args =
              ModalRoute.of(context)?.settings.arguments as CountryModel;
          return HomePage(
            favoriteCountry: args,
          );
        },
      );
}
