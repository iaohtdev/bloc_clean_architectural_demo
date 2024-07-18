import 'package:bloc_clean_architectural_demo/data/datasources/demo_remote_data_source.dart';
import 'package:bloc_clean_architectural_demo/data/models/demo_model.dart';
import 'package:bloc_clean_architectural_demo/domain/repositories/demo_repository.dart';

class CastRepositoryImpl implements CastRepository {
  final DemoRemoteDataSource remoteDataSource;
  CastRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<DemoModel>> fetchCastMovie(int id) async {
    final casts = await remoteDataSource.fetchCastMovie(id);
    return casts;
  }
}