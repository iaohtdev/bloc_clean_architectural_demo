import 'package:bloc_clean_architectural_demo/core/config/api_config.dart';
import 'package:bloc_clean_architectural_demo/data/models/demo_model.dart';
import 'package:bloc_clean_architectural_demo/di.dart';

abstract class DemoRemoteDataSource {
  Future<List<DemoModel>> fetchCastMovie(int id);
}

class DemoRemoteDataSourceImpl implements DemoRemoteDataSource {
  @override
  Future<List<DemoModel>> fetchCastMovie(int id) async {
    List<DemoModel> casts = [];
    final response = await dio.get('${ApiConfig.home}}');
    for (var i in response.data['cast']) {
      if (i['profile_path'] != null) {
        casts.add(DemoModel.fromJson(i));
      }
    }
    return casts;
  }
}
