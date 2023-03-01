import 'package:flutter/cupertino.dart';
import 'package:kiwi/kiwi.dart';
import 'package:nike/utils/http_client.dart';

KiwiContainer container = KiwiContainer();

void injector() {
  container.registerSingleton((c) => HttpClient());
}
