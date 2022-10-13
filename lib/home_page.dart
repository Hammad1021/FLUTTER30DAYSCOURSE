import 'dart:convert';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/services.dart';

import 'package:day_4/model/catalog.dart';
import 'package:day_4/model/catalog.dart';
import 'package:day_4/widget/Drawer.dart';
import 'package:day_4/widget/Drawer.dart';

import 'model/catalog.dart';
import 'widget/item_widget.dart';

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
        body: SafeArea(
      child: Container(
        padding: EdgeInsets.all(32),
        child: Column(
          children: [
            CatalogHeader(),
            if (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
              Expanded(child: CaltalogList())
            else
              Center(child: CircularProgressIndicator())
          ],
        ),
      ),
    ));
  }
}

class CatalogHeader extends StatelessWidget {
  const CatalogHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Center(
        child: Text(
          'CATALOG APP',
          style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
        ),
      ),
      Center(
        child: Text('Trending Products',
            style: TextStyle(
              fontSize: 15,
            )),
      ),
      SizedBox(
        height: 15,
      )
    ]);

    CaltalogList();
  }
}

class CaltalogList extends StatelessWidget {
  const CaltalogList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: CatalogModel.items.length,
      itemBuilder: (context, index) {
        final catalog = CatalogModel.items[index];
        return CatalogItem(Catalog: catalog);
      },
    );
  }
}

class CatalogItem extends StatelessWidget {
  const CatalogItem({
    Key? key,
    required this.Catalog,
  })  : assert(Catalog != null),
        super(key: key);
  final Item Catalog;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 8),
      alignment: Alignment.topLeft,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        children: [
          Image.network(
            Catalog.image,
            width: 118,
            height: 70,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  Catalog.name,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.black),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  Catalog.desc,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 8,
                    color: Colors.black,
                  ),
                ),
                ButtonBar(
                    alignment: MainAxisAlignment.spaceBetween,
                    buttonPadding: EdgeInsets.only(left: 10),
                    children: [
                      Text(
                        "\$${Catalog.price}".toString(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      ElevatedButton(
                          onPressed: () {},
                          child: Text(
                            "Buy",
                          ))
                    ])
              ],
            ),
          )
        ],
      ),
    );
  }
}
