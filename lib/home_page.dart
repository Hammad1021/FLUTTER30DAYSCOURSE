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
    await Future.delayed(Duration(seconds: 1));
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
              ? GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 50,
                    crossAxisSpacing: 15,
                  ),
                  itemBuilder: (context, index) {
                    final Item = CatalogModel.items[index];
                    return Card(
                        clipBehavior: Clip.antiAlias,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: GridTile(
                            header: Container(
                              child: Text(
                                Item.name,
                                style: TextStyle(color: Colors.white),
                              ),
                              padding: EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: Colors.blue,
                              ),
                            ),
                            child: Image.network(Item.image),
                            footer: Container(
                              child: Text(
                                Item.price.toString(),
                                style: TextStyle(color: Colors.white),
                              ),
                              padding: EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: Colors.black,
                              ),
                            )));
                  },
                  itemCount: CatalogModel.items.length)
              : Center(
                  child: CircularProgressIndicator(
                    backgroundColor: Colors.blue,
                  ),
                ),
        ),
        drawer: const MyDrawer());
  }
}
