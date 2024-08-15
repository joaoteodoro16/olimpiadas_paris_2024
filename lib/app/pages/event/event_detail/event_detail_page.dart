import 'package:flutter/material.dart';
import 'package:olimpiadas_paris/app/core/ui/styles/colors_app.dart';
import 'package:olimpiadas_paris/app/core/ui/styles/text_styles.dart';
import 'package:olimpiadas_paris/app/core/ui/widgets/card_app.dart';
import 'package:olimpiadas_paris/app/core/ui/widgets/olimpic_app_bar.dart';
import 'package:olimpiadas_paris/app/core/util/date_formatter_util.dart';
import 'package:olimpiadas_paris/app/models/event_model.dart';
import 'package:olimpiadas_paris/app/pages/event/event_detail/widgets/competitors_tile_widget.dart';

class EventDetailPage extends StatelessWidget {
  final EventModel event;
  const EventDetailPage({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.primary,
      appBar: OlimpicAppBar(
        color: context.colors.primary,
        titleColor: Colors.white,
        iconsColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                event.disciplineName,
                style: context.textStyle.titleBold.copyWith(
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              Text(
                event.detailedEventName,
                style: context.textStyle.regular.copyWith(color: Colors.white),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Datas e locais do evento",
                style: context.textStyle.titleBold.copyWith(
                  color: Colors.white,
                ),
              ),
              Text(
                "Local: ${event.vanueName}",
                style: context.textStyle.regular.copyWith(color: Colors.white),
              ),
              Row(
                children: [
                  Text(
                    "Data: ${DateFormatterUtil.formatDateToBrazilian(event.startDate)}",
                    style:
                        context.textStyle.regular.copyWith(color: Colors.white),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Text(
                    "Horário: ${DateFormatterUtil.formatDateTimeToBrazilian(event.startDate)} Hrs.",
                    style:
                        context.textStyle.regular.copyWith(color: Colors.white),
                  ),
                ],
              ),
              Text(
                "Situação: Finished",
                style: context.textStyle.titleBold.copyWith(
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              CardApp(
                title: 'Competidores',
                child: CompetitorsTileWidget(
                  competitors: event.competitors,
                )
              ),
            ],
          ),
        ),
      ),
    );
  }
}
