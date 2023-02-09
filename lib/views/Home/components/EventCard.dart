// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';

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
  const EventCardItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Row(
        children: [
          Text('11/04 - Evento'),
        ],
      ),
    );
  }
}

class EventCard extends StatelessWidget {
  const EventCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          border: Border.all(color: MyColors.greyBorder),
          borderRadius: BorderRadius.all(Radius.circular(10))),
      margin: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          Column(
            children: [
              const EventCardTitle(),
              EventCardItem(),
              EventCardItem(),
              EventCardItem(),
              SizedBox(height: 8.0)
            ],
          ),
          Divider(
            color: Colors.black,
            height: 1,
          ),
          TextButton(onPressed: () => {}, child: Text("Abrir agenda"))
        ],
      ),
    );
  }
}
