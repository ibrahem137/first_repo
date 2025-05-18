import '../../../../core/databases/api/api_consumer.dart';
import '../../../../core/databases/api/end_points.dart';
import '../../../../core/params/params.dart';
import '../models/my_model.dart';

class MyRemoteDataSource {
  final ApiConsumer api;

  MyRemoteDataSource({required this.api});
  Future<MyModel> getMy(MyParams params) async {
    final response = await api.get(
      "${EndPoints.my}/${params.id}",
    );
    return MyModel.fromJson(response);
  }
}
