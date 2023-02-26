part of 'home_bloc.dart';

@immutable
abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeLoading extends HomeState {}

class HomeSuccess extends HomeState {
  final List<ProductEntity> latestProduct;
  final List<ProductEntity> popularestProduct;
  final List<BannerEntity> banners;
  const HomeSuccess(
      {required this.latestProduct,
      required this.popularestProduct,
      required this.banners});
}

class HomeError extends HomeState {
  final String messgae;
  const HomeError({required this.messgae});
}
