import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../main.dart';

class ButtonMenu extends StatefulWidget {
  const ButtonMenu({
    super.key,
    required this.text,
    required this.dialog,
  });

  final String text;
  final Widget dialog;

  @override
  State<ButtonMenu> createState() => _ButtonMenuState();
}

class _ButtonMenuState extends State<ButtonMenu> {
  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    ColorScheme colorScheme = themeData.colorScheme;

    MyAppState state = context.watch<MyAppState>();

    void onPressed() {
      showDialog(context: context, builder: (context) => widget.dialog)
          .then((value) => {state.refreshNextEvents()});
    }

    return Container(
      padding: const EdgeInsets.only(top: 4, right: 8, bottom: 4),
      decoration: BoxDecoration(
          color: colorScheme.primary, borderRadius: BorderRadius.circular(10)),
      alignment: Alignment.center,
      child: TextButton(
        onPressed: onPressed,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.add,
              color: Colors.white,
              size: 20,
            ),
            Text(
              widget.text,
              style: const TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
