import 'package:doittoday/repositories/item_repository.dart';
import 'package:doittoday/utils/formate_date.dart';
import 'package:flutter/material.dart';

import '../entities/event.dart';

class AddEventDialog extends StatefulWidget {
  const AddEventDialog({super.key});

  @override
  State<AddEventDialog> createState() => _AddEventDialogState();
}

class _AddEventDialogState extends State<AddEventDialog> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController name = TextEditingController();
  final TextEditingController description = TextEditingController();

  final TextEditingController dateInput = TextEditingController();
  final TextEditingController timeInput = TextEditingController();

  @override
  void dispose() {
    name.dispose();
    description.dispose();
    dateInput.dispose();
    timeInput.dispose();
    super.dispose();
  }

  DateTime? date = DateTime.now();
  TimeOfDay? time = TimeOfDay.now();

  ItemRepository repository = ItemRepository();

  String? _validator(String? value) {
    if (value == null || value.isEmpty) {
      return "Campo Obrigátorio!";
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    void submit() async {
      if (_formKey.currentState!.validate()) {
        Event event = Event(
          name.text,
          description.text,
          DateTime(
              date!.year, date!.month, date!.day, time!.hour, time!.minute),
        );

        await repository
            .addEvent(event)
            .then((value) => Navigator.pop(context));
      }
    }

    return AlertDialog(
      title: const Text("Evento"),
      actions: [
        TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancelar", style: TextStyle(color: Colors.red))),
        TextButton(
          onPressed: () async => submit(),
          child: const Text("Adicionar"),
        )
      ],
      content: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 10),
              TextFormField(
                  controller: name,
                  validator: _validator,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), label: Text("Nome"))),
              const SizedBox(height: 10),
              TextFormField(
                validator: _validator,
                decoration: const InputDecoration(
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
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
