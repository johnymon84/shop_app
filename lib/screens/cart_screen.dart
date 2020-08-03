import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/order.dart';
import '../providers/cart.dart';
import '../widgets/cart_tile.dart';

class CartScreen extends StatelessWidget {
  static const routePage = '/cart';
  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: Column(
        children: <Widget>[
          Card(
            elevation: 3,
            margin: EdgeInsets.all(15.0),
            child: Padding(
              padding: EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Total',
                    style: TextStyle(fontSize: 20.0),
                  ),
                  Spacer(),
                  Chip(
                    label: Text(
                      '\$${cartProvider.cartTotal.toStringAsFixed(2)}',
                      style: TextStyle(
                          color: Theme.of(context)
                              .primaryTextTheme
                              .headline1
                              .color),
                    ),
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                  FlatButton(
                    child: Text('ORDER NOW'),
                    textColor: Theme.of(context).primaryColor,
                    onPressed: () {
                      Provider.of<Order>(context, listen: false).addOrder(
                          cartProvider.items.values.toList(),
                          cartProvider.cartTotal);
                      cartProvider.clear();
                    },
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: cartProvider.itemCount,
              itemBuilder: (context, index) {
                return CartTile(
                    cartProvider.items.values.toList()[index].id,
                    cartProvider.items.keys.toList()[index],
                    cartProvider.items.values.toList()[index].title,
                    cartProvider.items.values.toList()[index].price,
                    cartProvider.items.values.toList()[index].quantity);
              },
            ),
          ),
        ],
      ),
    );
  }
}
