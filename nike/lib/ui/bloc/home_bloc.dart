import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:nike/data/model/banner/banner.dart';
import 'package:nike/data/model/product/product.dart';
import 'package:nike/data/repo/banner_repository.dart';
import 'package:nike/data/repo/product_repository.dart';
import 'package:nike/di/locator.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeLoading()) {
    on<HomeEvent>((event, emit) async {
      if (event is HomeStart || event is HomeRefresh) {
        try {
          emit(HomeLoading());
          final List<ProductEntity> latestProduct =
              await locator.get<ProductRepository>().getAllProduct(3);
          final List<ProductEntity> popularestProduct =
              await locator.get<ProductRepository>().getAllProduct(1);
          final List<BannerEntity> banners =
              await locator.get<BannerRepository>().getAllBanner();
          emit(HomeSuccess(
              latestProduct: latestProduct,
              popularestProduct: popularestProduct,
              banners: banners));
        } catch (e) {
          emit(HomeError(messgae: 'عملیات موفقیت آمیز نبود'));
        }
      }
    });
  }
}
