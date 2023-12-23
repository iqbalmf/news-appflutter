import 'package:dartz/dartz.dart';
import 'package:news_app/data/models/article_model.dart';
import 'package:news_app/domain/repository/repository.dart';
import 'package:news_app/utils/failure.dart';

class ArticlesUseCase {
  final NewsRepository _repository;

  ArticlesUseCase(this._repository);

  Future<Either<Failure, List<ArticleModel>>> getArticleNewsbySource(String source) async {
    return _repository.getArticlesNewsbySource(source);
  }

}