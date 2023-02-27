import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData themeData = ThemeData(
    useMaterial3: true,
    colorScheme:
        ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 32, 93, 161)),
  );

  static final ColorScheme colorScheme = themeData.colorScheme;
  static final TextTheme textTheme = themeData.textTheme;

  static PreferredSizeWidget appBar({required String title}) {
    TextStyle titleStyle = TextStyle(
        color: Colors.white, fontSize: textTheme.titleMedium?.fontSize);

    return AppBar(
      backgroundColor: colorScheme.primary,
      iconTheme: const IconThemeData(color: Colors.white  ),
      title: Text(title, style: titleStyle),
    );
  }
}
