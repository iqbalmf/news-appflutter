import 'package:flutter/material.dart';
import 'package:news_app/data/models/article_model.dart';
import 'package:news_app/utils/colors_app.dart';
import 'package:news_app/utils/date_time_utils.dart';

class ItemArticle extends StatefulWidget {
  const ItemArticle(
      {super.key, required this.onTap, required this.articleData});

  final Function() onTap;
  final ArticleModel articleData;

  @override
  State<ItemArticle> createState() => _ItemArticleState();
}

class _ItemArticleState extends State<ItemArticle> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(7)),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 0.1,
              blurRadius: 7,
            )
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 150.0,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(50.0))),
            child: widget.articleData.urlToImage != null
                ? Image.network(
                    widget.articleData.urlToImage.toString(),
                    fit: BoxFit.fitWidth,
                  )
                : Image.asset(
                    "assets/icon-not-found.png",
                    fit: BoxFit.contain,
                  ),
          ),
          Container(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.articleData.title ?? '-',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                  maxLines: 1,
                ),
                SizedBox(
                  height: 3,
                ),
                Text(
                  widget.articleData.description ?? '-',
                  style: TextStyle(fontSize: 12),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.5 - 16,
                  child: Text(
                    "Author: ${widget.articleData.author ?? '-'}",
                    style: TextStyle(
                        color: ColorsApp.greyColor2,
                        fontWeight: FontWeight.w400,
                        fontSize: 11),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.5 - 40,
                  child: Text(
                    "Published: ${DateTimeUtils().changeDateTime(widget.articleData.publishedAt ?? "")}",
                    style: TextStyle(
                        color: ColorsApp.greyColor2,
                        fontWeight: FontWeight.w400,
                        fontSize: 11),
                    textAlign: TextAlign.end,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
