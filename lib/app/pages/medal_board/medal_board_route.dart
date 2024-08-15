import 'package:flutter/material.dart';
import 'package:olimpiadas_paris/app/pages/medal_board/medal_board_controller.dart';
import 'package:olimpiadas_paris/app/pages/medal_board/medal_board_page.dart';
import 'package:provider/provider.dart';

class MedalBoardRoute {
  MedalBoardRoute._();

  static Widget get pages => MultiProvider(
        providers: [
          Provider(create: (context) => MedalBoardController(countryRepository: context.read()),)
        ],
        child: const MedalBoardPage(),
      );
}
