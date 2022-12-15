/*
import 'package:flutter/material.dart';
import 'package:freshlii_trial8/services/bloc/cart_bloc.dart';
import 'package:freshlii_trial8/models/product.dart';
import 'package:freshlii_trial8/models/store.dart' as storeModel;
import 'package:freshlii_trial8/screens/products/productDetails.dart';
import 'package:freshlii_trial8/screens/products/productServices.dart';
import 'package:freshlii_trial8/services/bloc/favorite_bloc.dart';
import 'package:freshlii_trial8/widgets/bottom_appBar.dart';
import 'package:freshlii_trial8/widgets/rating_stars.dart';

import '../../app_properties.dart';

class StoreDetails extends StatefulWidget {
  final storeModel.Store store;

  StoreDetails({this.store});
  @override
  _StoreDetailsState createState() => _StoreDetailsState();
}

class _StoreDetailsState extends State<StoreDetails> {
  List<Product> _products;
  String _storeName;
  bool _isloading = true;
  @override
  void initState() {
    super.initState();
    _isloading = true;
    productServices.getProducts(widget.store.storeId).then((products) {
      setState(() {
        _storeName = widget.store.storeName;
        _products = products;
        _isloading = false;
      });
    });
    print(widget.store.isFavorite);
    print(widget.store.storeId.toString());
    print(_products);
  }
  isInFavorite() {
    //print(widget.store.isFavorite);

    if(widget.store.isFavorite == true){
      blocFavorites.addToFavorites(widget.store);
    } else {
      blocFavorites.removeFromFavorites(widget.store);
    }

  }
  _buildProductMenu(Product product) {
    return Container(
      height: (MediaQuery.of(context).size.width-30)/2,
      width: (MediaQuery.of(context).size.width-50)/2,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Center(
        child: Stack(
          children: <Widget>[
            GestureDetector(
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ProductDetails(
                    //passing the values to the product_details page
                    product: product, store: widget.store.storeId,
                  ))),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.all(5),
                    height: (MediaQuery.of(context).size.width-50)/2-40,
                    width: (MediaQuery.of(context).size.width-50)/2,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(
                        image: NetworkImage(product.imageUrl),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                   Container(
                      margin: EdgeInsets.only(bottom: 2, left: 7, right: 7),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            width: (MediaQuery.of(context).size.width-50)/4,
                            child: Text(
                              "${product.productName}",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                  letterSpacing: 0.8,
                                  color: Colors.grey), overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Text(
                            "\$${product.price}",
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w300,
                                letterSpacing: 0.8,
                                color: green),
                          ),
                        ],
                      ),
                    ),
                  Container(
                    margin: EdgeInsets.only(bottom: 5, left: 7, right: 7),
                    alignment: Alignment.centerLeft,
                    child: Text("units", textAlign: TextAlign.start, style: TextStyle(
                      color: green,
                      fontSize: 10
                    ),),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 5,
              right: 5,
              child: Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                    color: green,
                    borderRadius: BorderRadius.circular(30)),
                child: IconButton(
                    icon: Icon(
                      Icons.add,
                      size: 15,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      setState(() {
                        blocCart.addToCart(product);
                      });
                      print(blocCart.cartItems);
                      print("boogie boggie");
                    }),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Stack(
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(30),
                ),
                  child: Image(
                      height: (MediaQuery.of(context).size.height)/3,
                      width: MediaQuery.of(context).size.width,
                      fit: BoxFit.cover,
                      image: NetworkImage(widget.store.imageUrl)),

              ),
              Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    IconButton(
                        iconSize: 30,
                        color: green,
                        icon: Icon(Icons.arrow_back_ios),
                        onPressed: () => Navigator.pop(context)),
                    IconButton(
                        iconSize: 30,
                        color: green,
                        icon: (*/
/*widget.store.isFavorite ? Icon(Icons.favorite) :*//*
 Icon(Icons.favorite_border)),
                        onPressed: () {
                          setState(() {
                            //widget.store.isFavorite = !widget.store.isFavorite;
                          });
                          print(widget.store.isFavorite);
                          isInFavorite();
                          print("added to favaoirtes");
                          //blocFavorites.addToFavorites(widget.store);
                        }),
                  ],
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      widget.store.storeName,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "0.2 miles away",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: RatingStars(widget.store.rating),
              ),
              Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Text(
                  widget.store.brandName,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
              Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    RaisedButton(
                      padding:
                      EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      onPressed: () {},
                      color: green,
                      child: Text(
                        "Reviews",
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                    RaisedButton(
                      onPressed: () {},
                      padding:
                      EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      color: green,
                      child: Text(
                        "Contact",
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Center(
                child: Text(
                  "Menu",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1.2,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
          Expanded(
            child: (_isloading
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircularProgressIndicator(
                        backgroundColor: green,
                      ),
                    ],
                  )
                : Container(
                    height: MediaQuery.of(context).size.height-125,
                    child: Expanded(
                        child: GridView.count(
                      //padding: EdgeInsets.all(10),
                      crossAxisCount: 2,
                      children: List.generate(_products.length, (index) {
                        Product product = _products[index];
                        return Center(
                          child: _buildProductMenu(product),
                        );
                      }),
                    ),),
                  )),
          ),
        ],
      ),
      bottomNavigationBar: BottomBar(),
    );
  }
}*/
