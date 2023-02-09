import 'package:doittoday/entities/item.dart';
import 'package:doittoday/main.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListPage extends StatefulWidget {
  ListPage(this.filter, {super.key});

  ItemType filter;

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  String _getPageTitle(ItemType filter) {
    String title = "";

    switch (filter) {
      case ItemType.event:
        title = "Eventos";
        break;
        case ItemType.open:
        title = "Próximas Ações";
        break;
        case ItemType.waiting:
        title = "Aguardando";
        break;
        case ItemType.doc:
        title = "Documentar";
        break;
        case ItemType.maybe:
        title = "Algum dia talvez";
        break;
        
      default:
    }

    return title;
  }

  @override
  Widget build(BuildContext context) {
    var state = context.watch<MyAppState>();

    return Scaffold(
      appBar: AppBar(
        title: Text(_getPageTitle(widget.filter)),
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(
        itemCount: state.nextEvents.length,
        itemBuilder: (context, index) {
          Item item = state.nextEvents[index];
          if (item.type == widget.filter) {
            return Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(border: Border(bottom: BorderSide())),
              width: double.infinity,
              height: 60,
              child: Text(item.name),
            );
          }
        },
      ),
    );
  }
}
