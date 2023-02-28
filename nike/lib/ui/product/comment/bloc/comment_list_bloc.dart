import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:nike/data/model/comment/comment.dart';
import 'package:nike/data/repo/comment_repository.dart';
import 'package:nike/di/locator.dart';
import 'package:nike/utils/exception.dart';

part 'comment_list_event.dart';
part 'comment_list_state.dart';

class CommentListBloc extends Bloc<CommentListEvent, CommentListState> {
  final int productId;
  CommentListBloc({required this.productId}) : super(CommentListLoading()) {
    on<CommentListEvent>((event, emit) async {
      if (event is CommentListStarted) {
        emit(CommentListLoading());
        try {
          final List<CommentEntity> comments =
              await locator.get<CommentRepository>().getComment(productId);
          emit(CommentListSuccess(comments: comments));
        } catch (e) {
          emit(CommentListError(
              exception:
                  AppException(errorMessage: 'عملیات موفقیت آمیز نبود')));
        }
      }
    });
  }
}
