import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:news_app/presentation/articles/bloc/articles_bloc.dart';
import 'package:news_app/presentation/articles/bloc/articles_state.dart';
import 'package:news_app/presentation/articles/item/item_article.dart';
import 'package:news_app/presentation/detail_article/page/detail_article_page.dart';
import 'package:news_app/utils/widget_component.dart';

import '../../../utils/colors_app.dart';

class ArticlesPage extends StatefulWidget {
  final String source;

  const ArticlesPage({super.key, required this.source});

  @override
  State<ArticlesPage> createState() => _ArticlesPageState();
}

class _ArticlesPageState extends State<ArticlesPage> {
  @override
  void initState() {
    super.initState();
    context.read<ArticlesCubit>().getArticlesBySource(widget.source);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ArticlesCubit, ArticleState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            backgroundColor: ColorsApp.whiteColor,
            appBar: PreferredSize(
                preferredSize: const Size.fromHeight(50),
                child: CustomAppBar(label: 'Articles: ${widget.source}')),
            body: Container(
                color: ColorsApp.whiteColor,
                child: state.articleStatusState == ArticleStatusState.loading
                    ? Center(child: CircularProgressIndicator())
                    : state.articles.isEmpty
                        ? Center(
                            child: Image.asset(
                              "assets/icon-not-found.png",
                              fit: BoxFit.contain,
                            ),
                          )
                        : listArticles(state)),
          );
        });
  }

  Widget listArticles(ArticleState articleState) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16.0),
      child: ListView.builder(
          shrinkWrap: true,
          physics: const AlwaysScrollableScrollPhysics(),
          itemCount: articleState.articles.length,
          itemBuilder: (context, index) {
            return ItemArticle(
                onTap: () {
                  Get.to(() => DetailArticle(urlArticle: articleState.articles[index].url.toString()));
                }, articleData: articleState.articles[index]);
          }),
    );
  }
}
