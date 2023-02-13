import '../entities/item.dart';

abstract class ItemService {
  Future<List<Event>> loadNextEvents(int count);
  Future<List<Event>> loadAllEvents();
  Future<void> addEvent(Event event);

  Future<List<Action>> loadAllActions();
}

class ItemLocalStorage implements ItemService {
  List<Event> allEvents = [
    Event("Festa", "description", DateTime(2023, 2, 10, 8, 0)),
    Event("Reunião", "description", DateTime.now()),
    Event("a", "description", DateTime.now()),
  ];

  List<Action> allActions = [
    Action("Ação 1", "Descrição"),
    Action("Ação 1", "Descrição"),
    Action("Ação 1", "Descrição"),
    Action("Ação 1", "Descrição"),
    Action("Ação 1", "Descrição"),
    Action("Ação 1", "Descrição"),
  ];

  @override
  Future<List<Event>> loadNextEvents(int count) async {
    List<Event> nextEvents = [];

    if (count > allEvents.length) {
      count = allEvents.length;
    }

    for (var i = 0; i < count; i++) {
      nextEvents.add(allEvents[i]);
      await Future.delayed(const Duration(seconds: 1));
    }

    return nextEvents;
  }

  @override
  Future<List<Action>> loadAllActions() async {
    await Future.delayed(Duration(seconds: 1 * allActions.length));
    return allActions;
  }

  @override
  Future<void> addEvent(Event event) async {
    await Future.delayed(const Duration(seconds: 5));
    allEvents.add(event);
  }

  @override
  Future<List<Event>> loadAllEvents() async {
    await Future.delayed(Duration(seconds: 1 * allEvents.length));
    return allEvents;
  }
}
