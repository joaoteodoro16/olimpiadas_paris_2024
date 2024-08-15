import 'package:flutter/material.dart';
import 'package:olimpiadas_paris/app/core/ui/styles/colors_app.dart';
import 'package:olimpiadas_paris/app/core/ui/styles/text_styles.dart';
import 'package:olimpiadas_paris/app/core/util/date_formatter_util.dart';
import 'package:olimpiadas_paris/app/models/event_model.dart';

class EventCardWidget extends StatelessWidget {
  final EventModel event;
  const EventCardWidget({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: InkWell(
        onTap: () {
          Navigator.of(context)
              .pushNamed('/event/eventDetail', arguments: event);
        },
        child: Container(
          decoration: BoxDecoration(
              color: context.colors.grey,
              borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(
                    event.disciplinePictogram,
                  ),
                  backgroundColor: Colors.white,
                  // radius: 28,
                ),
                const SizedBox(
                  width: 12,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      event.disciplineName,
                      style: context.textStyle.semiBold.copyWith(fontSize: 16),
                    ),
                    Text(event.detailedEventName),
                    Text(event.status),
                    Text(
                        "${DateFormatterUtil.formatDateToBrazilian(event.startDate)} - ${DateFormatterUtil.formatDateTimeToBrazilian(event.startDate)}")
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
