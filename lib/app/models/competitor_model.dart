import 'dart:convert';


class CompetitorModel {
  
  final String countryId;
  final String countryFlagUrl;
  final String competitorName;
  final int position;
  final String resultPosition;
  final String resultWinnerLoserTie;
  final String resultMark;
  CompetitorModel({
    required this.countryId,
    required this.countryFlagUrl,
    required this.competitorName,
    required this.position,
    required this.resultPosition,
    required this.resultWinnerLoserTie,
    required this.resultMark,
  });


  Map<String, dynamic> toMap() {
    return {
      'country_id': countryId,
      'country_flag_url': countryFlagUrl,
      'competitor_name': competitorName,
      'position': position,
      'result_position': resultPosition,
      'result_winnerLoserTie': resultWinnerLoserTie,
      'resultMark': resultMark,
    };
  }

  factory CompetitorModel.fromMap(Map<String, dynamic> map) {
    return CompetitorModel(
      countryId: map['country_id'] ?? '',
      countryFlagUrl: map['country_flag_url'] ?? '',
      competitorName: map['competitor_name'] ?? '',
      position: map['position']?.toInt() ?? 0,
      resultPosition: map['result_position'] ?? '',
      resultWinnerLoserTie: map['result_winnerLoserTie'] ?? '',
      resultMark: map['resultMark'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory CompetitorModel.fromJson(String source) => CompetitorModel.fromMap(json.decode(source));
}
