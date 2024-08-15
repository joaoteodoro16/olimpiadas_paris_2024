import 'package:flutter/material.dart';
import 'package:olimpiadas_paris/app/core/ui/rest_client/custom_dio.dart';
import 'package:olimpiadas_paris/app/repositories/country/country_repository.dart';
import 'package:olimpiadas_paris/app/repositories/country/country_repository_impl.dart';

import 'package:provider/provider.dart';

class ApplicationBinding extends StatelessWidget {
  final Widget child;
  const ApplicationBinding({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (context) => CustomDio(),),
        Provider<CountryRepository>(create: (context) => CountryRepositoryImpl(dio: context.read()),)
      ],
      child: child,
    );
  }
}
