import 'package:dartz/dartz.dart';
import 'package:news_app/data/models/source_model.dart';
import 'package:news_app/domain/repository/repository.dart';
import 'package:news_app/utils/failure.dart';

class SourceUsecase {
  final NewsRepository _repository;

  SourceUsecase(this._repository);


  Future<Either<Failure, List<SourceModel>>> getSourceByCategory(String category) async {
    return _repository.getSourceNews(category);
  }
}