import '../entities/action.dart';
import 'package:localstore/localstore.dart';

import '../entities/event.dart';

abstract class ItemService {
  Future<List<Event>> loadNextEvents(int count);
  Future<List<Event>> loadAllEvents();
  Future<void> addEvent(Event event);


  Future<void> addAction(Action action);
  Future<List<Action>> loadAllActions();
}

class ItemLocalStorage implements ItemService {

  final db = Localstore.instance;

  @override
  Future<List<Event>> loadNextEvents(int count) async {
    Map<String, dynamic>? items = await db.collection('events').get();
    
    List<Event> events = [];

    if (items != null) {
      if (count > items.values.length) {
        count = items.values.length;
      }

      int index = 0;

      for (var element in items.values) { 
        if (index < count) {
          Map<String, dynamic> json = {
            'name': element['name'],
            'description': element['description'],
            'date': element['date'],
            'status': element['status']
          };

          events.add(Event.fromJson(json));
        }

        index++;
      }
    }

    return events;
  }

  @override
  Future<List<Action>> loadAllActions() async {
  return [];
  }

  @override
  Future<void> addEvent(Event event) async {
    final id = db.collection("events").doc().id;

    await db.collection('events').doc(id).set({
      'name': event.name,
      'description': event.description,
      'date': event.date.millisecondsSinceEpoch,
      'status': event.status.toString()
    });
  }

  @override
  Future<List<Event>> loadAllEvents() async {
    Map<String, dynamic>? items = await db.collection('events').get();

    List<Event> events  = [];

    if (items != null) {
      for (var element in items.values) {
        Map<String, dynamic> json = {
          'name': element['name'],
          'description': element['description'],
          'date': element['date'],
          'status': element['status']
        };

        events.add(Event.fromJson(json));
      }
    }

    return events;
  }
  
  @override
  Future<void> addAction(Action action) async {
    final id = db.collection("events").doc().id;

    // await db.collection('events').doc(id).set({
    //   'name': event.name,
    //   'description': event.description,
    //   'date': event.date.millisecondsSinceEpoch,
    //   'status': event.status.toString()
    // });
  }
}
