import 'package:doittoday/views/Home/components/button.dart';
import 'package:doittoday/views/Home/components/event_cart.dart';
import 'package:doittoday/views/ListEventPage/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Column(
        //mainAxisAlignment: MainAxisAlignment.start,
        // crossAxisAlignment: CrossAxisAlignment.center,
        //mainAxisSize: MainAxisSize.max,
        children: [
          EventCard(),
          Button(
              text: "Eventos",
              contrast: true,
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ListEventPage()));
              }),
          Button(text: "Próximas ações", onPressed: () => {}),
          Button(text: "Aguardando", onPressed: () => {}),
          Button(text: "Documentar", onPressed: () => {}),
          Button(text: "Algum dia talvez", onPressed: () => {})
        ],
      ),
    );
  }
}
