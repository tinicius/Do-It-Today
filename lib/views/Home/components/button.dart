import 'package:doittoday/entities/item.dart';
import 'package:doittoday/views/ListPage/index.dart';
import 'package:flutter/material.dart';

import '../../../utils/my_colors.dart';

class Button extends StatelessWidget {
  String text;
  void onPressed;
  bool contrast;

  Button(
      {super.key,
      required this.text,
      required this.onPressed,
      this.contrast = false});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {
        Navigator.push(context, MaterialPageRoute(builder: (context) => ListPage(ItemType.open)))
      },
      child: Container(
        width: double.infinity,
        height: 56,
        decoration: BoxDecoration(
            border: Border.all(
                color: contrast ? Colors.yellow : MyColors.greyBorder),
            borderRadius: const BorderRadius.all(Radius.circular(10))),
        margin: const EdgeInsets.only(left: 10.0, right: 10.0, bottom: 5.0),
        padding: const EdgeInsets.all(10.0),
        child: Text(
          text,
          style: const TextStyle(fontSize: 21),
        ),
      ),
    );
  }
}
