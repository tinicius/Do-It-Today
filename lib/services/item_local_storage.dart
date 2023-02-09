import 'dart:ffi';

import '../entities/item.dart';

abstract class ItemService {
  List<Item> loadNextEvents();
}

class ItemLocalStorage implements ItemService {
  @override
  List<Item> loadNextEvents() {
    return [
      Item("Festa", "description", DateTime.now()),
      Item("Reunião", "description", DateTime.now()),
      Item("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", "description", DateTime.now()),
    ];
  }
}