import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:olimpiadas_paris/app/core/ui/base_state/base_state.dart';
import 'package:olimpiadas_paris/app/core/ui/styles/text_styles.dart';
import 'package:olimpiadas_paris/app/core/ui/widgets/button_app.dart';
import 'package:olimpiadas_paris/app/core/ui/widgets/card_app.dart';
import 'package:olimpiadas_paris/app/core/ui/widgets/medal_board_tile_widget.dart';
import 'package:olimpiadas_paris/app/core/ui/widgets/olimpic_app_bar.dart';
import 'package:olimpiadas_paris/app/models/country_model.dart';
import 'package:olimpiadas_paris/app/models/event_model.dart';
import 'package:olimpiadas_paris/app/pages/home/home_controller.dart';
import 'package:olimpiadas_paris/app/pages/home/home_state.dart';
import 'package:olimpiadas_paris/app/core/ui/widgets/event_card_widget.dart';

class HomePage extends StatefulWidget {
  final CountryModel favoriteCountry;
  const HomePage({super.key, required this.favoriteCountry});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends BaseState<HomePage, HomeController> {
  final ScrollController _scrollController = ScrollController();
  final FocusNode _focusNode = FocusNode();

  @override
  void onReady() async {
    await controller.getCountriesMedalBoard();
    await controller.getAllSports();
    await controller.getAllFavoriteCountryEvents();

    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
    });

    super.onReady();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeController, HomeState>(
      listener: (context, state) {
        state.status.matchAny(
          any: () {
            hideLoader();
          },
          loading: () => showLoader(),
          error: () {
            hideLoader();
            showError(state.errorMessage ?? '');
          },
        );
      },
      child: Scaffold(
        appBar: OlimpicAppBar(
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 15),
              child: InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed('/favoriteCountry');
                },
                child: Image.network(
                  widget.favoriteCountry.flagUrl,
                  width: 36,
                ),
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          controller: _scrollController,
          child: Column(
            children: [
              BlocSelector<HomeController, HomeState, List<CountryModel>>(
                selector: (state) => state.countries,
                builder: (context, countries) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: CardApp(
                      title: 'Confira o quadro de medalhas',
                      child: MedalBoardTileWidget(
                        countries: countries,
                        favoriteCountry: widget.favoriteCountry,
                      ),
                      onTap: () {
                        Navigator.of(context).pushNamed('/medalBoard');
                      },
                    ),
                  );
                },
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: ButtonApp(
                  text: 'Pesquisar Eventos',
                  onPressed: () {
                    Navigator.of(context).pushNamed('/event');
                  },
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: SizedBox(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Acompanhe as equipes do ${widget.favoriteCountry.name}',
                        style: context.textStyle.titleBold,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      BlocSelector<HomeController, HomeState, List<EventModel>>(
                        selector: (state) => state.events,
                        builder: (context, events) {
                          return ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: events.length,
                            itemBuilder: (context, index) {
                              final event = events[index];
                              return EventCardWidget(
                                event: event,
                              );
                            },
                          );
                        },
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
