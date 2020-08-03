import 'package:flutter/material.dart';
import './providers/order.dart';
import './providers/products.dart';
import './screens/product_overview_screen.dart';
import './screens/product_detail_screen.dart';
import 'package:provider/provider.dart';
import './providers/cart.dart';
import './screens/cart_screen.dart';
import './screens/order_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx) => Products()),
        ChangeNotifierProvider(create: (ctx) => Cart()),
        ChangeNotifierProvider(create: (ctx) => Order()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(accentColor: Colors.lime, primaryColor: Colors.teal),
        home: ProductOverviewScreen(),
        routes: {
          ProductDetailScreen.routePage: (ctx) => ProductDetailScreen(),
          CartScreen.routePage: (ctx) => CartScreen(),
          OrderScreen.routePage: (ctx) => OrderScreen(),
        },
      ),
    );
  }
}
