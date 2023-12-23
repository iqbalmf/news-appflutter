import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/domain/usecase/articles_usecase.dart';
import 'package:news_app/presentation/articles/bloc/articles_state.dart';

class ArticlesCubit extends Cubit<ArticleState> {
  final ArticlesUseCase _getArticlesUseCase;

  ArticlesCubit(this._getArticlesUseCase) : super(ArticleState());

  getArticlesBySource(String source) async {
    emit(state.copyWith(articleStatusState: ArticleStatusState.loading));
    try {
      if (source.isEmpty) {
        emit(state.copyWith(
            articleStatusState: ArticleStatusState.fail,
            message: 'Source Kosong'));
        return;
      } else {
        var result = await _getArticlesUseCase.getArticleNewsbySource(source);
        result.fold(
            (l) async => emit(
                state.copyWith(articleStatusState: ArticleStatusState.fail)),
            (r) => emit(state.copyWith(
                articleStatusState: ArticleStatusState.done, articles: r)));
      }
    } on Exception catch (e) {
      emit(state.copyWith(
          articleStatusState: ArticleStatusState.fail, message: e.toString()));
    }
  }
}
