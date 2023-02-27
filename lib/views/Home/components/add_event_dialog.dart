import 'package:doittoday/entities/action.dart';
import 'package:doittoday/main.dart';
import 'package:doittoday/repositories/item_repository.dart';
import 'package:doittoday/utils/formate_date.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../entities/event.dart';

class AddEventDialog extends StatefulWidget {
  const AddEventDialog({super.key});

  @override
  State<AddEventDialog> createState() => _AddEventDialogState();
}

class _AddEventDialogState extends State<AddEventDialog> {
  final TextEditingController name = TextEditingController();
  final TextEditingController description = TextEditingController();

  final TextEditingController dateInput = TextEditingController();
  final TextEditingController timeInput = TextEditingController();

  DateTime? date = DateTime.now();
  TimeOfDay? time = TimeOfDay.now();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Evento"),
      actions: [
        TextButton(
            onPressed: () {},
            child: const Text(
              "Cancelar",
              style: TextStyle(color: Colors.red),
            )),
        TextButton(
            onPressed: () async {
              Event event = Event(
                  name.text,
                  description.text,
                  DateTime(date!.year, date!.month, date!.day, time!.hour,
                      time!.minute));

              ItemRepository repository = ItemRepository();
              await repository.addEvent(event);
              repository.loadAllEvents();
            },
            child: const Text("Adicionar"))
      ],
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: name,
         
            decoration: const InputDecoration(
                border: OutlineInputBorder(), label: Text("Nome")),
          ),
          const SizedBox(height: 10),
          const TextField(
            decoration: InputDecoration(
                border: OutlineInputBorder(), label: Text("Descrição")),
            minLines: 3,
            maxLines: 4,
          ),
          const SizedBox(height: 10),
          TextField(
            controller: dateInput,
            decoration: const InputDecoration(
                border: OutlineInputBorder(), labelText: "Hora"),
            readOnly: true,
            onTap: () async {
              date = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(1950),
                  lastDate: DateTime(2100));

              if (date != null) {
                String formattedDate = formatDate(date!);
                setState(() {
                  dateInput.text = formattedDate;
                });
              }
            },
          ),
          const SizedBox(height: 10),
          TextField(
            controller: timeInput,
            decoration: const InputDecoration(
                border: OutlineInputBorder(), labelText: "Data"),
            readOnly: true,
            onTap: () async {
              time = await showTimePicker(
                  context: context, initialTime: TimeOfDay.now());

              if (time != null) {
                setState(() {
                  timeInput.text = time!.format(context);
                });
              }
            },
          )
        ],
      ),
    );
  }
}
