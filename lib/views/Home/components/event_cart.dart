import 'package:doittoday/main.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../entities/event.dart';
import '../../../utils/my_colors.dart';
import "../../../utils/formate_date.dart";

class EventCardTitle extends StatelessWidget {
  const EventCardTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, bottom: 8.0),
      child: Row(
        children: const [
          Text(
            "Próximos Eventos",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 21),
          )
        ],
      ),
    );
  }
}

class EventCardItem extends StatelessWidget {
  const EventCardItem(this.item, {super.key});

  final Event item;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          child: Container(
            margin: const EdgeInsets.only(left: 8.0, right: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    item.name,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Text(formatDate(item.date)),
                const SizedBox(width: 10),
                Text(TimeOfDay.fromDateTime(item.date).format(context)),
                const SizedBox(width: 10),
                Text(Event.statusToStringMessage(item.status))
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class EventCardList extends StatelessWidget {
  const EventCardList({super.key});

  @override
  Widget build(BuildContext context) {
    var state = context.watch<MyAppState>();

    return state.nextEvents.isEmpty
        ? const Text("Sem eventos próximos!")
        : ListView.builder(
            shrinkWrap: true,
            itemCount: state.nextEvents.length,
            itemBuilder: (context, index) {
              return EventCardItem(state.nextEvents[index]);
            },
          );
  }
}

class EventCard extends StatefulWidget {
  const EventCard({super.key});

  @override
  State<EventCard> createState() => _EventCardState();
}

class _EventCardState extends State<EventCard> {
  @override
  Widget build(BuildContext context) {
    var state = context.watch<MyAppState>();
    return Flexible(
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: MyColors.greyBorder),
            borderRadius: const BorderRadius.all(Radius.circular(10))),
        margin: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  EventCardTitle(),
                  EventCardList(),
                  SizedBox(height: 8.0)
                ],
              ),
            ),
            const Divider(
              color: Colors.black,
              height: 1,
            ),
            TextButton(onPressed: () => {}, child: const Text("Abrir agenda"))
          ],
        ),
      ),
    );
  }
}
