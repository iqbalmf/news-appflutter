import 'package:equatable/equatable.dart';

import '../../../data/models/source_model.dart';

enum SourceStatusState {
  done,
  fail,
  loading,
  initial,
}

class SourceState extends Equatable {
  final String message;
  final SourceStatusState sourceStatusState;
  final List<SourceModel> sourcesNews;

  SourceState({
    this.message = '',
    this.sourceStatusState = SourceStatusState.initial,
    this.sourcesNews = const <SourceModel>[],
  });

  SourceState copyWith({
    String? message,
    SourceStatusState? sourceStatusState,
    List<SourceModel>? sourceModel,
  }) =>
      SourceState(
          message: message ?? this.message,
          sourceStatusState: sourceStatusState ?? this.sourceStatusState,
          sourcesNews: sourceModel ?? sourcesNews);

  @override
  List<Object?> get props => [message, sourceStatusState, sourcesNews];
}
