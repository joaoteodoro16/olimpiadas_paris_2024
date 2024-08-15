
import 'dart:convert';

import 'package:olimpiadas_paris/app/models/competitor_model.dart';

class EventModel {
  final int id;
  final String day;
  final String disciplineName;
  final String disciplinePictogram;
  final String name;
  final String vanueName;
  final String eventName;
  final String detailedEventName;
  final String startDate;
  final String endDate;
  final String status;
  final String genderCode;
  final List<CompetitorModel>  competitors;
  
  EventModel({
    required this.id,
    required this.day,
    required this.disciplineName,
    required this.disciplinePictogram,
    required this.name,
    required this.vanueName,
    required this.eventName,
    required this.detailedEventName,
    required this.startDate,
    required this.endDate,
    required this.status,
    required this.genderCode,
    required this.competitors,
  });


  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'day': day,
      'discipline_name': disciplineName,
      'discipline_pictogram': disciplinePictogram,
      'name': name,
      'venue_name': vanueName,
      'event_name': eventName,
      'detailed_event_name': detailedEventName,
      'start_date': startDate,
      'end_date': endDate,
      'status': status,
      'gender_code': genderCode,
      'competitors': competitors.map((x) => x.toMap()).toList(),
    };
  }

  factory EventModel.fromMap(Map<String, dynamic> map) {
    return EventModel(
      id: map['id'] ?? '',
      day: map['day'] ?? '',
      disciplineName: map['discipline_name'] ?? '',
      disciplinePictogram: map['discipline_pictogram'] ?? '',
      name: map['name'] ?? '',
      vanueName: map['venue_name'] ?? '',
      eventName: map['event_name'] ?? '',
      detailedEventName: map['detailed_event_name'] ?? '',
      startDate: map['start_date'] ?? '',
      endDate: map['end_date'] ?? '',
      status: map['status'] ?? '',
      genderCode: map['gender_code'] ?? '',
      competitors: List<CompetitorModel>.from(map['competitors']?.map((x) => CompetitorModel.fromMap(x)) ?? const []),
    );
  }

  String toJson() => json.encode(toMap());

  factory EventModel.fromJson(String source) => EventModel.fromMap(json.decode(source));
}
