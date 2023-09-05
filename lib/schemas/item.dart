import 'package:realm/realm.dart';
part 'item.g.dart';

@RealmModel()
class _Item {
  late String text;
  late bool done;
}