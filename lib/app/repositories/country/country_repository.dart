import 'package:olimpiadas_paris/app/models/country_model.dart';

abstract class CountryRepository {
Future<List<CountryModel>> getAll();
}