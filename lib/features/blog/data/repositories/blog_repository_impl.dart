import 'package:baby_care/core/errors/failures.dart';
import 'package:baby_care/features/blog/data/datasources/blog_local_data_source.dart';
import 'package:baby_care/features/blog/data/datasources/blog_remote_data_source.dart';
import 'package:baby_care/features/blog/data/model/article_model.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'blog_repository.dart';

class BlogRepositoryImpl implements BlogRepository {
  final BlogRemoteDataSource remoteDataSource;
  final BlogLocalDataSource localDataSource;
  final Connectivity connectivity;
  BlogRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.connectivity,
  });

  @override
  Future<Either<Failure, List<ArticleModel>>> fetchBlogArticles() async {
    try {
      if (await hasConnection()) {
        final respons = await remoteDataSource.fetchBlogArticles();
        if (respons.statusCode == 200) {
          final data = respons.data['data'] ?? respons.data;
          final remoteArticles = (data as List)
              .map((e) => ArticleModel.fromJson(e))
              .toList();
          localDataSource.cacheBlogArticles(remoteArticles);
          return right(remoteArticles);
        } else {
          return left(ServerFailure.fromResponse(respons.statusCode, respons.data));
        }
        // localDataSource.cacheBlogArticles(remoteArticles);
        // return right(remoteArticles);
      } else {
        final localArticles = await localDataSource.getCachedBlogArticles();
        return right(localArticles as List<ArticleModel>);
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

  @override
  Future<Either<Failure, List<ArticleModel>>> fetchBlogArticlesHome() async {
    try {
      if (await hasConnection()) {
        final respons = await remoteDataSource.fetchBlogArticlesHome();
        if (respons.statusCode == 200) {
          final data = respons.data['data'] ?? respons.data;
          final remoteArticles = (data as List)
              .map((e) => ArticleModel.fromJson(e))
              .toList();
          return right(remoteArticles);
        } else {
          return left(ServerFailure.fromResponse(respons.statusCode, respons.data));
        }
      } else {
        final localArticles = await localDataSource.getCachedBlogArticles();
        return right(localArticles as List<ArticleModel>);
      }
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioError(e));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
