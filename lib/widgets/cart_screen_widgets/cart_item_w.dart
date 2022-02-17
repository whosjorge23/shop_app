import 'package:flutter/material.dart';

class CartItemWidget extends StatelessWidget {
  final String id;
  final double price;
  final int quantity;
  final String title;

  const CartItemWidget(
      {Key? key,
      required this.id,
      required this.price,
      required this.quantity,
      required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
      child: Padding(
        padding: EdgeInsets.all(8),
        child: ListTile(
          leading: CircleAvatar(
              child: Text(
            "\$$price",
            style: TextStyle(fontSize: 11),
          )),
          title: Text(title),
          subtitle: Text("Total: \$${price * quantity}"),
          trailing: Text("$quantity x"),
        ),
      ),
    );
  }
}
