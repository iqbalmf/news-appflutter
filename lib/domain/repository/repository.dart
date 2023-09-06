import 'package:dartz/dartz.dart';
import 'package:news_app/data/models/source_model.dart';
import 'package:news_app/utils/failure.dart';

abstract class NewsRepository {
  Future<Either<Failure, List<SourceModel>>> getSourceNews(String category);
}