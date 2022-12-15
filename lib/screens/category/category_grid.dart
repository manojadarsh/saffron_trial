import 'package:flutter/material.dart';
import 'package:saffron_trial_10/models/category.dart';
import 'package:saffron_trial_10/providers/categories.dart';
import 'package:saffron_trial_10/screens/category/category_item.dart';
import 'package:saffron_trial_10/widgets/bottom_appBar.dart';
import 'package:provider/provider.dart';

import '../../app_properties.dart';

class CategoryGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final categoriesProvider = Provider.of<Categories>(context);

    //categoriesProvider.getCategories();
    final List<Category> categoriesList = categoriesProvider.categories;
    //print(categoriesList);
    //print("${categoriesList}");
    return categoriesList.isEmpty ? Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(alignment: Alignment.center,
          height: MediaQuery.of(context).size.height,
          child: CircularProgressIndicator(
            backgroundColor: green,
          ),),
      ],
    ) : Container(
        //height: MediaQuery.of(context).size.height-200,
        padding: EdgeInsets.symmetric(horizontal: 5),

          child: GridView.builder(
            //scrollDirection: Axis.vertical,
            physics: BouncingScrollPhysics(),
            itemCount: categoriesList.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemBuilder: (BuildContext context, int index) => ChangeNotifierProvider.value(value: categoriesList[index], child: CategoryItem(),)


            // {
            //   Category category = categoriesList[index];
            //   //category.stores.forEach((element) {print(element.storeName);});
            //   return
            //     CategoryItem(category);
            // },
          ),


    );
  }
}
