import 'package:flutter/material.dart';
import 'package:saffron_trial_10/models/product.dart';
import 'package:saffron_trial_10/models/store.dart';
import 'package:saffron_trial_10/providers/products.dart';
import 'package:saffron_trial_10/screens/products/product_item.dart';
import 'package:saffron_trial_10/screens/products/product_list_item.dart';
import 'package:provider/provider.dart';

class ProductList extends StatefulWidget {
  final Product product;
  static int maxNumber = 7;
  ProductList({this.product});

  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {

  @override
  void initState() {
    super.initState();
    final productsProvider = Provider.of<Products>(
        context, listen: false
    );
    productsProvider.products(widget.product.storeId);
  }

  @override
  Widget build(BuildContext context) {
    final productsProvider = Provider.of<Products>(context);
    //List<Product> productslist = productsProvider.products(widget.product.storeId);
    List<Product> productslist = productsProvider.productNoParam;
    //List<Product> rangeProducts = productslist.getRange(0, 9).toList();

    return Container(
      height: 125,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        itemBuilder: (context, index) => ChangeNotifierProvider.value(
          value: productslist[index],
          child: ProductListItem(),
        ),
      ),
    );
  }
}

//
// Expanded(
// child: ListView(
// physics: BouncingScrollPhysics(),
// scrollDirection: Axis.horizontal,
// padding:
// EdgeInsets.symmetric(horizontal: 10, vertical: 10),
// children: List.generate(productslist.length, (index) {
// Product product = productslist[index];
// return ProductList(product:product);
// }),
// ),
// ),
// );
