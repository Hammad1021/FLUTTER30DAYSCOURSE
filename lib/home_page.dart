import 'package:day_4/widget/Drawer.dart';
import 'package:flutter/material.dart';
import 'package:day_4/widget/Drawer.dart';

class homepage extends StatelessWidget {
  const homepage({super.key});
  final int days = 30;
  final String name = 'HAMMAD';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('CATALOG APP'),
        ),
        body: Center(
          child: Container(
            child: Text('WELCOME TO $days DAYS FLUTTER COURSE BY $name'),
          ),
        ),
        drawer: const MyDrawer());
  }
}
