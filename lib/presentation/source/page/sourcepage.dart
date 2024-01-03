import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:news_app/presentation/articles/page/articles_page.dart';
import 'package:news_app/presentation/source/bloc/source_bloc.dart';
import 'package:news_app/presentation/source/item/item_source.dart';
import 'package:news_app/utils/colors_app.dart';
import 'package:news_app/utils/widget_component.dart';

import '../bloc/source_state.dart';

class SourcePage extends StatefulWidget {
  const SourcePage({Key? key, required this.category}) : super(key: key);
  final String category;

  @override
  State<SourcePage> createState() => _SourcePageState();
}

class _SourcePageState extends State<SourcePage> {
  @override
  void initState() {
    super.initState();
    getSource(widget.category);
  }

  getSource(String category) =>
      context.read<SourceCubit>().getSourceByCategory(category);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SourceCubit, SourceState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          backgroundColor: ColorsApp.whiteColor,
          appBar: PreferredSize(
              preferredSize: const Size.fromHeight(50),
              child: CustomAppBar(
                  label: 'Category: ${widget.category.toUpperCase()}')),
          body: Container(
            color: ColorsApp.whiteColor,
            child: state.sourceStatusState == SourceStatusState.loading
                ? Center(child: CircularProgressIndicator())
                : listSourceNews(state),
          ),
        );
      },
    );
  }

  Widget listSourceNews(SourceState sourceState) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16.0),
      child: ListView.builder(
          shrinkWrap: true,
          physics: const AlwaysScrollableScrollPhysics(),
          itemCount: sourceState.sourcesNews.length,
          itemBuilder: (context, index) {
            return ItemSource(
                sourceModel: sourceState.sourcesNews[index],
                onTap: () {
                  Get.to(() => ArticlesPage(
                    source: sourceState.sourcesNews[index].id ?? '',
                  ));
                });
          }),
    );
  }
}
