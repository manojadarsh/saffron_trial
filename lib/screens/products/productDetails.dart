// import 'package:flutter/material.dart';
// import 'package:freshlii_trial8/models/store.dart';
// import 'package:freshlii_trial8/services/bloc/cart_bloc.dart';
// import 'package:freshlii_trial8/services/bloc/favorite_bloc.dart';
// import 'package:freshlii_trial8/models/product.dart';
// import 'package:freshlii_trial8/screens/products/productServices.dart';
// import 'package:freshlii_trial8/widgets/bottom_appBar.dart';
// import 'package:freshlii_trial8/widgets/rating_stars.dart';
// import 'package:numberpicker/numberpicker.dart';
//
// import '../../app_properties.dart';
//
// class ProductDetails extends StatefulWidget {
//   final Product product;
//   final int store;
//
//   ProductDetails({this.product, this.store});
//   @override
//   _ProductDetailsState createState() => _ProductDetailsState();
// }
//
// class _ProductDetailsState extends State<ProductDetails> {
//   List<Product> _products;
//   int _currentIntValue = 1;
//   NumberPicker integerNumberPicker;
//   String _storeName;
//   bool _isloading = true;
//
//   @override
//   void initState() {
//     super.initState();
//     _isloading = true;
//     productServices.getProducts(widget.store).then((products) {
//       setState(() {
//         //_storeName = widget.store.storeName;
//         _products = products;
//         _isloading = false;
//       });
//     });
//    // print(widget.store.storeId.toString());
//     print(_products);
//   }
//
//   Future _showIntDialog() async {
//     await showDialog<int>(
//       context: context,
//       builder: (BuildContext context) {
//         return new NumberPickerDialog.integer(
//           minValue: 0,
//           maxValue: 25,
//           step: 1,
//           initialIntegerValue: _currentIntValue,
//         );
//       },
//     ).then((num value) {
//       if (value != null) {
//         setState(() => _currentIntValue = value);
//         integerNumberPicker.animateInt(value);
//       }
//     });
//   }
//
//   _buildSuggestedItems(Product product) {
//     return Container(
//         height: 152,
//         margin: EdgeInsets.all(10),
//         width: 250,
//         decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.circular(15),
//             border: Border.all(width: 1, color: Colors.grey[50])),
//         child: Expanded(
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: <Widget>[
//               ClipRRect(
//                 borderRadius: BorderRadius.circular(15),
//                 child: Image(
//                   height: 100.0,
//                   //width: 100.0,
//                   fit: BoxFit.cover,
//                   image: NetworkImage(product.imageUrl),
//                 ),
//               ),
//               Expanded(
//                 child: Container(
//                   margin: EdgeInsets.all(12),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: <Widget>[
//                       Text(
//                         "${product.productName}",
//                         style: TextStyle(
//                             fontSize: 18, fontWeight: FontWeight.bold),
//                         overflow: TextOverflow.ellipsis,
//                       ),
//                       Text("${product.rating} + ⭐",
//                           style: TextStyle(
//                               fontSize: 12, fontWeight: FontWeight.w600),
//                           overflow: TextOverflow.ellipsis),
//                       Text("\$${product.price}",
//                           style: TextStyle(
//                               fontSize: 12, fontWeight: FontWeight.w600),
//                           overflow: TextOverflow.ellipsis),
//                     ],
//                   ),
//                 ),
//               ),
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.end,
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Container(
//                     decoration: BoxDecoration(
//                         color: Theme.of(context).primaryColor,
//                         borderRadius: BorderRadius.circular(30)),
//                     child: IconButton(
//                         icon: Icon(
//                           Icons.add,
//                           size: 30,
//                           color: Colors.white,
//                         ),
//                         onPressed: () {
//
//                         }),
//                     margin: EdgeInsets.only(right: 20),
//                   ),
//                 ],
//               )
//             ],
//           ),
//         ));
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: ListView(
//         children: [
//           Stack(
//             children: <Widget>[
//               ClipRRect(
//                 borderRadius: BorderRadius.vertical(
//                   bottom: Radius.circular(30),
//                 ),
//                 child: Image(
//                     height: 250,
//                     width: MediaQuery.of(context).size.width,
//                     fit: BoxFit.cover,
//                     image: NetworkImage(widget.product.imageUrl)),
//               ),
//               Padding(
//                 padding:
//                     const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: <Widget>[
//                     IconButton(
//                         iconSize: 30,
//                         color: Theme.of(context).primaryColor,
//                         icon: Icon(Icons.arrow_back_ios),
//                         onPressed: () => Navigator.pop(context)),
//                     /*IconButton(
//                         iconSize: 30,
//                         color: Theme.of(context).primaryColor,
//                         icon: Icon(Icons.favorite),
//                         onPressed: () {}),*/
//                   ],
//                 ),
//               ),
//             ],
//           ),
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: <Widget>[
//               Padding(
//                 padding:
//                     const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: <Widget>[
//                     Text(
//                       widget.product.productName,
//                       style: TextStyle(
//                         fontSize: 20,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     Text(
//                       "\$${widget.product.price}",
//                       style: TextStyle(
//                         fontSize: 20,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               Container(
//                 width: MediaQuery.of(context).size.width,
//                 margin: EdgeInsets.all(15),
//                 decoration: BoxDecoration(
//                     color: lightgreen, borderRadius: BorderRadius.circular(15)),
//                 alignment: Alignment.center,
//                 padding:
//                     const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     Text(
//                       widget.product.productName,
//                       style: TextStyle(
//                         fontSize: 20,
//                         color: Colors.grey,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     FlatButton(
//                         onPressed: () {
//                           _showIntDialog();
//                         },
//                         child: Row(
//                           children: [
//                             Text(
//                               "Quantity ($_currentIntValue)",
//                               style: TextStyle(),
//                             ),
//                             Icon(
//                               Icons.arrow_drop_down,
//                               size: 25,
//                             ),
//                           ],
//                         )),
//                     Text(
//                       "",
//                       style: TextStyle(fontSize: 16, color: Colors.grey),
//                     ),
//                   ],
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 15),
//                 child: RatingStars(widget.product.rating.toDouble()),
//               ),
//               Padding(
//                 padding:
//                     const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
//                 child: Text(
//                   widget.store.toString(),
//                   style: TextStyle(
//                     fontSize: 14,
//                     fontWeight: FontWeight.w300,
//                   ),
//                 ),
//               ),
//               GestureDetector(
//                 onTap: () {
//
//                 },
//                 child: Container(
//                   width: MediaQuery.of(context).size.width,
//                   margin: EdgeInsets.all(15),
//                   decoration: BoxDecoration(
//                       color: green, borderRadius: BorderRadius.circular(35)),
//                   alignment: Alignment.center,
//                   padding:
//                       const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Icon(
//                         Icons.add_shopping_cart,
//                         color: lightgreen,
//                       ),
//                       SizedBox(
//                         width: 5,
//                       ),
//                       Text(
//                         "Add To Cart",
//                         style: TextStyle(fontSize: 16, color: Colors.white),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 height: 10,
//               ),
//               Center(
//                 child: Text(
//                   "Other Items",
//                   style: TextStyle(
//                     fontSize: 20,
//                     fontWeight: FontWeight.w600,
//                     letterSpacing: 1.2,
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 height: 10,
//               ),
//             ],
//           ),
//           Expanded(
//             child: (_isloading
//                 ? Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       CircularProgressIndicator(
//                         backgroundColor: green,
//                       ),
//                     ],
//                   )
//                 : Container(
//                     height: 125,
//                     child: Expanded(
//                         child: ListView(
//                       physics: BouncingScrollPhysics(),
//                       scrollDirection: Axis.horizontal,
//                       padding:
//                           EdgeInsets.symmetric(horizontal: 10, vertical: 10),
//                       children: List.generate(_products.length, (index) {
//                         Product product = _products[index];
//                         return _buildSuggestedItems(product);
//                       }),
//                     )),
//                   )),
//           ),
//         ],
//       ),
//       bottomNavigationBar: BottomBar(),
//     );
//   }
// }
