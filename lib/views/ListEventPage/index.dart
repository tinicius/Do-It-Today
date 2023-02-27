import 'package:doittoday/main.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../entities/event.dart';
import '../../utils/theme.dart';
import 'components/event_item.dart';

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
      appBar: AppTheme.appBar(title: "Eventos"),
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
