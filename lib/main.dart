import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './providers/orders_provider.dart';
import './auth_screen.dart';
import './products_overview_screen.dart';
import './product_detail_screen.dart';
import './cart_screen.dart';
import './orders_screen.dart';
import './user_products_screen.dart';
import './edit_product_screen.dart';
import './providers/products_provider.dart';
import './providers/cart_provider.dart';
import './providers/auth_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Products(),
        ),
        ChangeNotifierProvider(
          create: (context) => Cart(),
        ),
        ChangeNotifierProvider(
          create: (context) => Orders(),
        ),
        ChangeNotifierProvider(
          create: (context) => Auth(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Shop',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue)
              .copyWith(secondary: Colors.yellow),
          fontFamily: 'Lato',
        ),
        home: AuthScreen(),
        routes: {
          ProductDetailScreen.routeName: (context) => ProductDetailScreen(),
          CartScreen.routeName: (context) => CartScreen(),
          OrdersScreen.routeName: (context) => OrdersScreen(),
          UserProductsScreen.routeName: (context) => UserProductsScreen(),
          EditProductScreen.routeName: (context) => EditProductScreen(),
        },
      ),
    );
  }
}
