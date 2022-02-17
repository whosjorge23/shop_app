import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './widgets/app_drawer.dart';
import './providers/orders_provider.dart';
import './widgets/orders_screen_widget/order_item_w.dart';

class OrdersScreen extends StatelessWidget {
  static const routeName = '/orders';
  const OrdersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final orderData = Provider.of<Orders>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Orders"),
      ),
      drawer: AppDrawer(),
      body: ListView.builder(
          itemCount: orderData.orders.length,
          itemBuilder: (context, index) =>
              OrderItemWidget(order: orderData.orders[index])),
    );
  }
}
