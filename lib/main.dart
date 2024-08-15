import 'package:flutter/material.dart';
import 'package:olimpiadas_paris/app/olimpiadas_app.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() {
  
   initializeDateFormatting('pt_BR', null).then((_) {
    runApp(const OlimpiadasApp());
  });

  
}
