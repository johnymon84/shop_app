import 'package:flutter/material.dart';
import 'product_tile.dart';
import '../providers/products.dart';
import 'package:provider/provider.dart';

class ProductsGrid extends StatelessWidget {
  bool _showOnlyFav;
  ProductsGrid(this._showOnlyFav);
  @override
  Widget build(BuildContext context) {
    final productsProvider = Provider.of<Products>(context);
    final importedProducts =
        _showOnlyFav ? productsProvider.favouriteItems : productsProvider.items;
    if (importedProducts.isEmpty) {
      return Center(
        child: Text('Empty List, Please add items'),
      );
    } else {
      return GridView.builder(
          padding: const EdgeInsets.all(5.0),
          itemCount: importedProducts.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: 3 / 2),
          itemBuilder: (context, index) {
            return ChangeNotifierProvider.value(
                value: importedProducts[index],
                child: ProductTile(
                    //importedProducts[index].id,
                    //importedProducts[index].imageUrl,
                    //importedProducts[index].title,
                    //importedProducts[index].isFavourite),
                    ));
          });
    }
  }
}
