import 'package:flutter/material.dart';
import 'package:olimpiadas_paris/app/core/ui/styles/text_styles.dart';

class OlimpicAppBar extends AppBar {
  OlimpicAppBar({
    super.key,
    List<Widget>? actions,
    Color? color,
    Color? titleColor,
    Color? iconsColor,
  }) : super(
          centerTitle: true,
          title: Text(
            'Olimpíadas Paris 2024',
            style: TextStyles.instance.titleBold
                .copyWith(fontSize: 17, color: titleColor),
          ),
          backgroundColor: color,
          iconTheme: IconThemeData(color: iconsColor),
          actions: actions,
        );
}
