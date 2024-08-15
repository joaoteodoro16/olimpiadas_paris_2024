import 'package:flutter/material.dart';
import 'package:olimpiadas_paris/app/core/ui/styles/colors_app.dart';

class AppStyles {
  static AppStyles? _i;

  AppStyles._();
  static AppStyles get instance => _i ??= AppStyles._();

  ButtonStyle get primaryButton => ElevatedButton.styleFrom(
        textStyle: const TextStyle(color: Colors.white),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(7),
        ),
        backgroundColor: ColorsApp.instance.primary,
      );
}

extension AppStylesExtensions on BuildContext {
  AppStyles get appStyles => AppStyles.instance;
}
