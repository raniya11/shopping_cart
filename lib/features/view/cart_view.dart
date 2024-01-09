import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_cart_app/features/viewmodels/list_view.dart';
import 'package:shopping_cart_app/features/viewmodels/product_viewmodel.dart';
import 'package:shopping_cart_app/features/widgets/product_card.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {

    final themeData=Theme.of(context);
    return Scaffold(
      appBar: AppBar(),

      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Products",style: themeData.textTheme.displayLarge,),
            SizedBox(height: 15,),
            Expanded(
              child: Consumer<ProductViewModel>(
                builder: (context,productprovider,child){
                  if(productprovider.products.isEmpty){
                    return Center(
                      child: Text("no products"),
                    );
                  }
                  return ListView.builder(
                      itemCount: productprovider!.products.length,
                      itemBuilder: (context,index){
                        return ProductCard(themeData: themeData,
                          index:index,
                          product:productprovider.products[index],
                        );
                      });
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}


