import 'package:doittoday/entities/item.dart';
import 'package:doittoday/services/item_local_storage.dart';

class ItemRepository {
  ItemService service = ItemLocalStorage();

  static const int COUNT = 5;

  Future<List<Event>> loadNextEvents() async {
    return await service.loadNextEvents(COUNT);
  }

  @override
  Future<List<Action>> loadAllActions() async {
    return await service.loadAllActions();
  }

  @override
  Future<List<Event>> loadAllEvents() async {
    return await service.loadAllEvents();
  }
}
