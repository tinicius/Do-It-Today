import 'package:doittoday/entities/action.dart';
import 'package:doittoday/services/item_local_storage.dart';

import '../entities/event.dart';

class ItemRepository {
  ItemService service = ItemLocalStorage();

  static const int COUNT = 5;

  Future<List<Event>> loadNextEvents() async {
    List<Event> events = await service.loadNextEvents(COUNT);
    return events;
  }

  @override
  Future<List<Action>> loadAllActions() async {
    return await service.loadAllActions();
  }

  @override
  Future<List<Event>> loadAllEvents() async {
    List<Event> events = await service.loadAllEvents();
    return events;
  }

  @override
  Future<void> addEvent(Event event) async {
    await service.addEvent(event);
  }
}
