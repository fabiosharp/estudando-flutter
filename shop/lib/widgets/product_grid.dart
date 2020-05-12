import 'package:flutter/material.dart';

import '../providers/products.dart';
import 'package:provider/provider.dart';
import '../models/product.dart';
import '../widgets/product_item.dart';

class ProductGrid extends StatelessWidget {
  const ProductGrid({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Product> loadedProducts = Provider.of<Products>(context).items;

    return GridView.builder(
      padding: EdgeInsets.all(10),
      itemCount: loadedProducts.length,
      itemBuilder: (ctx, i) => ProductItem(loadedProducts[i]),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
    );
  }
}
