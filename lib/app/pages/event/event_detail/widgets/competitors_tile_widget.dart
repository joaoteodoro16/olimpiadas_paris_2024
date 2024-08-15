import 'package:flutter/material.dart';
import 'package:olimpiadas_paris/app/core/ui/styles/text_styles.dart';
import 'package:olimpiadas_paris/app/models/competitor_model.dart';

class CompetitorsTileWidget extends StatelessWidget {
  final List<CompetitorModel> competitors;
  const CompetitorsTileWidget({super.key, required this.competitors});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: competitors.length,
      itemBuilder: (context, index) {
        final competitor = competitors[index];
        return Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Row(
                  children: [
                    if (competitor.countryFlagUrl.isNotEmpty)
                      Image.network(competitor.countryFlagUrl, width: 45)
                    else
                      const SizedBox.shrink(),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Text(
                        competitor.competitorName,
                        style: context.textStyle.regular.copyWith(
                          color: competitor.resultWinnerLoserTie == "W"
                              ? Colors.green
                              : competitor.resultWinnerLoserTie == "L"
                                  ? Colors.red
                                  : null,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
