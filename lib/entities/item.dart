enum ItemType {
  open, waiting, doc, maybe, event
}

class Item {
  String name;
  String description;
  DateTime date;
  bool done = false;
  
  ItemType type = ItemType.open;

  Item(this.name, this.description, this.date);
}