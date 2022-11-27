import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'product_model.dart';

class DetailPage extends StatelessWidget {
  final Product product;
  const DetailPage({Key? key, required this.product }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      leading: IconButton(onPressed: () => context.go('/'), icon: const Icon(Icons.keyboard_backspace)),
        title: Text("Détail article"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
          Container(
          child: Hero(tag: "product_${product.id}", child: Image.network(product.image, height: 300, width: 300,)),
        ),
          Text(product.title, style: Theme.of(context).textTheme.headline6,),
          Text(product.description, style: Theme.of(context).textTheme.bodySmall,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Prix : ${product.price.toString()}€"),
              //ElevatedButton(onPressed: ()=> context.read<Cart>().add(product), child: const Text('Ajouter'))
            ],
          ),
          Spacer(
            flex: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RatingBar.builder(
                initialRating: product.rate.rate,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {
                },
              ),
              Text(product.rate.rate.toString(), style: Theme.of(context).textTheme.headline6,),
            ],
          ),

        ],)),
    );
  }
}
