import 'package:bloc_clean_architectural_demo/data/models/demo_model.dart';

abstract class CastRepository {
  Future<List<DemoModel>> fetchCastMovie(int id);
}
