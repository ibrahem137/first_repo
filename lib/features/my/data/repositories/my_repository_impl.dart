import 'package:dartz/dartz.dart';

import '../../../../core/connection/network_info.dart';
import '../../../../core/errors/expentions.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/params/params.dart';
import '../../domain/entities/my_entitiy.dart';
import '../../domain/repositories/my_repository.dart';
import '../datasources/my_local_data_source.dart';
import '../datasources/my_remote_data_source.dart';

class MyRepositoryImpl extends MyRepository {
  final NetworkInfo networkInfo;
  final MyRemoteDataSource remoteDataSource;
  final MyLocalDataSource localDataSource;
  MyRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });
  @override
  Future<Either<Failure, MyEntity>> getMy({
    required MyParams params,
  }) async {
    if (await networkInfo.isConnected!) {
      try {
        final remoteMy = await remoteDataSource.getMy(
          params,
        );
        localDataSource.cacheMy(remoteMy);
        return Right(remoteMy);
      } on ServerException catch (e) {
        return Left(
          Failure(errMessage: e.errorModel.errorMessage),
        );
      }
    } else {
      try {
        final localMy = await localDataSource.getLastMy();
        return Right(localMy);
      } on CacheExeption catch (e) {
        return Left(Failure(errMessage: e.errorMessage));
      }
    }
  }
}
