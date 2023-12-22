import 'package:flutter/material.dart';
import 'package:news_app/app.dart';
import 'package:news_app/config/app_config.dart';
import 'package:news_app/item_service.dart';
import 'package:news_app/presentation/example_realm/myapp.dart';
import 'inject.dart' as di;

void main() {
  final ItemService service = ItemService();
  // runApp(MyApp(
  //   service: service,
  // ));
  ConstantsApp.setEnvironment(EnvirontmentApp.Dev);
  di.init();
  runApp(NewsApp());
}
