import 'package:flutter/material.dart';
import '../providers/order.dart';
import 'package:intl/intl.dart';
import 'dart:math';

class OrderTile extends StatefulWidget {
  final OrderList orderData;
  OrderTile(this.orderData);

  @override
  _OrderTileState createState() => _OrderTileState();
}

class _OrderTileState extends State<OrderTile> {
  bool _isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8),
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text('\$${widget.orderData.price}'),
            subtitle: Text(
              DateFormat('dd/MM/yyyy hh:mm').format(widget.orderData.orderDate),
            ),
            trailing: IconButton(
              icon: Icon(_isExpanded ? Icons.expand_less : Icons.expand_more),
              onPressed: () {
                setState(() {
                  _isExpanded = !_isExpanded;
                });
              },
            ),
          ),
          if (_isExpanded)
            Container(
              height: min(widget.orderData.cartList.length * 10.0 + 100, 100),
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
                children: widget.orderData.cartList
                    .map(
                      (e) => Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(e.title),
                          Text('${e.quantity} * \$${e.price} ')
                        ],
                      ),
                    )
                    .toList(),
              ),
            ),
        ],
      ),
    );
  }
}
