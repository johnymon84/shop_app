import 'package:flutter/material.dart';
import '../widgets/order_tile.dart';
import '../providers/order.dart';
import 'package:provider/provider.dart';

class OrderScreen extends StatelessWidget {
  static const routePage = '/orders';
  @override
  Widget build(BuildContext context) {
    final orderList = Provider.of<Order>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Order List'),
      ),
      body: ListView.builder(
        itemCount: orderList.orders.length,
        itemBuilder: (context, index) => OrderTile(orderList.orders[index]),
      ),
    );
  }
}
