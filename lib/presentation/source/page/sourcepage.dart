import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/presentation/source/bloc/source_bloc.dart';
import 'package:news_app/presentation/source/item/item_source.dart';

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
          backgroundColor: Colors.white,
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(50),
            child: AppBar(
              backgroundColor: Colors.amber,
              elevation: 2,
              centerTitle: false,
              title: Text(
                'Category: ${widget.category.toUpperCase()}',
                style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    fontSize: 20),
              ),
            ),
          ),
          body: Container(
            color: Colors.white,
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
                sourceModel: sourceState.sourcesNews[index], onTap: () {});
          }),
    );
  }
}
