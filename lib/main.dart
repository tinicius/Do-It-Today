import 'package:doittoday/repositories/item_repository.dart';
import 'package:doittoday/views/Home/components/floating_action_menu.dart';
import 'package:doittoday/views/Home/components/add_event_dialog.dart';
import 'package:doittoday/views/Home/components/button_menu.dart';
import 'package:doittoday/views/Home/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'entities/item.dart';

void main() {
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
        theme: ThemeData(
          useMaterial3: true,
          colorScheme:
              ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 32, 93, 161)),
        ),
        home: Scaffold(
          body: const HomePage(),
          appBar: AppBar(
            backgroundColor: Colors.blue,
            // title: const Text("Do It Today"),
          ),
          
          floatingActionButton: FloatingActionMenu(
            distance: 100,
            children: [
              ButtonMenu(text: "Evento", dialog: AddEventDialog())
            ],
          ),
        ),
      ),
    );
  }
}

class MyAppState extends ChangeNotifier {
  ItemRepository repository = ItemRepository();

  List<Event> nextEvents = <Event>[];
  List<Event> allEvents = <Event>[];

  MyAppState() {
    repository.loadNextEvents().then((value) {
      nextEvents = value;
      notifyListeners();
    });

    repository.loadAllEvents().then((value) {
      allEvents = value;
      notifyListeners();
    });
  }
}
