import 'package:flutter/material.dart';
import 'package:olimpiadas_paris/app/core/ui/styles/colors_app.dart';
import 'package:olimpiadas_paris/app/models/country_model.dart';

class MedalBoardTileWidget extends StatelessWidget {
  final List<CountryModel> countries;
  final CountryModel? favoriteCountry;
  const MedalBoardTileWidget({super.key, required this.countries, this.favoriteCountry,});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final double columnWidth = (constraints.maxWidth - 63 - 100) / 4;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Table(
              border: TableBorder(
                bottom: BorderSide(color: context.colors.lightGrey, width: 1),
              ),
              columnWidths: {
                0: const FixedColumnWidth(20),
                1: const FixedColumnWidth(28),
                2: FixedColumnWidth(columnWidth),
                3: const FixedColumnWidth(34),
                4: const FixedColumnWidth(34),
                5: const FixedColumnWidth(34),
                6: const FixedColumnWidth(34),
              },
              children: [
                TableRow(
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: context.colors.grey,
                        width: 1,
                      ),
                    ),
                  ),
                  children: const [
                    TableCell(
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(''),
                        ),
                      ),
                    ),
                    TableCell(
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(''),
                        ),
                      ),
                    ),
                    TableCell(
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(''),
                        ),
                      ),
                    ),
                    TableCell(
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Align(
                          alignment: Alignment.center,
                          child: Icon(
                            Icons.circle,
                            color: Color(0XFFBEA34B),
                            size: 15,
                          ),
                        ),
                      ),
                    ),
                    TableCell(
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Align(
                          alignment: Alignment.center,
                          child: Icon(
                            Icons.circle,
                            color: Color(0XFFb8b8b8),
                            size: 15,
                          ),
                        ),
                      ),
                    ),
                    TableCell(
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Align(
                          alignment: Alignment.center,
                          child: Icon(
                            Icons.circle,
                            color: Color(0XFF895202),
                            size: 15,
                          ),
                        ),
                      ),
                    ),
                    TableCell(
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Align(
                          alignment: Alignment.center,
                          child: Icon(
                            Icons.circle,
                            color: Colors.red,
                            size: 15,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                for (var medal in countries)
                  TableRow(
                    decoration: BoxDecoration(
                      color: favoriteCountry?.id == medal.id ? Colors.grey.shade400 : null  ,
                      border: Border(
                          bottom:
                              BorderSide(color: context.colors.grey, width: 1)),
                    ),
                    children: [
                      TableCell(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text("${medal.rank}º "),
                          ),
                        ),
                      ),
                      TableCell(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Image.network(medal.flagUrl, height: 20),
                          ),
                        ),
                      ),
                      TableCell(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              medal.name,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                      ),
                      TableCell(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(medal.goldMedals.toString()),
                          ),
                        ),
                      ),
                      TableCell(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(medal.silverMedals.toString()),
                          ),
                        ),
                      ),
                      TableCell(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(medal.bronzeMedals.toString()),
                          ),
                        ),
                      ),
                      TableCell(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(medal.totalMedals.toString()),
                          ),
                        ),
                      ),
                    ],
                  ),
              ],
            ),
          ],
        );
      },
    );
  }
}
