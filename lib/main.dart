import 'package:doittoday/repositories/item_repository.dart';
import 'package:doittoday/views/Home/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'entities/item.dart';

void main() {
  runApp(const MyApp());
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
            onPressed: () => {},
            child: Icon(Icons.add),
          ),
        ),
      ),
    );
  }
}

class MyAppState extends ChangeNotifier {
  ItemRepository repository = ItemRepository();

  List<Item> nextEvents = <Item>[];

  void loadNextEvents() {
    nextEvents = repository.loadNextEvents();
    notifyListeners();
  }
}
