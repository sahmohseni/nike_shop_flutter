import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kiwi/kiwi.dart';
import 'package:nike/data/repo/banner_repository.dart';
import 'package:nike/data/repo/comment_repository.dart';
import 'package:nike/di/locator.dart';
import 'package:nike/theme.dart';
import 'package:nike/ui/auth/auth.dart';
import 'package:nike/ui/home.dart';
import 'package:nike/ui/root.dart';

import 'package:nike/utils/http_client.dart';

void main() {
  KiwiContainer container = KiwiContainer();
  container.registerSingleton<HttpClient>((c) => HttpClient());
  HttpClient theHttp = container.resolve<HttpClient>();
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: LightTheme.primaryColor));
  const SystemUiOverlayStyle(statusBarColor: LightTheme.primaryColor);
  locatorSetUp();
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    locator.get<CommentRepository>().getComment(7).then(
      (value) {
        debugPrint(value.toString());
      },
    ).catchError((e) {
      debugPrint(e.toString());
    });
    return MaterialApp(
      theme: ThemeData(
          textTheme: TextTheme(
              caption: TextStyle(fontFamily: 'dana'),
              headline6: TextStyle(fontFamily: 'dana'),
              bodyText1: TextStyle(fontFamily: 'dana'),
              bodyText2: TextStyle(fontFamily: 'dana'))),
      debugShowCheckedModeBanner: false,
      home:
          Directionality(textDirection: TextDirection.rtl, child: AuthScreen()),
    );
  }
}
