import 'package:flutter/material.dart';
import 'package:saffron_trial_10/models/category.dart';
import 'package:saffron_trial_10/screens/stores/store_screen.dart';
import 'package:provider/provider.dart';

import '../../app_properties.dart';

class CategoryItem extends StatelessWidget {
  // Category category;
  // CategoryItem(this.category);
  @override
  Widget build(BuildContext context) {

    final Category category = Provider.of<Category>(context);
    //print(category.stores.first.products.first.productName);
    return Container(
      //argin: EdgeInsets.all(5),
      child: Center(
        child: GestureDetector(
          onTap: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => StoreScreen(
                //passing the values to the product_details page
                category: category,
              ))),
          child: Stack(
            children: [
              Container(
                height: (MediaQuery.of(context).size.width - 50) / 2,
                width: (MediaQuery.of(context).size.width - 50) / 2,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: green.withOpacity(0.1)
                ),
              ),
              Column(
                children: [
                  Container(
                    height: (MediaQuery.of(context).size.width - 50) / 2 - 30,
                    width: (MediaQuery.of(context).size.width - 50) / 2,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(
                        image: NetworkImage(category.imageUrl == null ? "https://www.pikpng.com/transpng/hxwmoxb/":category.imageUrl),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                    child:  Text(
                      "${category.storeCategoryName}",
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.8,
                        color: green,
                      ),
                    )
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}