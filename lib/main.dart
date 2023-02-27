import 'package:doittoday/repositories/item_repository.dart';
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
  runApp(MaterialApp(home: MyApp()));
}

class AppBarComponent extends StatelessWidget implements PreferredSizeWidget {
  const AppBarComponent({super.key});

  static const title = "Title";

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);

    ColorScheme colorScheme = themeData.colorScheme;
    TextTheme textTheme = themeData.textTheme;

    TextStyle titleStyle = TextStyle(
      color: Colors.white,
      fontSize: textTheme.titleMedium?.fontSize
    );

    return AppBar(
      backgroundColor: colorScheme.primary,
      title: Text(title, style: titleStyle),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final ThemeData themeData = ThemeData(
    useMaterial3: true,
    colorScheme:
        ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 32, 93, 161)),
  );

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Do It Today',
        theme: themeData,
        home: const Scaffold(
          body: HomePage(),
          appBar: AppBarComponent(),
          floatingActionButton: FloatingActionMenu(
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
