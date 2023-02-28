import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nike/data/model/banner/banner.dart';
import 'package:nike/data/model/product/product.dart';
import 'package:nike/data/repo/banner_repository.dart';
import 'package:nike/di/locator.dart';
import 'package:nike/theme.dart';
import 'package:nike/ui/bloc/home_bloc.dart';
import 'package:nike/ui/product/product_details.dart';
import 'package:nike/ui/widget/widget.dart';
import 'package:nike/utils/exception.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

final PageController pageViewController = PageController();

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final homeBloc = HomeBloc();
        homeBloc.add(HomeStart());
        return homeBloc;
      },
      child: Scaffold(
        body: SafeArea(
          child: BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              if (state is HomeSuccess) {
                return ListView.builder(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 100),
                  physics: const BouncingScrollPhysics(),
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    switch (index) {
                      case 0:
                        return const HomeLogo();
                      case 2:
                        return SizedBox(
                          height: 250,
                          child: Stack(children: [
                            PageView.builder(
                              physics: const BouncingScrollPhysics(),
                              controller: pageViewController,
                              itemCount: state.banners.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(8, 12, 8, 8),
                                  child: ImageLoadingService(
                                      imageUrl: state.banners[index].image),
                                );
                              },
                            ),
                            Positioned(
                                left: 0,
                                right: 0,
                                bottom: 12,
                                child: Center(
                                  child: SmoothPageIndicator(
                                    controller: pageViewController,
                                    count: state.banners.length,
                                    axisDirection: Axis.horizontal,
                                    effect: const WormEffect(
                                        spacing: 8.0,
                                        radius: 4.0,
                                        dotWidth: 18,
                                        dotHeight: 2,
                                        paintStyle: PaintingStyle.fill,
                                        strokeWidth: 1,
                                        dotColor: Colors.grey,
                                        activeDotColor:
                                            LightTheme.primaryColor),
                                  ),
                                ))
                          ]),
                        );
                      case 3:
                        return _HorizontalProductsList(
                            title: 'جدیدترین ها',
                            buttonTitle: 'مشاهده همه',
                            onTap: () {},
                            products: state.latestProduct);
                      case 4:
                        return _HorizontalProductsList(
                            title: 'محبوب ترین ها',
                            buttonTitle: 'مشاهده ی همه',
                            onTap: () {},
                            products: state.popularestProduct);
                      default:
                        return Container();
                    }
                  },
                );
              } else if (state is HomeLoading) {
                return const Center(
                    child: CircularProgressIndicator(
                  color: LightTheme.primaryColor,
                ));
              } else if (state is HomeError) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        'لطفا دوباره تلاش کنید',
                        style: TextStyle(fontSize: 20),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      SizedBox(
                          height: 25,
                          width: 125,
                          child: ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.blueGrey),
                                  elevation: MaterialStateProperty.all(0),
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(15)))),
                              onPressed: () {
                                BlocProvider.of<HomeBloc>(context)
                                    .add(HomeStart());
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Text(
                                    'تلاش دوباره',
                                    style: TextStyle(fontSize: 14),
                                  ),
                                  SizedBox(
                                    width: 6,
                                  ),
                                  Icon(
                                    CupertinoIcons.refresh,
                                    size: 16,
                                  )
                                ],
                              )))
                    ],
                  ),
                );
              } else {
                throw AppException(errorMessage: 'خطا');
              }
            },
          ),
        ),
      ),
    );
  }
}

class _HorizontalProductsList extends StatelessWidget {
  final String title;
  final String buttonTitle;
  final List<ProductEntity> products;
  final GestureTapCallback onTap;
  _HorizontalProductsList(
      {required this.title,
      required this.buttonTitle,
      required this.onTap,
      required this.products});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              TextButton(
                  onPressed: () {},
                  child: Text(
                    buttonTitle,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ))
            ],
          ),
        ),
        SizedBox(
          height: 340,
          child: ListView.builder(
            itemCount: products.length,
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              final product = products[index];
              return ProductItem(product: product);
            },
          ),
        )
      ],
    );
  }
}

class ProductItem extends StatelessWidget {
  const ProductItem({
    Key? key,
    required this.product,
  }) : super(key: key);

  final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 260,
      width: 210,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => ProductDetailsScreen(product: product),
              ));
            },
            child: Container(
              padding: EdgeInsets.fromLTRB(0, 0, 16, 0),
              height: 260,
              width: 210,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(15)),
              child: ImageLoadingService(imageUrl: product.image),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 6, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.title,
                    maxLines: 1,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  ),
                  Text(
                    product.price.toString() + " " + "Toman",
                    style: TextStyle(
                        decoration: TextDecoration.lineThrough,
                        fontWeight: FontWeight.w500,
                        fontSize: 12),
                  ),
                  Text(
                    product.discount.toString() + " " + "Toman",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
