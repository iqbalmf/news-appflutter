import 'package:flutter/material.dart';
import 'package:news_app/app.dart';
import 'package:news_app/item_service.dart';
import 'package:news_app/presentation/example_realm/myapp.dart';

void main() {
  final ItemService service = ItemService();
  // runApp(MyApp(
  //   service: service,
  // ));
  runApp(const NewsApp());
}
