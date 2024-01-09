import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_cart_app/features/user/model/product_model.dart';
import 'package:shopping_cart_app/features/viewmodels/list_view.dart';
import 'package:shopping_cart_app/features/viewmodels/product_viewmodel.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.themeData,
    required this.index,
    required this.product,
  });

  final ThemeData themeData;
  final int index;
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5.0,
      child: ListTile(
        trailing: IconButton(
          icon: Icon(
            Icons.delete,
            color: themeData.colorScheme.secondary,
          ),
          onPressed: () {
            // Show a confirmation dialog
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text("Confirm Delete"),
                  content: Text("Are you sure you want to delete this item?"),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop(); // Close the dialog
                      },
                      child: Text("Cancel",style: themeData.textTheme.bodySmall,),
                    ),
                    TextButton(
                      onPressed: () {
                        // Add your delete logic here
                        // For example, call a function to delete the user
                        // e.g., deleteUserFunction();
                        Provider.of<ProductViewModel>(context,listen:false).deleteProduct(product).then((value){
                          Navigator.of(context).pop();

                        });

                        // After deletion, close the dialog
                      },
                      child: Text("Delete",style: themeData.textTheme.bodySmall,),
                    ),
                  ],
                );
              },
            );
          },
        )
        ,
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

        title: Text("${products[index]['name']}"),
        subtitle: Text("${products[index]['price']}"),

      ),
    );
  }
}
