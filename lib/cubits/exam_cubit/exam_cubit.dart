import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tawasel/Models/exam_models/exam_model.dart';
import 'package:tawasel/Services/exam_services/exam_service.dart';

part 'exam_state.dart';

class ExamCubit extends Cubit<ExamState> {
  ExamCubit() : super(ExamInitial());

  Future<void> getexam({required int categoryId}) async {
    emit(ExamLoading());

    try {
      final questions = await ExamsService().getexamByCategory(
        categoryId: categoryId,
      );

      emit(ExamSuccess(questions));
    } catch (e) {
      emit(
        ExamError(e.toString()),
      );
    }
  }
}
