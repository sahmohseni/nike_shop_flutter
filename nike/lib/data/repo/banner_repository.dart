import 'package:nike/data/model/banner/banner.dart';
import 'package:nike/data/source/banner_data_source.dart';
import 'package:nike/di/locator.dart';

abstract class IBannerRepository {
  Future<List<BannerEntity>> getAllBanner();
}

class BannerRepository implements IBannerRepository {
  @override
  Future<List<BannerEntity>> getAllBanner() {
    return locator.get<BannerDataSource>().getAllBanner();
  }
}
