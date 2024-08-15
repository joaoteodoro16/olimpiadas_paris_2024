
import 'package:flutter/material.dart';


class ColorsApp {
  static ColorsApp? _i;
  
  ColorsApp._();

  static ColorsApp get instance {
    _i ??= ColorsApp._();
    return _i!;
  }

  Color get primary => const Color(0XFF003956);
  Color get secondary => const Color(0XFF16b5ab);
  Color get lightGrey => const Color(0XFFEBEBEB);
  Color get grey => const Color(0XFFD8D8D8);

}

extension ColorsAppExtension on BuildContext {
  ColorsApp get colors => ColorsApp.instance;
}