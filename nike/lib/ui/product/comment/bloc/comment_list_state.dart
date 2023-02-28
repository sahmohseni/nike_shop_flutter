part of 'comment_list_bloc.dart';

@immutable
abstract class CommentListState extends Equatable {
  const CommentListState();

  @override
  List<Object> get props => [];
}

class CommentListLoading extends CommentListState {}

class CommentListSuccess extends CommentListState {
  final List<CommentEntity> comments;
  const CommentListSuccess({required this.comments});
  @override
  // TODO: implement props
  List<Object> get props => [comments];
}

class CommentListError extends CommentListState {
  final AppException exception;
  const CommentListError({required this.exception});

  @override
  // TODO: implement props
  List<Object> get props => [exception];
}
