import 'package:flutter/material.dart';
import '../screens/cart_screen.dart';
import 'package:shop_app/widgets/badge.dart';
import '../widgets/products_grid.dart';
import '../providers/cart.dart';
import 'package:provider/provider.dart';
import '../widgets/app_drawer.dart';

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
      drawer: AppDrawer(),
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
