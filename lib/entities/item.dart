class Item {
  String name;
  String description;

  Item(this.name, this.description);
}

enum EventStatus { late, closed, open }

class Event extends Item {
  Event(super.name, super.description, this.date,
      [this.status = EventStatus.closed]) {
    if (date.isBefore(DateTime.now())) {
      status = EventStatus.open;
    } else {
      status = EventStatus.closed;
    }
  }

  DateTime date;
  EventStatus status;
}

enum ActionStatus { done, open }

class Action extends Item {
  Action(super.name, super.description, [this.status = ActionStatus.open]);
  ActionStatus status;
}
