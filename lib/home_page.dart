import 'dart:convert';

import 'package:day_4/model/catalog.dart';
import 'package:day_4/model/catalog.dart';

import 'package:day_4/widget/Drawer.dart';
import 'package:flutter/material.dart';
import 'package:day_4/widget/Drawer.dart';
import 'package:flutter/services.dart';

import 'model/catalog.dart';
import 'widget/item_widget.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  final int days = 30;

  final String name = 'HAMMAD';
  @override
  void initState() {
    super.initState();
    LoadData();
  }

  LoadData() async {
    await Future.delayed(Duration(seconds: 2));
    final CatalogJson =
        await rootBundle.loadString("assets/files/catalog.json");
    final decodedData = jsonDecode(CatalogJson);
    var Productdata = decodedData["products"];
    CatalogModel.items =
        List.from(Productdata).map<Item>((item) => Item.fromMap(item)).toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'CATALOG APP',
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(16),
          child: (CatalogModel.items != Null && CatalogModel.items.isNotEmpty)
              ? ListView.builder(
                  itemCount: CatalogModel.items.length,
                  itemBuilder: (context, index) {
                    return ItemWidget(
                      item: CatalogModel.items[index],
                    );
                  },
                )
              : Center(
                  child: CircularProgressIndicator(
                    backgroundColor: Colors.blue,
                  ),
                ),
        ),
        drawer: const MyDrawer());
  }
}
