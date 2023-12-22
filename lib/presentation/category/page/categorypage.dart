import 'package:flutter/material.dart';
import 'package:news_app/presentation/category/item/itemcategory.dart';
import 'package:news_app/utils/colors_app.dart';
import 'package:news_app/utils/constant.dart';
import 'package:news_app/utils/widget_component.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsApp.whiteColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: CustomAppBar()
      ),
      body: Container(
        child: categories(),
      ),
    );
  }

  Widget categories() {
    return Container(
      margin: const EdgeInsets.all(16.0),
      width: MediaQuery.of(context).size.width - 2 * 16,
      height: MediaQuery.of(context).size.height,
      child: ListView.builder(
        itemBuilder: (context, index) {
          return ItemCategory(categoryName: listCategory[index]);
        },
        itemCount: listCategory.length,
        shrinkWrap: true,
        physics: const ScrollPhysics(),
      ),
    );
  }
}
