import 'package:http/http.dart' as http;
import 'package:amazon/rating_model.dart';
import 'package:amazon/api.dart';

class Product
{
  final int id;
  final String title;
  final String description;
  final double price;
  final String image;
  final String category;
  final Rate rate;
  //final Rating rating;

  const Product({required this.id,required this.title,required this.description,required this.price,required this.image,required
      this.category,required this.rate});

  String displayPriceInEuro()=> "$price €";


  static Future<List<Product>> getProducts() async {
    final List<dynamic>? maps = await API.get('https://fakestoreapi.com/products');

        return List.generate(maps?.length ?? 0, (i) {
          return Product(id: maps?[i]['id'],
              title: maps?[i]['title'],
              description: maps?[i]['description'],
              price: maps?[i]['price'].toDouble(),
              image: maps?[i]['image'],
              category: maps?[i]['category'],
              rate: Rate(rate: maps?[i]['rating']['rate'].toDouble(),
                        count: maps?[i]['rating']['count']),
          );
        });
  }

/**factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      price: json['price'],
      image: json['image'],
      category: json['category'],
      rate: json['rating'],
    );
  }**/

}

class Rate {
  final double rate;
  final int count;

  Rate({required this.rate, required this.count});
}