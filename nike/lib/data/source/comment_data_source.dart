import 'package:nike/data/model/comment/comment.dart';
import 'package:nike/di/locator.dart';
import 'package:nike/utils/http_client.dart';
import 'package:nike/utils/http_validator.dart';

abstract class ICommentDataSource {
  Future<List<CommentEntity>> getComment(int productId);
}

class CommentDataSource with ResponseValidator implements ICommentDataSource {
  @override
  Future<List<CommentEntity>> getComment(int productId) async {
    final getCommentResponse = await locator
        .get<HttpClient>()
        .httpClient
        .get('comment/list?product_id=$productId');
    responseValidator(getCommentResponse);
    final List<CommentEntity> commentList = [];
    (getCommentResponse.data as List<dynamic>).forEach((element) {
      commentList.add(CommentEntity.fromJson(element));
    });
    return commentList;
  }
}
