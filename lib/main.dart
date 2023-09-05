import 'package:flutter/material.dart';
import 'package:news_app/components/shopping_list_view.dart';
import 'package:news_app/item_service.dart';
import 'package:news_app/schemas/item.dart';
import 'package:realm/realm.dart';

void main() {
  final ItemService service = ItemService();
  runApp(MyApp(
    service: service,
  ));
}

class MyApp extends StatelessWidget {
  final ItemService service;

  const MyApp({Key? key, required this.service}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shooping List',
      theme: ThemeData(primarySwatch: Colors.indigo),
      home: MyHomePage(
        title: 'Shopping List',
        service: service,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title, required this.service});

  final String title;
  final ItemService service;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late RealmResults<Item> items;

  onAdd(String text) {
    debugPrint('Adding $text');
    if (widget.service.addItem(text)) {
      debugPrint('Added $text');
      loadItems();
    } else {
      debugPrint('Something went wrong while adding $text');
    }
  }

  onToggle(Item item) {
    debugPrint('Toggling status for ${item.text}');
    if (widget.service.toggleItemStatus(item)) {
      loadItems();
    } else {
      debugPrint('Something went wrong while toggling status for ${item.text}');
    }
  }

  onDelete(Item item) {
    debugPrint('Deleting ${item.text}');
    if (widget.service.deleteItem(item)) {
      loadItems();
    } else {
      debugPrint('Something went wrong while deleting ${item.text}');
    }
  }

  @override
  void initState() {
    super.initState();
    loadItems();
  }

  void loadItems() {
    setState(() {
      items = widget.service.getItems();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title, style: const TextStyle(color: Colors.white)),
      ),
      body: ShoppingListView(
        items: items.toList(),
        onAdd: onAdd,
        onToggle: onToggle,
        onDelete: onDelete,
      ),
    );
  }
}
