import 'package:flutter/foundation.dart';
import './cart.dart';

class OrderList {
  final String id;
  final double price;
  final List<CartItem> cartList;
  final DateTime orderDate;
  OrderList(this.id, this.price, this.cartList, this.orderDate);
}

class Order with ChangeNotifier {
  List<OrderList> _orders = [];

  List<OrderList> get orders {
    return [..._orders];
  }

  void addOrder(List<CartItem> orders, double total) {
    _orders.insert(
      0,
      OrderList(
        DateTime.now().toString(),
        total,
        orders,
        DateTime.now(),
      ),
    );
    notifyListeners();
  }
}
