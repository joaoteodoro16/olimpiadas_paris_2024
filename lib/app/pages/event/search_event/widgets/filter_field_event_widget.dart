import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:olimpiadas_paris/app/core/ui/styles/colors_app.dart';
import 'package:olimpiadas_paris/app/core/ui/styles/text_styles.dart';
import 'package:olimpiadas_paris/app/models/country_model.dart';
import 'package:olimpiadas_paris/app/models/discipline_model.dart';
import 'package:olimpiadas_paris/app/pages/event/search_event/search_event_controller.dart';

class FilterFieldEventWidget<T> extends StatelessWidget {
  final List<T> items;
  final String title;
  final String hintText;
  final String value;
  final Widget Function(T) displayField;

  const FilterFieldEventWidget({
    super.key,
    required this.title,
    required this.hintText,
    required this.items,
    required this.displayField,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        final controller = BlocProvider.of<SearchEventController>(context);
        final object = await _showDialog(context, controller);

        if (object != null) {
          if (object is CountryModel) {
            controller.setCountryFilter(object);
          } else if (object is DisciplineModel) {
            controller.setSportFilter(object);
          }
          await controller.getEventsByFilter();
        }
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

  Future _showDialog(
      BuildContext context, SearchEventController controller) async {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          content: SingleChildScrollView(
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: items.map((item) {
                  return ListTile(
                    title: displayField(item),
                    onTap: () {
                      Navigator.of(context).pop(item);
                    },
                  );
                }).toList(),
              ),
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Limpar Filtro'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Cancelar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
