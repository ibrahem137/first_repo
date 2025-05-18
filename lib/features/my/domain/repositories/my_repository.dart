import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/params/params.dart';
import '../entities/my_entitiy.dart';

abstract class MyRepository {
  Future<Either<Failure, MyEntity>> getMy({
    required MyParams params,
  });
}
