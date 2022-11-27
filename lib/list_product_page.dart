import 'package:amazon/api.dart';
import 'package:amazon/cart_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'product_model.dart';
import 'product_model.dart';
import 'package:go_router/go_router.dart';

class ListProductsPage extends StatefulWidget {
  const ListProductsPage({Key? key}) : super(key: key);

  @override
  State<ListProductsPage> createState() => _ListProductsPageState();
}

class _ListProductsPageState extends State<ListProductsPage> {
  @override
  void initState() {
    super.initState();
    future: Product.getProducts();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Produits Amazonie"),
          actions: [
            Stack(
              alignment: Alignment.center,
              children: [
                IconButton(
                    onPressed: () => context.go('/cart'), icon: const Icon(Icons.shopping_cart)),
                Positioned(
                  right: 8,
                  top: 4,
                  child: Container(width: 18, height: 18,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.red
                      ),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(context.read<CartModel>().getCount().toString(), style: TextStyle(color: Colors.white)),
                      )
                  ),
                )
              ],
            )
          ]
      ),
      body: FutureBuilder<List<Product>>(
        future: Product.getProducts(),
        builder: (context, AsyncSnapshot<List<Product>> snapshot){
          if(snapshot.hasData){
            return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (_, index) => ListTile(
                  onTap: () => context.go('/detail', extra: snapshot.data![index]),
                  leading: Hero(tag: "product_${snapshot.data![index].id}",child: Image.network(snapshot.data![index].image, scale:15.0),),
                  title: Text(snapshot.data![index].title),
                  subtitle: Text(snapshot.data![index].displayPriceInEuro(), style: TextStyle(fontWeight: FontWeight.bold),),
                  trailing: IconButton(onPressed: () => context.read<CartModel>().add(snapshot.data![index]), icon: const Icon(Icons.add)),

                )
            );
          }
          else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  /**buildListProduct() {
    future: Product.getProducts();
    Future<List<Product>> callAsyncFetch() =>
        Future.delayed(
            const Duration(milliseconds: 10), () => Product.getProducts());
    return FutureBuilder<List<Product>>(
        builder: (context, AsyncSnapshot<List<Product>> snapshot) {
          if (snapshot.hasData) {
            return
              ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: snapshot.data?.length,
                  itemBuilder: (_context, i) {
                    return buildRow(snapshot.data![i]);
                  }
              );
          } else {
            return Column(
                children: const [
                  Center(child: CircularProgressIndicator(),)]);
          }
        });
  }*/

  /**buildRow() {
    return FutureBuilder<List<Product>>(
      future: Product.getProducts(),
      builder: (context, AsyncSnapshot<List<Product>> snapshot){
        if(snapshot.hasData){
          return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (_, index) => ListTile(
              onTap: () => context.go('/detail', extra: snapshot.data![index]),
        leading: Hero(tag: "product_${snapshot.data![index].id}",child: Image.network(snapshot.data![index].image, scale:15.0),),
        title: Text(snapshot.data![index].title),
        subtitle: Text(snapshot.data![index].displayPriceInEuro(), style: TextStyle(fontWeight: FontWeight.bold),),
        trailing: IconButton(onPressed: () {}, icon: const Icon(Icons.add)),

        )
        );
        }
        else {
        return const Center(
        child: CircularProgressIndicator(),
        );
        }
      },
    );*/

}
