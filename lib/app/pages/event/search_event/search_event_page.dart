import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:olimpiadas_paris/app/core/ui/base_state/base_state.dart';
import 'package:olimpiadas_paris/app/core/ui/styles/colors_app.dart';
import 'package:olimpiadas_paris/app/core/ui/styles/text_styles.dart';
import 'package:olimpiadas_paris/app/core/ui/widgets/event_card_widget.dart';
import 'package:olimpiadas_paris/app/core/ui/widgets/olimpic_app_bar.dart';
import 'package:olimpiadas_paris/app/core/util/date_formatter_util.dart';
import 'package:olimpiadas_paris/app/models/country_model.dart';
import 'package:olimpiadas_paris/app/models/discipline_model.dart';
import 'package:olimpiadas_paris/app/pages/event/search_event/search_event_controller.dart';
import 'package:olimpiadas_paris/app/pages/event/search_event/search_event_state.dart';
import 'package:olimpiadas_paris/app/pages/event/search_event/widgets/filter_field_event_date_widget.dart';
import 'package:olimpiadas_paris/app/pages/event/search_event/widgets/filter_field_event_widget.dart';

class SearchEventPage extends StatefulWidget {
  const SearchEventPage({super.key});

  @override
  State<SearchEventPage> createState() => _SearchEventPageState();
}

class _SearchEventPageState
    extends BaseState<SearchEventPage, SearchEventController> {
  @override
  void onReady() async {
    await controller.getValueFilters();
    controller.getEventsByFilter();
    super.onReady();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SearchEventController, SearchEventState>(
      listener: (context, state) {
        state.status.matchAny(
          any: () => hideLoader(),
          loading: () => showLoader(),
          error: () {
            hideLoader();
            showError(state.errorMessage ?? '');
          },
        );
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: context.colors.primary,
          appBar: OlimpicAppBar(
            color: context.colors.primary,
            titleColor: Colors.white,
            iconsColor: Colors.white,
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    "Confira todos os eventos das \n Olimpíadas Paris 2024",
                    style: context.textStyle.titleBold
                        .copyWith(color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  FilterFieldEventWidget(
                    items: state.countries,
                    value: state.countrySelected?.name ?? 'Selecione o País',
                    title: 'Selecione o País',
                    hintText: 'Selecione o País',
                    displayField: (CountryModel country) {
                      return Row(
                        children: [
                          if (country.flagUrl.isNotEmpty)
                            Image.network(country.flagUrl,
                                width: 32, height: 32)
                          else
                            const Icon(Icons.flag,
                                size:
                                    32), // Placeholder quando a URL estiver vazia
                          const SizedBox(width: 8),
                          Text(country.name),
                        ],
                      );
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  FilterFieldEventWidget(
                    items: state.disciplines,
                    value:
                        state.disciplineSelected?.name ?? 'Selecione o esporte',
                    title: 'Selecione o esporte',
                    hintText: 'Selecione o esporte',
                    displayField: (DisciplineModel sport) {
                      return Row(
                        children: [
                          if (sport.pictogramUrl.isNotEmpty)
                            Image.network(sport.pictogramUrl,
                                width: 32, height: 32)
                          else
                            const Icon(Icons.sports,
                                size:
                                    32), // Placeholder quando a URL estiver vazia
                          const SizedBox(width: 8),
                          Text(sport.name),
                        ],
                      );
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  FilterFieldEventDateWidget(
                    value: DateFormatterUtil.formatDateToBrazilian(
                      state.selectedDate?.toIso8601String() ??
                          DateTime.now().toIso8601String(),
                    ),
                    selectedDate: state.selectedDate ?? DateTime.now(),
                  ),
                  Row(
                    children: [
                      Checkbox(
                        value: state.isFinishedEventCheck,
                        visualDensity: VisualDensity.compact,
                        onChanged: (bool? value) async {
                          controller.updateEventFinishedStatus(value: value);
                          await controller.getEventsByFilter();
                        },
                        fillColor: MaterialStateProperty.all(Colors.white),
                        side: const BorderSide(color: Colors.black),
                        checkColor: context.colors.primary,
                      ),
                      Text(
                        'Finalizados',
                        style: context.textStyle.regular
                            .copyWith(color: Colors.white),
                      )
                    ],
                  ),
                  ListView.builder(
                    itemCount: state.events.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      final event = state.events[index];
                      return EventCardWidget(event: event);
                    },
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
