import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:olimpiadas_paris/app/core/provider/application_binding.dart';
import 'package:olimpiadas_paris/app/core/ui/theme/theme_config.dart';
import 'package:olimpiadas_paris/app/pages/event/event_detail/event_detail_route.dart';
import 'package:olimpiadas_paris/app/pages/event/search_event/search__event_route.dart';
import 'package:olimpiadas_paris/app/pages/favorite_country/favorite_country_route.dart';
import 'package:olimpiadas_paris/app/pages/home/home_router.dart';
import 'package:olimpiadas_paris/app/pages/medal_board/medal_board_route.dart';
import 'package:olimpiadas_paris/app/pages/splash/splash_page.dart';


class OlimpiadasApp extends StatelessWidget {
  const OlimpiadasApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ApplicationBinding(
      child: MaterialApp(
        title: 'Olimpiadas Paris',
        theme: ThemeConfig.theme,
        locale: const Locale('pt', 'BR'),
        supportedLocales: const [Locale('pt', 'BR')],
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        ],
        routes: {
          '/': (context) => const SplashPage(),
          '/home': (context) => HomeRouter.pages,
          '/favoriteCountry': (context) => FavoriteCountryRoute.pages,
          '/medalBoard': (context) => MedalBoardRoute.pages,
          '/event': (context) => SearchEventRoute.pages,
          '/event/eventDetail': (context) => EventDetailRoute.pages
        },
      ),
    );
  }
}
