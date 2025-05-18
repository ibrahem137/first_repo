import 'package:dartz/dartz.dart';
import 'package:flutter_application_1/features/my/domain/entities/my_entitiy.dart';
import 'package:flutter_application_1/features/my/domain/repositories/my_repository.dart';

class GetMy {
  final MyRepository repository;

  GetMy({required this.repository});

  Future<Either<Failure, MyEntity>> call({
    required MyParams params,
  }) {
    return repository.getMy(params: params);
  }
}
