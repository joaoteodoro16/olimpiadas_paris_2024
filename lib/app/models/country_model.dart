import 'dart:convert';

class CountryModel {

  final String id;
  final String name;
  final String continent;
  final String flagUrl;
  final int goldMedals;
  final int silverMedals;
  final int bronzeMedals;
  final int totalMedals;
  final int rank;
  final int rankTotalMedals;
  CountryModel({
    required this.id,
    required this.name,
    required this.continent,
    required this.flagUrl,
    required this.goldMedals,
    required this.silverMedals,
    required this.bronzeMedals,
    required this.totalMedals,
    required this.rank,
    required this.rankTotalMedals,
  });
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'continent': continent,
      'flag_url': flagUrl,
      'gold_medals': goldMedals,
      'silver_medals': silverMedals,
      'bronze_medals': bronzeMedals,
      'total_medals': totalMedals,
      'rank': rank,
      'rank_total_medals': rankTotalMedals,
    };
  }

  factory CountryModel.fromMap(Map<String, dynamic> map) {
    return CountryModel(
      id: map['id'] ?? "",
      name: map['name'] ?? '',
      continent: map['continent'] ?? '',
      flagUrl: map['flag_url'] ?? '',
      goldMedals: map['gold_medals']?.toInt() ?? 0,
      silverMedals: map['silver_medals']?.toInt() ?? 0,
      bronzeMedals: map['bronze_medals']?.toInt() ?? 0,
      totalMedals: map['total_medals']?.toInt() ?? 0,
      rank: map['rank']?.toInt() ?? 0,
      rankTotalMedals: map['rank_total_medals']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory CountryModel.fromJson(String source) => CountryModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'CountryModel(id: $id, name: $name, continent: $continent, flag_url: $flagUrl, gold_medals: $goldMedals, silver_medals: $silverMedals, bronze_medals: $bronzeMedals, total_medals: $totalMedals, rank: $rank, rank_total_medals: $rankTotalMedals)';
  }
}
