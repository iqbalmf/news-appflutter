import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/presentation/source/page/sourcepage.dart';
import 'package:news_app/utils/routers.dart';

class ItemCategory extends StatefulWidget {
  const ItemCategory({Key? key, required this.categoryName}) : super(key: key);
  final String categoryName;

  @override
  State<ItemCategory> createState() => _ItemCategoryState();
}

class _ItemCategoryState extends State<ItemCategory> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(SourcePage(category: widget.categoryName), transition: Transition.rightToLeft);
      },
      child: Container(
        padding: const EdgeInsets.all(16.0),
        margin: const EdgeInsets.symmetric(vertical: 8.0),
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(7)),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 0.1,
                blurRadius: 7,
                offset: const Offset(0, 1),
              )
            ]),
        child: Text(widget.categoryName.toUpperCase(), textAlign: TextAlign.center,),
      ),
    );
  }
}
