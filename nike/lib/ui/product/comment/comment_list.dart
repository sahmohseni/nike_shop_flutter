import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nike/data/model/comment/comment.dart';
import 'package:nike/theme.dart';
import 'package:nike/ui/product/comment/bloc/comment_list_bloc.dart';
import 'package:nike/utils/exception.dart';

class CommentList extends StatelessWidget {
  final int productId;
  CommentList({required this.productId});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final commentListBloc = CommentListBloc(productId: productId);
        commentListBloc.add(CommentListStarted());
        return commentListBloc;
      },
      child: BlocBuilder<CommentListBloc, CommentListState>(
        builder: (context, state) {
          if (state is CommentListSuccess) {
            return SliverList(
                delegate: SliverChildBuilderDelegate((context, index) {
              return CommentItem(
                data: state.comments[index],
              );
            }, childCount: state.comments.length));
          } else if (state is CommentListLoading) {
            return SliverToBoxAdapter(
                child: Center(
              child: CircularProgressIndicator(
                color: LightTheme.primaryColor,
              ),
            ));
          } else if (state is CommentListError) {
            return SliverToBoxAdapter(
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('مجدد تلاش کنید'),
                    const SizedBox(
                      height: 8,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          BlocProvider.of<CommentListBloc>(context)
                              .add(CommentListStarted());
                        },
                        child: Row(
                          children: const [
                            Text('تلاش دوباره'),
                            SizedBox(
                              width: 4,
                            ),
                            Icon(CupertinoIcons.refresh)
                          ],
                        ))
                  ],
                ),
              ),
            );
          } else {
            throw AppException(errorMessage: 'خطا');
          }
        },
      ),
    );
  }
}

class CommentItem extends StatelessWidget {
  final CommentEntity data;
  const CommentItem({required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.fromLTRB(8, 0, 2, 8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    data.title,
                    style: TextStyle(fontSize: 16),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Text(
                    data.author,
                    style: TextStyle(color: Colors.grey.shade700),
                  )
                ],
              ),
              Container(
                  decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(15)),
                  child: Text("  " + data.date + "  "))
            ],
          ),
          const SizedBox(
            height: 12,
          ),
          Text(
            data.content,
            style: TextStyle(fontFamily: 'dana', fontWeight: FontWeight.bold),
          ),
          Divider(
            endIndent: 10,
            indent: 10,
            thickness: 2,
          )
        ],
      ),
    );
  }
}
