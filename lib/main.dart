import 'package:day_4/home_page.dart';
import 'package:day_4/utils/route.dart';
import 'package:day_4/widget/themes.dart';
import 'login_page.dart';
import 'package:flutter/material.dart';
import 'package:material_color_utilities/material_color_utilities.dart';
import 'package:flutter/src/material/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.light,
        theme: MyTheme.LightTheme(context),
        initialRoute: MyRoutes.HomePageroute,
        routes: {
          MyRoutes.HomePageroute: (context) => homepage(),
          MyRoutes.LoginPageroute: (context) => loginpage()
        });
  }
}
