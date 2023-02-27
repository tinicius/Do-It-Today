import 'package:flutter/material.dart';

import '../../../entities/event.dart';
import '../../../utils/formate_date.dart';

class EventItem extends StatelessWidget {
  const EventItem(this.event, {super.key});

  final Event event;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: double.infinity,
      padding: const EdgeInsets.all(8.0),
      decoration: const BoxDecoration(border: Border(bottom: BorderSide())),
      child: Row(
        children: [
          Expanded(child: Text(event.name)),
          Text(formatDate(event.date))
        ],
      ),
    );
  }
}