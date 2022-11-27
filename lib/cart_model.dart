import 'package:amazon/product_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class CartModel extends ChangeNotifier
{
  List<Product> _products = [];
  void add (Product product)
  {
    _products.add(product);
    notifyListeners();
  }

  getCount() => _products.length;

  getTotalPrice(){
    double totalPrice = 0;
    for (var product in _products)
      {
        totalPrice += product.price;
      }
    return totalPrice;
  }

  getCartProducts() => _products;

  void delete(Product product)
  {
    _products.remove(product);
    notifyListeners();
  }
}