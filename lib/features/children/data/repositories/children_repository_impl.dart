import 'package:baby_care/core/errors/failures.dart';
import 'package:baby_care/features/children/data/datasources/children_local_data_source.dart';
import 'package:baby_care/features/children/data/datasources/children_remote_data_source.dart';
import 'package:baby_care/features/children/data/model/child_model.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'children_repository.dart';

class ChildrenRepositoryImpl implements ChildrenRepository {
  final ChildrenRemoteDataSource remoteDataSource;
  final ChildrenLocalDataSource localDataSource;
  final Connectivity connectivity;

  ChildrenRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.connectivity,
  });
  @override
  Future<Either<Failure, List<ChildModel>>> getChildren() async {
    try {
      final hasConnection1 = await hasConnection();
      if (!hasConnection1) {
        var listChildren = await localDataSource.getCachedChildrenList();

        return right(listChildren);
      } else {
        var respons = await remoteDataSource.getChildren();
        if (respons.statusCode == 200) {
          final data = respons.data['data'] ?? respons.data;
          List<ChildModel> children = [];
          for (var element in (data as List<dynamic>)) {
            children.add(ChildModel.fromJson(element));
          }
          await localDataSource.cacheChildrenList(children);
          return right(children);
        } else {
          return left(ServerFailure.fromResponse(respons.statusCode, respons.data));
        }
      }
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioError(e));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  Future<bool> hasConnection() async {
    final results = await connectivity.checkConnectivity();
    final hasConnection =
        results.isNotEmpty && results.first != ConnectivityResult.none;

    return hasConnection;
  }
}
