import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:news_app/presentation/category/page/CategoryPage.dart';

class RouterApp {
  static const String initial = '/';
  static const String categoryPage = '/category_page';
  static const String sourcePage = '/source_page';

  static List<GetPage> routers = [
    GetPage(name: initial, page: () => CategoryPage())
  ];
}
