import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nike/data/repo/banner_repository.dart';
import 'package:nike/data/repo/product_repository.dart';
import 'package:nike/di/locator.dart';
import 'package:nike/ui/home.dart';

void main() {
  locatorSetUp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    locator.get<BannerRepository>().getAllBanner().then((value) {
      debugPrint(value.toString());
    }).catchError((e) {
      debugPrint(e.toString());
    });
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
