import 'package:nike/data/model/banner/banner.dart';

import 'package:nike/di/locator.dart';
import 'package:nike/utils/http_client.dart';
import 'package:nike/utils/http_validator.dart';

abstract class IBannerDataSource {
  Future<List<BannerEntity>> getAllBanner();
}

class BannerDataSource with ResponseValidator implements IBannerDataSource {
  @override
  Future<List<BannerEntity>> getAllBanner() async {
    final getBannerResponse =
        await locator.get<HttpClient>().httpClient.get('banner/slider');
    responseValidator(getBannerResponse);
    final List<BannerEntity> bannerList = [];
    (getBannerResponse.data as List<dynamic>).forEach((element) {
      bannerList.add(BannerEntity.fromJson(element));
    });
    return bannerList;
  }
}
