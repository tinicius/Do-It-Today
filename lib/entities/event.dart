enum EventStatus { late, closed, open }

class Event {
  Event(this.name, this.description, this.date,
      [this.status = EventStatus.closed]) {
    if (date.isBefore(DateTime.now())) {
      status = EventStatus.open;
    } else {
      status = EventStatus.closed;
    }
  }

  static String statusToStringMessage(EventStatus status) {
    if (status == EventStatus.open) return "Aberto";
    if (status == EventStatus.closed) return "Fechado";
    if (status == EventStatus.late) return "Atrasado";

    return "";
  }

  Event.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        description = json['description'],
        date = DateTime.fromMillisecondsSinceEpoch(json['date']),
        status = EventStatus.open;

  Map<String, dynamic> toJson() => {
        'name': name,
        'description': description,
        'date': date.millisecondsSinceEpoch,
        'status': EventStatus.open
      };

  String name;
  String description;
  DateTime date;
  EventStatus status;
}
