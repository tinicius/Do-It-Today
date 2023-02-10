import 'package:doittoday/repositories/item_repository.dart';
import 'package:doittoday/views/Home/components/floating_action_menu.dart';
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
          // floatingActionButton: FloatingActionButton(
          //   onPressed: () => {
          //     showDialog(
          //         context: context,
          //         builder: (BuildContext context) => AlertDialog(
          //               title: Text("Adicionar Item"),
          //               content: TextField(),
          //               actions: <Widget>[
          //                 TextButton(
          //                   onPressed: () => Navigator.pop(context, 'Cancel'),
          //                   child: const Text('Cancel'),
          //                 ),
          //                 TextButton(
          //                   onPressed: () => Navigator.pop(context, 'OK'),
          //                   child: const Text('OK'),
          //                 ),
          //               ],
          //             ))
          //   },
          //   child: Icon(Icons.add),
          // ),
          floatingActionButton: FloatingActionMenu(distance: 100, children: [
            ButtonMenu(),
            ButtonMenu(),
      
          ]),
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

class ButtonMenu extends StatelessWidget {
  const ButtonMenu({
    super.key,
    this.onPressed,
  });

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      
      padding: const EdgeInsets.only(top: 4, right: 8, bottom: 4),
      decoration: BoxDecoration(
          color: Colors.blue, borderRadius: BorderRadius.circular(10)),
      alignment: Alignment.center,
      child: TextButton(
        onPressed: () {  },
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              onPressed: onPressed,
              icon: const Icon(Icons.add, color: Colors.white,),
              color: theme.colorScheme.onSecondary,
              iconSize: 20,
            ),
            Text("Evento", style: TextStyle(
              color: Colors.white
            ),),
            
          ],
        ),
      ),
    );
  }
}
