import 'package:flutter/material.dart';
import 'package:news_app/utils/colors_app.dart';
import 'package:news_app/utils/widget_component.dart';
import 'package:webview_flutter/webview_flutter.dart';

class DetailArticle extends StatefulWidget {
  const DetailArticle({super.key, required this.urlArticle});

  final String urlArticle;

  @override
  State<DetailArticle> createState() => _DetailArticleState();
}

class _DetailArticleState extends State<DetailArticle> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: CustomAppBar(label: ''),
      ),
      body: Container(
        color: ColorsApp.whiteColor,
        child: WebViewWidget(
          controller: _controller(),
        ),
      ),
    );
  }

  WebViewController _controller() {
    return WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..loadRequest(Uri.parse(widget.urlArticle));
  }
}
