import 'package:flutter/material.dart';
import 'package:olimpiadas_paris/app/pages/favorite_country/favorite_country_controller.dart';
import 'package:olimpiadas_paris/app/pages/favorite_country/favorite_country_page.dart';
import 'package:provider/provider.dart';

class FavoriteCountryRoute {
  FavoriteCountryRoute._();

  static Widget get pages => MultiProvider(
        providers: [
          Provider(create: (context) => FavoriteCountryController(repository: context.read()),)
        ],
        child: const FavoriteCountryPage(),
      );
}
