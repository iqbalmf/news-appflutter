import 'package:flutter/material.dart';
import 'package:news_app/data/models/source_model.dart';

class ItemSource extends StatefulWidget {
  const ItemSource({Key? key, required this.sourceModel, required this.onTap})
      : super(key: key);
  final SourceModel sourceModel;
  final Function() onTap;

  @override
  State<ItemSource> createState() => _ItemSourceState();
}

class _ItemSourceState extends State<ItemSource> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(onTap: widget.onTap,
        child: Container(
          padding: const EdgeInsets.all(16),
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
              Text(
                widget.sourceModel.name ?? '-',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                maxLines: 1,
              ),
              SizedBox(height: 3,),
              Text(
                widget.sourceModel.description ?? '-',
                style: TextStyle(fontSize: 12),
                maxLines: 2,
              ),
            ],
          ),
        ));
  }
}
