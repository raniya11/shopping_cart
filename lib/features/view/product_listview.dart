

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_cart_app/core/services/theme_services.dart';
import 'package:shopping_cart_app/features/user/model/product_model.dart';
import 'package:shopping_cart_app/features/view/cart_view.dart';
import 'package:shopping_cart_app/features/viewmodels/list_view.dart';
import 'package:shopping_cart_app/features/viewmodels/product_viewmodel.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {


    final themeData=Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Shopping Cart",style: themeData.textTheme.displayLarge,),
        actions: [
          Switch(
            trackOutlineColor: MaterialStateProperty.all(Colors.transparent),
              activeColor: Colors.teal,
              activeTrackColor: Colors.tealAccent,
              value: Provider.of<ThemeServiceProvider>(context).isDarkModeOn, onChanged: (_){
              Provider.of<ThemeServiceProvider>(context,listen: false).toggleTheme();
          }),
          IconButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>CartPage()));
          }, icon: Icon(Icons.shopping_cart))
        ],
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("All Products",style: themeData.textTheme.displayLarge,),
            SizedBox(height: 20,),
            Expanded(
                child: ListView.builder(
                  itemCount: products.length,
                    itemBuilder: (context,index){

                      return ListTile(

                        title: Text("${products[index]['name']}"),
                        subtitle: Text("${products[index]['price']}"),

                        trailing: IconButton(
                            onPressed: () {
                              ProductModel product=ProductModel();
                              Provider.of<ProductViewModel>(context,listen:false).addProduct(product).then((value){
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text('Item added to cart'),
                                    duration: Duration(seconds: 2),
                                  ),
                                );
                              });

                            }, icon: Icon(Icons.shopping_cart)),
                        leading: products[index]['imageUrl'].isNotEmpty
                            ? Image.asset(
                          products[index]['imageUrl'],
                          width: 50,
                          height: 50,
                          fit: BoxFit.cover,
                        )
                            : Container(
                          width: 50,
                          height: 50,
                        ),
                      );

                    },
                ),
            ),
          ],
        ),
      ),
    );
  }
}
