import 'package:doittoday/entities/item.dart';
import 'package:doittoday/main.dart';
import 'package:doittoday/utils/formate_date.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EventItem extends StatelessWidget {
  EventItem(this.event, {super.key});

  Event event;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: double.infinity,
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide())
      ),
      child: Row(
        children: [Expanded(child: Text(event.name)), Text(formatDate(event.date))],
      ),
    );
  }
}

class ListEventPage extends StatefulWidget {
  const ListEventPage({super.key});

  @override
  State<ListEventPage> createState() => _ListEventPageState();
}

class _ListEventPageState extends State<ListEventPage> {
  @override
  Widget build(BuildContext context) {
    var state = context.watch<MyAppState>();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Eventos"),
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(
        itemCount: state.allEvents.length,
        itemBuilder: (context, index) {
          Event event = state.allEvents[index];
          return EventItem(event);
        },
      ),
    );
  }
}
