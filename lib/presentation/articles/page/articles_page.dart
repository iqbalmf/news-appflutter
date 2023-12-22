import 'package:flutter/material.dart';
import 'package:news_app/utils/widget_component.dart';

import '../../../utils/colors_app.dart';

class ArticlesPage extends StatefulWidget {
  const ArticlesPage({super.key});

  @override
  State<ArticlesPage> createState() => _ArticlesPageState();
}

class _ArticlesPageState extends State<ArticlesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsApp.whiteColor,
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: CustomAppBar(label: 'Articles: ')
      ),
      body: Container(
        color: ColorsApp.whiteColor,
        child: Center(child: Text("Articles"))
      ),
    );
  }
}
