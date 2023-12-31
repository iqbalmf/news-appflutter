import 'package:dartz/dartz.dart';
import 'package:dartz/dartz_streaming.dart';
import 'package:dio/dio.dart';
import 'package:news_app/data/models/source_model.dart';
import 'package:news_app/data/remote/news_remote_datasource.dart';
import 'package:news_app/domain/repository/repository.dart';
import 'package:news_app/utils/failure.dart';

import '../models/article_model.dart';

class NewsRepositoryImpl extends NewsRepository {
  final NewsRemoteDataSource _newsRemoteDataSource;

  NewsRepositoryImpl(this._newsRemoteDataSource);

  @override
  Future<Either<Failure, List<SourceModel>>> getSourceNews(
      String category) async {
    try {
      final result = await _newsRemoteDataSource.getSourcebyCategory(category);
      List<SourceModel> sourceNews = List<SourceModel>.from(
          result.data['sources'].map((json) => SourceModel.fromJson(json)));
      return Right(sourceNews);
    } on DioError catch (e) {
      return Left(ServerFailure(
          message: e.response?.statusMessage ?? '',
          httpStatus: e.response?.statusCode ?? 0));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<ArticleModel>>> getArticlesNewsbySource(
      String source) async {
    try {
      final result = await _newsRemoteDataSource.getArticlesbySource(source);
      List<ArticleModel> articleNews = List<ArticleModel>.from(
          result.data['articles'].map((json) => ArticleModel.fromJson(json)));
      return Right(articleNews);
    } on DioError catch (e) {
      return Left(ServerFailure(
          message: e.response?.statusMessage,
          httpStatus: e.response?.statusCode));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }
}
