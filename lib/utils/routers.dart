import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:news_app/presentation/category/page/categorypage.dart';
import 'package:news_app/presentation/source/page/sourcepage.dart';

class RouterApp {
  static const String initial = '/';
  static const String categoryPage = '/category_page';
  static const String sourcePage = '/source_page';


  static List<GetPage> routers = [
    GetPage(name: initial, page: () => CategoryPage()),
    GetPage(name: sourcePage, page: () => SourcePage(
      category: Get.arguments['category'],
    ))
  ];
}
