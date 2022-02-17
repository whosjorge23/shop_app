import 'package:flutter/material.dart';
import './widgets/product_overview_widgets/product_grid.dart';

class ProductsOverviewScreen extends StatelessWidget {
  ProductsOverviewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("My Flutter Shop")),
      body: ProductGrid(),
    );
  }
}
