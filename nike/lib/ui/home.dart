import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nike/data/model/banner/banner.dart';
import 'package:nike/data/repo/banner_repository.dart';
import 'package:nike/di/locator.dart';
import 'package:nike/theme.dart';
import 'package:nike/ui/bloc/home_bloc.dart';
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
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    switch (index) {
                      case 0:
                        return const HomeLogo();
                      case 2:
                        return SizedBox(
                          height: 200,
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
                                        dotHeight: 4,
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
                        return Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      'جدیدترین ها',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    TextButton(
                                        onPressed: () {},
                                        child:
                                            const Text('مشاهده همه ی محصولات'))
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              SizedBox(
                                height: 200,
                                child: ListView.builder(
                                  physics: BouncingScrollPhysics(),
                                  padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                  scrollDirection: Axis.horizontal,
                                  itemCount: state.latestProduct.length,
                                  itemBuilder: (context, index) {
                                    return Column(
                                      children: [
                                        Container(
                                          padding:
                                              EdgeInsets.fromLTRB(8, 0, 8, 0),
                                          width: 200,
                                          height: 150,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(15)),
                                          child: ImageLoadingService(
                                              imageUrl: state
                                                  .latestProduct[index].image),
                                        ),
                                        const SizedBox(
                                          height: 4,
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              state.latestProduct[index].title,
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 10),
                                            ),
                                            const SizedBox(
                                              height: 2,
                                            ),
                                            Text(
                                              state.latestProduct[index]
                                                      .discount
                                                      .toString() +
                                                  " " +
                                                  "T",
                                              style: const TextStyle(
                                                  fontSize: 10,
                                                  decoration: TextDecoration
                                                      .lineThrough),
                                            ),
                                            Text(
                                              state.latestProduct[index].price
                                                      .toString() +
                                                  " " +
                                                  "T",
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              style: const TextStyle(
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.bold),
                                            )
                                          ],
                                        )
                                      ],
                                    );
                                  },
                                ),
                              )
                            ],
                          ),
                        );
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

class HomeLogo extends StatelessWidget {
  const HomeLogo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
      child: Image.asset(
        'assets/image/nike_logo.png',
        height: 32,
        alignment: Alignment.center,
      ),
    );
  }
}

class ImageLoadingService extends StatelessWidget {
  final String imageUrl;
  const ImageLoadingService({required this.imageUrl});
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(25),
        child: Container(
          height: 220,
          child: CachedNetworkImage(
            fit: BoxFit.cover,
            imageUrl: imageUrl,
            placeholder: (context, url) {
              return const Center(
                  child: SizedBox(
                height: 30,
                width: 30,
                child: CircularProgressIndicator(
                  color: LightTheme.primaryColor,
                ),
              ));
            },
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
        ),
      ),
    );
  }
}
