import 'package:flutter/material.dart';
import '../screens/order_screen.dart';
import '../screens/cart_screen.dart';
import 'package:shop_app/widgets/badge.dart';
import '../widgets/products_grid.dart';
import '../providers/cart.dart';
import 'package:provider/provider.dart';

enum dropMenuFilter { Favourites, All }

class ProductOverviewScreen extends StatefulWidget {
  @override
  _ProductOverviewScreenState createState() => _ProductOverviewScreenState();
}

class _ProductOverviewScreenState extends State<ProductOverviewScreen> {
  bool _showOnlyFav = false;
  @override
  Widget build(BuildContext context) {
    //final cart = Provider.of<Cart>(context, listen: true);
    return Scaffold(
      drawer: Drawer(
          child: ListView(
        children: <Widget>[
          DrawerHeader(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Shopping app',
                  style: TextStyle(fontSize: 30),
                ),
              ],
            ),
            decoration: BoxDecoration(color: Theme.of(context).primaryColor),
          ),
          ListTile(
            leading: Icon(Icons.featured_play_list),
            title: Text(
              'Orders',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            onTap: () {
              Navigator.of(context).pushNamed(OrderScreen.routePage);
            },
          ),
        ],
      )),
      appBar: AppBar(
        title: Text('Shopping App'),
        actions: <Widget>[
          PopupMenuButton(
            icon: Icon(Icons.more_horiz),
            onSelected: (dropMenuFilter value) {
              setState(() {
                if (value == dropMenuFilter.Favourites) {
                  _showOnlyFav = true;
                } else {
                  _showOnlyFav = false;
                }
              });
            },
            itemBuilder: (_) => [
              PopupMenuItem(
                child: Text('Show Favourites'),
                value: dropMenuFilter.Favourites,
              ),
              PopupMenuItem(
                child: Text('Show All'),
                value: dropMenuFilter.All,
              ),
            ],
          ),
          Consumer<Cart>(
            builder: (ctx, cart, ch) =>
                Badge(child: ch, value: cart.itemCount.toString()),
            child: IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () =>
                  Navigator.of(context).pushNamed(CartScreen.routePage),
            ),
          )
        ],
      ),
      body: ProductsGrid(_showOnlyFav),
    );
  }
}
