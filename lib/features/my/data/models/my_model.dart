import '../../domain/entities/my_entitiy.dart';

class MyModel extends MyEntity {
  MyModel();

  factory MyModel.fromJson(Map<String, dynamic> json) {
    return MyModel();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}
