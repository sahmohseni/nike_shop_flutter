import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nike/data/model/product/product.dart';
import 'package:nike/theme.dart';
import 'package:nike/ui/product/comment/comment_list.dart';
import 'package:nike/ui/widget/widget.dart';

class ProductDetailsScreen extends StatelessWidget {
  final ProductEntity product;
  const ProductDetailsScreen({required this.product});
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton.extended(
            elevation: 0,
            backgroundColor: Color.fromARGB(255, 47, 46, 46),
            onPressed: () {},
            label: const Text(
              'افزودن به سبد خرید',
              style: TextStyle(fontFamily: 'dana', color: Colors.white),
            )),
        body: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverAppBar(
                actions: [
                  IconButton(
                      onPressed: () {}, icon: const Icon(CupertinoIcons.star))
                ],
                foregroundColor: LightTheme.primaryColor,
                backgroundColor: Colors.white,
                expandedHeight: MediaQuery.of(context).size.width * 0.8 - 50,
                flexibleSpace: ImageLoadingService(imageUrl: product.image)),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 16,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 280,
                          child: Text(
                            product.title,
                            maxLines: 2,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                        ),
                        Column(
                          children: [
                            Text(
                              product.discount.toString() + "Toman",
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey,
                                  decoration: TextDecoration.lineThrough),
                            ),
                            Text(
                              product.price.toString() + "Toman",
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            )
                          ],
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    const Text(
                      'این کف ورزشی برای ورزش و پیاده روی های طولانی مدت طراحی شده است با استفاده از این کفش با پیاده روی های طولانی مدت و ورزش های سنگین آسیبی به ستون فقرات و کمر شما وارد نمیشود',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'نظرات کاربران',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: LightTheme.secondaryTextColor),
                        ),
                        TextButton(
                            onPressed: () {},
                            child: const Text(
                              'ثبت نظر',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ))
                      ],
                    )
                  ],
                ),
              ),
            ),
            CommentList(productId: product.id)
          ],
        ),
      ),
    );
  }
}
