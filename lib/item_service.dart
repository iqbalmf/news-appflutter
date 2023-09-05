import 'package:flutter/widgets.dart';
import 'package:realm/realm.dart';
import '../schemas/item.dart';

class ItemService {
  var config = Configuration.local([Item.schema]);
  late Realm _realm;

  ItemService() {
    openRealm();
  }

  openRealm() {
    _realm = Realm(config);
  }

  closeRealm() {
    if (!_realm.isClosed) {
      _realm.close();
    }
  }

  RealmResults<Item> getItems() {
    return _realm.all();
  }

  bool addItem(String text) {
    try {
      _realm.write(() => _realm.add(Item((text), false)));
      return true;
    } on RealmException catch (e) {
      debugPrint(e.message);
      return false;
    }
  }

  bool toggleItemStatus(Item item) {
    try {
      _realm.write(() => item.done = !item.done);
      return true;
    } on RealmException catch (e) {
      debugPrint(e.message);
      return false;
    }
  }

  bool deleteItem(Item item) {
    try {
      _realm.write(() {
        _realm.delete(item);
      });
      return true;
    } on RealmException catch (e) {
      debugPrint(e.message);
      return false;
    }
  }
}
