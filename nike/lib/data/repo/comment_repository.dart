import 'package:nike/data/model/comment/comment.dart';
import 'package:nike/data/source/comment_data_source.dart';
import 'package:nike/di/locator.dart';
import 'package:nike/utils/http_client.dart';
import 'package:nike/utils/http_validator.dart';

abstract class ICommentRepository {
  Future<List<CommentEntity>> getComment(int productId);
}

class CommentRepository implements ICommentRepository {
  @override
  Future<List<CommentEntity>> getComment(int productId) {
    return locator.get<CommentDataSource>().getComment(productId);
  }
}
