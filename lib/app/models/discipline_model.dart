import 'dart:convert';


class DisciplineModel {
  
  final String id;
  final String name;
  final String pictogramUrl;
  
  DisciplineModel({
    required this.id,
    required this.name,
    required this.pictogramUrl,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'pictogram_url': pictogramUrl,
    };
  }

  factory DisciplineModel.fromMap(Map<String, dynamic> map) {
    return DisciplineModel(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      pictogramUrl: map['pictogram_url'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory DisciplineModel.fromJson(String source) => DisciplineModel.fromMap(json.decode(source));
}
