import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:olimpiadas_paris/app/core/ui/styles/colors_app.dart';
import 'package:olimpiadas_paris/app/core/ui/styles/text_styles.dart';
import 'package:olimpiadas_paris/app/pages/event/search_event/search_event_controller.dart';

class FilterFieldEventDateWidget extends StatelessWidget {
  final String value;
  final DateTime selectedDate;
  const FilterFieldEventDateWidget({super.key, required this.value, required this.selectedDate});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        await _selectDate(context);
      },
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.grey.shade300),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                value,
                style: context.textStyle.semiBold.copyWith(
                  fontSize: 15,
                ),
              ),
              Icon(
                Icons.arrow_forward_ios,
                size: 15,
                color: context.colors.primary,
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final controller = context.read<SearchEventController>();

    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if(picked != null){
        controller.updateEventDatePicked(date: picked);
        controller.getEventsByFilter();
    }
  }
}
