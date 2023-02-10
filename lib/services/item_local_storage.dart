import 'dart:ffi';

import '../entities/item.dart';

abstract class ItemService {
  List<Event> loadNextEvents();
}

class ItemLocalStorage implements ItemService {
  @override
  List<Event> loadNextEvents() {
    return [
      Event("Festa", "description", DateTime(2023, 2, 10, 8, 0)),
      Event("Reunião", "description", DateTime.now()),
      Event("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", "description", DateTime.now()),
    ];
  }
}