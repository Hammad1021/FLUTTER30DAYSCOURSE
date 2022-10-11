import 'package:flutter/material.dart';

import 'package:day_4/widget/themes.dart';
import 'package:flutter/material.dart';

class MyTheme {
  static ThemeData LightTheme(BuildContext context) => ThemeData(
        appBarTheme: AppBarTheme(
            color: Colors.blue,
            elevation: 0.0,
            iconTheme: IconThemeData(color: Colors.black)),
        textTheme: Theme.of(context).textTheme,
        primarySwatch: Colors.blue,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              primary: Colors.amber, // background (button) color
              onPrimary: Colors.black,
              minimumSize: Size(100, 35)
              // foreground (text) color
              ),
        ),
      );
}
