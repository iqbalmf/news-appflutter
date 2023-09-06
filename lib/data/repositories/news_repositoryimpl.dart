import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:news_app/data/models/source_model.dart';
import 'package:news_app/data/remote/news_remote_datasource.dart';
import 'package:news_app/domain/repository/repository.dart';
import 'package:news_app/utils/failure.dart';

class NewsRepositoryImpl extends NewsRepository {
  final NewsRemoteDataSource _newsRemoteDataSource;

  NewsRepositoryImpl(this._newsRemoteDataSource);

  @override
  Future<Either<Failure, List<SourceModel>>> getSourceNews(String category) async {
    try {
      final result = await _newsRemoteDataSource.getSourcebyCategory(category);
      return Right(result);
    } on DioError catch (e) {
      return Left(ServerFailure(
          message: e.response?.statusMessage ?? '',
          httpStatus: e.response?.statusCode ?? 0));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }
}