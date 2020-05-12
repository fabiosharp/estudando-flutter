import 'package:flutter/material.dart';
import './views/products_overview_screen.dart';
import 'utils/AppRoutes.dart';
import 'widgets/product_detail_screen.dart';
// import 'providers/counter_provider.dart';
import 'package:provider/provider.dart';
import 'providers/products.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Products>(
      create: (contxt) => Products(),
      child: MaterialApp(
        title: 'Minha Loja',
        theme: ThemeData(
          primarySwatch: Colors.purple,
          accentColor: Colors.deepOrange,
          fontFamily: 'Lato',
        ),
        home: MyHomePage(),
        routes: {AppRoutes.PRODUCT_DETAIL: (contxt) => ProductDetailScreen()},
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ProductsOverviewScreen();
  }
}
