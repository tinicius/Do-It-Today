import 'package:doittoday/entities/item.dart';
import 'package:doittoday/services/item_local_storage.dart';

class ItemRepository {

  ItemService service = ItemLocalStorage();

  List<Item> loadNextEvents() {
    return service.loadNextEvents();
  }

}

