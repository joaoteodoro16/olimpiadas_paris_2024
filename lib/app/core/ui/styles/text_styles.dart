import 'package:flutter/material.dart';
import 'package:olimpiadas_paris/app/core/ui/styles/colors_app.dart';

class TextStyles {
  static TextStyles? _i;

  TextStyles._();
  static TextStyles get instance => _i ??= TextStyles._();

  String get font => 'Sarabun';

  TextStyle get _baseStyle => TextStyle(
    fontFamily: font,
    color: ColorsApp.instance.primary
  );

  TextStyle get regular => _baseStyle.copyWith();

  TextStyle get medium => _baseStyle.copyWith(
    fontWeight: FontWeight.w500
  );

  TextStyle get semiBold => _baseStyle.copyWith(
    fontWeight: FontWeight.w600
  );

  TextStyle get bold => _baseStyle.copyWith(
    fontWeight: FontWeight.w700
  );

  TextStyle get titleBold => bold.copyWith(
    fontSize: 20,
    
  );

}

extension TextStylesExtension on BuildContext {
  TextStyles get textStyle => TextStyles.instance;
}
