import 'package:day_4/model/catalog.dart';
import 'package:day_4/model/catalog.dart';

import 'package:day_4/widget/Drawer.dart';
import 'package:flutter/material.dart';
import 'package:day_4/widget/Drawer.dart';

import 'model/catalog.dart';
import 'widget/item_widget.dart';

class homepage extends StatelessWidget {
  const homepage({super.key});
  final int days = 30;
  final String name = 'HAMMAD';
  @override
  Widget build(BuildContext context) {
    final dummylist = List.generate(20, (index) => CatalogModel.items[0]);
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'CATALOG APP',
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: Padding(
            padding: EdgeInsets.all(16),
            child: ListView.builder(
              itemCount: dummylist.length,
              itemBuilder: (context, index) {
                return ItemWidget(
                  item: dummylist[index],
                );
              },
            )),
        drawer: const MyDrawer());
  }
}
