class Item {
  String name;
  String description;

  Item(this.name, this.description);
}

enum EventStatus { late, closed, open }

class Event extends Item {
  Event(super.name, super.description, this.date, [this.status = EventStatus.closed]) {
    if (date.isBefore(DateTime.now())) {
      status = EventStatus.open;
    } else {
      status = EventStatus.closed;
    }
    
  }

  DateTime date;
  EventStatus status;
}

class Action {}
