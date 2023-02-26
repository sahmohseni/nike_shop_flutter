import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nike/data/repo/banner_repository.dart';
import 'package:nike/di/locator.dart';
import 'package:nike/theme.dart';
import 'package:nike/ui/home.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: LightTheme.primaryColor));
  SystemUiOverlayStyle(statusBarColor: LightTheme.primaryColor);
  locatorSetUp();
  runApp(
    const MyApp(),
  );
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
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home:
          Directionality(textDirection: TextDirection.rtl, child: HomeScreen()),
    );
  }
}
