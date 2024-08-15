import 'package:flutter/material.dart';
import 'package:olimpiadas_paris/app/core/ui/styles/colors_app.dart';
import 'package:olimpiadas_paris/app/core/ui/styles/text_styles.dart';

class CardApp extends StatelessWidget {
  final Widget child;
  final String? title;
  final VoidCallback? onTap;
  const CardApp({ super.key, required this.child, this.title, this.onTap });

   @override
   Widget build(BuildContext context) {
       return InkWell(
         onTap: onTap,
         child: Container(
           width: double.infinity,
           decoration: BoxDecoration(
             color: context.colors.lightGrey,
             borderRadius: BorderRadius.circular(10),
             border: Border.all(
               color: context.colors.grey,
             ),
           ),
           child: Padding(
             padding: const EdgeInsets.all(12),
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.stretch,
               children: [
                 Text(
                   title ?? '',
                   style: context.textStyle.regular.copyWith(fontSize: 16),
                 ),
                 const SizedBox(
                   height: 20,
                 ),
                 child,
                 const SizedBox(
                   height: 10,
                 ),
               ],
             ),
           ),
         ),
       );
  }
}