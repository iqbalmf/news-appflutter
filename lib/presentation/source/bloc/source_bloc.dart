import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/domain/usecase/source_usecase.dart';
import 'package:news_app/presentation/source/bloc/source_state.dart';
import 'package:news_app/utils/failure.dart';

class SourceCubit extends Cubit<SourceState> {
  SourceCubit(this._getSourceUseCase)
      : super(SourceState());
  final SourceUsecase _getSourceUseCase;

  getSourceByCategory(String category) async {
    emit(state.copyWith(sourceStatusState: SourceStatusState.loading));

    try {
      if (category.isEmpty) {
        emit(state.copyWith(sourceStatusState: SourceStatusState.fail,
            message: 'Category Kosong'));
        return;
      } else {
        var result = await _getSourceUseCase.getSourceByCategory(category);
        result.fold((l) async {
          if(l is ServerFailure){
            emit(state.copyWith(sourceStatusState: SourceStatusState.fail));
          }
        }, (r) {
          emit(
            state.copyWith(
              sourceStatusState: SourceStatusState.done,
              sourceModel: r
            )
          );
        });
      }
    } on Exception catch (e) {
      emit(state.copyWith(
          sourceStatusState: SourceStatusState.fail, message: e.toString()));
    }
  }

}