import 'package:get_it/get_it.dart';
import 'package:nike/data/repo/banner_repository.dart';
import 'package:nike/data/repo/comment_repository.dart';
import 'package:nike/data/repo/product_repository.dart';
import 'package:nike/data/source/banner_data_source.dart';
import 'package:nike/data/source/comment_data_source.dart';
import 'package:nike/data/source/product_data_Source.dart';
import 'package:nike/utils/http_client.dart';

final GetIt locator = GetIt.instance;

void locatorSetUp() {
  locator.registerSingleton<HttpClient>(HttpClient());
  locator.registerSingleton<ProductDataSource>(ProductDataSource());
  locator.registerSingleton<ProductRepository>(ProductRepository());
  locator.registerSingleton<BannerDataSource>(BannerDataSource());
  locator.registerSingleton<BannerRepository>(BannerRepository());
  locator.registerSingleton<CommentDataSource>(CommentDataSource());
  locator.registerSingleton<CommentRepository>(CommentRepository());
}
