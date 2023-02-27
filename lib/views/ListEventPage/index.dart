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
      body: FutureBuilder(
        future: state.getAllEvents(),
        builder: (context, snapshot) {
          if (ConnectionState.waiting == snapshot.connectionState) {
            return const Center(child: CircularProgressIndicator());
          }

          if (ConnectionState.done == snapshot.connectionState) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                Event event = snapshot.data![index];
                return EventItem(event);
              },
            );
          }

          return Center(
              child: Text("Erro ao carregar eventos!",
                  style: AppTheme.textTheme.bodyLarge));
        },
      ),
    );
  }
}
