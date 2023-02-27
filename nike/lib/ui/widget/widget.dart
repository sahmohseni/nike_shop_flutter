import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nike/data/model/product/product.dart';
import 'package:nike/theme.dart';
import 'package:nike/ui/home.dart';

class PopularestProducts extends StatelessWidget {
  final String title;
  final String buttonTitle;
  final List<ProductEntity> popularestProduct;
  final GestureTapCallback onTap;
  const PopularestProducts({
    required this.title,
    required this.buttonTitle,
    required this.popularestProduct,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                TextButton(onPressed: onTap, child: Text(buttonTitle))
              ],
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          SizedBox(
            height: 260,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
              scrollDirection: Axis.horizontal,
              itemCount: popularestProduct.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                      width: 220,
                      height: 190,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15)),
                      child: ImageLoadingService(
                          imageUrl: popularestProduct[index].image),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          popularestProduct[index].title,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 13),
                        ),
                        const SizedBox(
                          height: 2,
                        ),
                        Text(
                          popularestProduct[index].discount.toString() +
                              " " +
                              "T",
                          style: const TextStyle(
                              fontSize: 11,
                              decoration: TextDecoration.lineThrough),
                        ),
                        Text(
                          popularestProduct[index].price.toString() + " " + "T",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              fontSize: 13, fontWeight: FontWeight.bold),
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
  }
}

class LatestProducts extends StatelessWidget {
  final String title;
  final String buttonTitle;
  final List<ProductEntity> latestProduct;
  final GestureTapCallback onTap;
  const LatestProducts({
    required this.title,
    required this.buttonTitle,
    required this.latestProduct,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'جدیدترین ها',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                TextButton(onPressed: onTap, child: Text(buttonTitle))
              ],
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          SizedBox(
            height: 250,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
              scrollDirection: Axis.horizontal,
              itemCount: latestProduct.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                      width: 220,
                      height: 190,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15)),
                      child: ImageLoadingService(
                          imageUrl: latestProduct[index].image),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          latestProduct[index].title,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 13),
                        ),
                        const SizedBox(
                          height: 2,
                        ),
                        Text(
                          latestProduct[index].discount.toString() + " " + "T",
                          style: const TextStyle(
                              fontSize: 12,
                              decoration: TextDecoration.lineThrough),
                        ),
                        Text(
                          latestProduct[index].price.toString() + " " + "T",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              fontSize: 13, fontWeight: FontWeight.bold),
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
