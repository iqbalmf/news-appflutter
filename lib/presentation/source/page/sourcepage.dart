import 'package:flutter/material.dart';

class SourcePage extends StatefulWidget {
  const SourcePage({Key? key, required this.category}) : super(key: key);
  final String category;

  @override
  State<SourcePage> createState() => _SourcePageState();
}

class _SourcePageState extends State<SourcePage> {
  @override
  Widget build(BuildContext context) {
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
                color: Colors.black, fontWeight: FontWeight.w700, fontSize: 20),
          ),
        ),
      ),
      body: Container(
        color: Colors.white,
      ),
    );
  }
}
