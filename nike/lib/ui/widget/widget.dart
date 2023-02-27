import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nike/data/model/product/product.dart';
import 'package:nike/theme.dart';
import 'package:nike/ui/home.dart';

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
