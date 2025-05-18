import 'dart:convert';

import '../../../../core/databases/cache/cache_helper.dart';
import '../../../../core/errors/expentions.dart';
import '../models/my_model.dart';

class MyLocalDataSource {
  final CacheHelper cache;
  final String key = "CachedMy";
  MyLocalDataSource({required this.cache});

  cacheMy(MyModel? myToCache) {
    if (myToCache != null) {
      cache.saveData(
        key: key,
        value: json.encode(myToCache.toJson()),
      );
    } else {
      throw CacheExeption(
        errorMessage: "No Internet Connection",
      );
    }
  }

  Future<MyModel> getLastMy() {
    final jsonString = cache.getDataString(key: key);

    if (jsonString != null) {
      return Future.value(
        MyModel.fromJson(json.decode(jsonString)),
      );
    } else {
      throw CacheExeption(
        errorMessage: "No Internet Connection",
      );
    }
  }
}
