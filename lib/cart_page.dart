import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'product_model.dart';
import 'cart_model.dart';
import 'package:go_router/go_router.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Product> cartProducts = context.watch<CartModel>().getCartProducts();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () => context.go('/'), icon: const Icon(Icons.keyboard_backspace)),
        title: Text("Amazonie Panier"),),
      body: Center(
        child:Container(
          padding: EdgeInsets.all(8.0),
          child:Column(
            children: [
              Text("Votre amazonie panier contient ${cartProducts.length} produit(s).", textAlign: TextAlign.center, style: Theme.of(context).textTheme.headline6),
              ListView.builder(
                shrinkWrap: true,
                itemCount: cartProducts.length,
                itemBuilder: (_, index)=>ListTile(
                  onTap: () =>context.go('/detail', extra: cartProducts[index]),
                  leading: Image.network(cartProducts[index].image,
                    width: 80, height: 80,),
                  title: Text(cartProducts[index].title),
                  subtitle: Text(cartProducts[index].displayPriceInEuro()),
                  trailing: IconButton(onPressed: ()=>context.read<CartModel>().delete(cartProducts[index]),
                  icon: const Icon(Icons.delete),),
                ),
                ),
              Spacer(),
              Text('Coût total du panier : ${context.read<CartModel>().getTotalPrice()}€', style: Theme.of(context).textTheme.headline6),
              ],
            )

      ),
      ),
    );
  }
}
