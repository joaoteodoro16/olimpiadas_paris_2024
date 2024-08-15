import 'package:olimpiadas_paris/app/models/discipline_model.dart';

abstract class DisciplineRepository {

Future<List<DisciplineModel>> getAll();

}