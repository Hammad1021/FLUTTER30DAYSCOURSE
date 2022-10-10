import 'package:flutter/material.dart';

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
      drawer: Drawer(),
    );
  }
}
