import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'cart_model.dart';
import 'detail_page.dart';
import 'product_model.dart';
import 'cart_page.dart';
import 'list_product_page.dart';

void main() {
  runApp(
      ChangeNotifierProvider<CartModel>(
        create: (context) => CartModel(),
        child: AmazonieShop(),
  )
  );
}

class AmazonieShop extends StatelessWidget {
  AmazonieShop({Key? key}) : super(key: key);
  final _router = GoRouter(
      routes: <RouteBase>[
        GoRoute(
            path: '/',
            builder: (BuildContext context, GoRouterState state) {
              return ListProductsPage();
            },
            routes: <RouteBase>[
              GoRoute(
                path: 'cart',
                builder: (BuildContext context, GoRouterState state) {
                  return CartPage();
                },
              ),
              GoRoute(
                path: 'detail',
                builder: (BuildContext context, GoRouterState state) {
                  return DetailPage(product: state.extra as Product);
                },
              )
            ]
        ),
      ]
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: "Amazonie Shop",
      theme: ThemeData(
          primaryColor: Colors.amber
      ),
      routerConfig: _router,
      //home: ProductPage(),
    );
  }
}


