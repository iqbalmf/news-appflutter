import 'package:equatable/equatable.dart';

import '../../../data/models/article_model.dart';

enum ArticleStatusState {
  done,
  fail,
  loading,
  initial,
}

class ArticleState extends Equatable {
  late String? message;
  late ArticleStatusState? articleStatusState;
  late List<ArticleModel>? articles;

  ArticleState({this.message, this.articleStatusState, this.articles});

  ArticleState copyWith(
          {String? message,
          ArticleStatusState? articleStatusState,
          List<ArticleModel>? articles}) =>
      ArticleState(
          message: message ?? this.message,
          articleStatusState: articleStatusState ?? this.articleStatusState,
          articles: articles ?? this.articles);

  @override
  List<Object?> get props => [message, articleStatusState, articles];
}
