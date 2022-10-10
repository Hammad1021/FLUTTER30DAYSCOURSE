import 'package:flutter/material.dart';

class Item {
  final String id;
  final String name;
  final String desc;
  final String color;
  final num price;
  final String image;

  Item({this.id, this.name, this.desc, this.color, this.price, this.image});
}

final Products = [
  Item(
      id: 'hammad1',
      name: 'iPhone 12 Pro',
      desc: 'Apple iPhone 12th generation',
      color: '#33505a',
      price: 999,
      image:
          '"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRISJ6msIu4AU9_M9ZnJVQVFmfuhfyJjEtbUm3ZK11_8IV9TV25-1uM5wHjiFNwKy99w0mR5Hk&usqp=CAc'),
];
