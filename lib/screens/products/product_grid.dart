import 'package:flutter/material.dart';
import 'package:saffron_trial_10/models/product.dart';
import 'package:saffron_trial_10/models/store.dart' as storeModel;
import 'package:saffron_trial_10/providers/products.dart';
import 'package:saffron_trial_10/screens/products/product_item.dart';
import 'package:provider/provider.dart';

class ProductGrid extends StatefulWidget {
  final storeModel.Store store;
  ProductGrid({this.store});

  @override
  _ProductGridState createState() => _ProductGridState();
}

class _ProductGridState extends State<ProductGrid> {

  @override
  void initState() {
    super.initState();
    final productsProvider = Provider.of<Products>(
        context, listen: false
    );
    productsProvider.products(widget.store.storeId);
  }

  @override
  Widget build(BuildContext context) {
    print(widget.store.storeId);
    final productsProvider = Provider.of<Products>(context);

    //productsProvider.getProducts(store.storeId);
    print("store id: ${widget.store.storeId}");
    //List<Product> productsList = productsProvider.products(widget.store.storeId);
    List<Product> productsList = productsProvider.productNoParam;
    print(productsList);

    return  productsList.isEmpty? Container(child: Text("No Products"),):Container(
      height: MediaQuery.of(context).size.height/1.5,
      padding: EdgeInsets.only(right: 10, left: 10,bottom: 20),
      child: GridView.builder(
        gridDelegate:
        SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, crossAxisSpacing: 10, mainAxisSpacing: 10),
        itemCount: productsList.length,
        itemBuilder: (context, index) => ChangeNotifierProvider.value(
          value: productsList[index],
          child:ProductItem(),
        ),
      ),
    );
  }
}
/*

GridView.count(crossAxisCount: 2, children: List.generate(productsList.length, (index) {
        Product product = productsList[index];
        return Center(
          child: ProductItem(product: product),
        );
      }),)

return Container(
child: GridView.builder(
gridDelegate:
SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
itemCount: productsList.length,
itemBuilder: (context, index) => ChangeNotifierProvider.value(
value: productsList[index],
child: ProductItem(),
),
),
);*/
