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
          create: (context) => Auth(),
        ),
        ChangeNotifierProxyProvider<Auth, Products>(
          create: (context) => Products("", "", []),
          update: (context, auth, previousProducts) => Products(
              auth.token!,
              auth.userId,
              previousProducts!.items == null ? [] : previousProducts.items),
        ),
        ChangeNotifierProvider(
          create: (context) => Cart(),
        ),
        ChangeNotifierProxyProvider<Auth, Orders>(
          create: (context) => Orders("", []),
          update: (context, auth, previousOrders) => Orders(auth.token!,
              previousOrders!.orders == null ? [] : previousOrders.orders),
        ),
      ],
      child: Consumer<Auth>(
        builder: ((context, auth, child) => MaterialApp(
              title: 'Flutter Shop',
              theme: ThemeData(
                colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue)
                    .copyWith(secondary: Colors.yellow),
                fontFamily: 'Lato',
              ),
              home: auth.isAuth ? ProductsOverviewScreen() : AuthScreen(),
              routes: {
                ProductDetailScreen.routeName: (context) =>
                    ProductDetailScreen(),
                CartScreen.routeName: (context) => CartScreen(),
                OrdersScreen.routeName: (context) => OrdersScreen(),
                UserProductsScreen.routeName: (context) => UserProductsScreen(),
                EditProductScreen.routeName: (context) => EditProductScreen(),
              },
            )),
      ),
    );
  }
}
