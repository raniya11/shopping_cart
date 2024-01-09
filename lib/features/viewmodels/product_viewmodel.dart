import 'package:flutter/foundation.dart';
import 'package:shopping_cart_app/features/user/model/product_model.dart';

class ProductViewModel extends ChangeNotifier{
  List<ProductModel> _products=[];
  List<ProductModel> get products=>_products;

  //add user

  Future addProduct(ProductModel product)async{

    _products.add(product);
    notifyListeners();
    print(_products);
  }

  Future deleteProduct(ProductModel product)async{
    _products.remove(product);
    notifyListeners();
    print(_products);
  }

}