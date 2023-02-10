import 'package:doittoday/repositories/item_repository.dart';
import 'package:doittoday/views/Home/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'entities/item.dart';

void main() {
  runApp(MaterialApp(home: const MyApp()));
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
              ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 32, 93, 161)),
        ),
        home: Scaffold(
          body: const HomePage(),
          appBar: AppBar(
            backgroundColor: Colors.blue,
            // title: const Text("Do It Today"),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () => {
              showDialog(context: context, builder: (BuildContext context) => AlertDialog(
                title: Text("Adicionar Item"),
                content: TextField(),
                actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'Cancel'),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, 'OK'),
              child: const Text('OK'),
            ),
          ],
              ))
            },
            child: Icon(Icons.add),
          ),
        ),
      ),
    );
  }
}

class MyAppState extends ChangeNotifier {
  ItemRepository repository = ItemRepository();

  List<Event> nextEvents = <Event>[];

  void loadNextEvents() {
    nextEvents = repository.loadNextEvents();
    notifyListeners();
  }
}
