import 'package:doittoday/main.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../entities/item.dart';
import '../../../utils/my_colors.dart';

class EventCardTitle extends StatelessWidget {
  const EventCardTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, bottom: 8.0),
      child: Row(
        children: const [
          Text(
            "Eventos",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 21),
          )
        ],
      ),
    );
  }
}

class EventCardItem extends StatelessWidget {
  const EventCardItem(this.item, {super.key});

  final Item item;

  String _formateDate(DateTime date) {
    String day =
        date.day.toString().length < 2 ? "0${date.day}" : date.day.toString();
    String month = date.month.toString().length < 2
        ? "0${date.month}"
        : date.month.toString();
    String year = date.year.toString();

    return "$day/$month/$year";
  }

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
                Row(
                  children: [
                    const SizedBox(
                      width: 10,
                    ),
                    Text(_formateDate(item.date))
                  ],
                )
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
        ? Text("Sem eventos próximos!")
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
            TextButton(
                onPressed: () => {state.loadNextEvents()},
                child: const Text("Abrir agenda"))
          ],
        ),
      ),
    );
  }
}
