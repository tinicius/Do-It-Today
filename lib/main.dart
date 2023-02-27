import 'package:doittoday/repositories/item_repository.dart';
import 'package:doittoday/utils/theme.dart';
import 'package:doittoday/views/Home/components/floating_action_menu.dart';
import 'package:doittoday/views/Home/components/add_event_dialog.dart';
import 'package:doittoday/views/Home/components/button_menu.dart';
import 'package:doittoday/views/Home/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'entities/action.dart';
import 'entities/event.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MaterialApp(home: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Do It Today',
        theme: AppTheme.themeData,
        home: Scaffold(
          body: const HomePage(),
          appBar: AppTheme.appBar(title: "Home"),
          floatingActionButton: const FloatingActionMenu(
            distance: 100,
            children: [ButtonMenu(text: "Evento", dialog: AddEventDialog())],
          ),
        ),
      ),
    );
  }
}

class MyAppState extends ChangeNotifier {
  ItemRepository repository = ItemRepository();

  List<Event> nextEvents = <Event>[];

  void refreshNextEvents() {
    repository.loadNextEvents().then((value) {
      nextEvents = value;
      notifyListeners();
    });
  }

  Future<List<Event>> getAllEvents() async {
    List<Event> allEvents = await repository.loadAllEvents();
    return allEvents;
  }

  MyAppState() {
    refreshNextEvents();
  }
}
