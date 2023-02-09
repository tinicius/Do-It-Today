enum ItemType {
 event, action 
}

enum ItemStatus {
  done, open
}

class Item {
  String name;
  String description;
  DateTime date;
  
  ItemStatus status = ItemStatus.open;
  ItemType? type;

  Item(this.name, this.description, this.date, [this.type]);
}