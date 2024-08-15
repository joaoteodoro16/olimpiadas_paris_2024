import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:olimpiadas_paris/app/core/ui/base_state/base_state.dart';
import 'package:olimpiadas_paris/app/core/ui/widgets/olimpic_app_bar.dart';
import 'package:olimpiadas_paris/app/core/ui/widgets/medal_board_tile_widget.dart';
import 'package:olimpiadas_paris/app/pages/medal_board/medal_board_controller.dart';
import 'package:olimpiadas_paris/app/pages/medal_board/medal_board_state.dart';

class MedalBoardPage extends StatefulWidget {
  const MedalBoardPage({super.key});

  @override
  State<MedalBoardPage> createState() => _MedalBoardPageState();
}

class _MedalBoardPageState
    extends BaseState<MedalBoardPage, MedalBoardController> {
  @override
  void onReady() {
    controller.getCountriesMedalBoard();
    super.onReady();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MedalBoardController, MedalBoardState>(
      listener: (context, state) {
        state.status.matchAny(
          any: () => hideLoader(),
          loading: () => showLoader(),
          error: () {
            hideLoader();
            showError(state.errorMessage);
          },
        );
      },
      builder: (context, state) {
        return Scaffold(
          appBar: OlimpicAppBar(),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [MedalBoardTileWidget(countries: state.countries, favoriteCountry: state.favoriteCountry)],
            ),
          ),
        );
      },
    );
  }
}
