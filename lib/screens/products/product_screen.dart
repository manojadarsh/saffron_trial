import 'package:flutter/material.dart';
import 'package:saffron_trial_10/models/store.dart';
import 'package:saffron_trial_10/screens/products/product_grid.dart';
import 'package:saffron_trial_10/widgets/bottom_appBar.dart';
import 'package:saffron_trial_10/widgets/rating_stars.dart';

import '../../app_properties.dart';

class ProductScreen extends StatefulWidget {
  final Store store;


  ProductScreen({this.store});

  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {

  TextEditingController searchTEC = TextEditingController();

  showAlertDialog(BuildContext context) {

    // set up the button
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.pop(context);
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("${widget.store.storeName}"),
      content: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.width/2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Brand Name: ${widget.store.brandName}", style: textFieldStyleSize(10),),
              Text("Phone Number: +91 123 345 678", style: textFieldStyleSize(10),),
              Text("Traditional shop ran by the L'Annunciata Family for over 17 decades, its known for their top quality and good service, you can visit us at our operating ours, for any help please call our phone number. Good Day", style: textFieldStyleSizeColor(16, Colors.black),softWrap: true,)
            ],
          ),
        ),
      ),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(30),
                  ),
                  child: Image(
                      height: (MediaQuery.of(context).size.height) / 4 + 50,
                      width: MediaQuery.of(context).size.width,
                      fit: BoxFit.cover,
                      image: NetworkImage(widget.store.imageUrl)),
                ),
                Positioned(
                  bottom: 0,
                  child:
                  Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.black.withOpacity((1)),
                        ],
                      ),
                      borderRadius: BorderRadius.vertical(
                        bottom: Radius.circular(30),
                      ),
                    ),
                    padding: EdgeInsets.only(right: 15, left: 15, bottom: 5, top: 5),

                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          widget.store.storeName,
                          style: TextStyle(
                            fontSize: 23,
                            color: white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        Container(
                          child: IconButton(icon: Icon(Icons.info_outline, color: white,), onPressed: () { showAlertDialog(context); },
                          ),
                        ),
                      ],
                    ),
                  ),
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
                          icon:
                              (/*widget.store.isFavorite ? Icon(Icons.favorite) :*/ Icon(
                                  Icons.favorite_border)),
                          onPressed: () {
                            print("added to favaoirtes");
                            //blocFavorites.addToFavorites(widget.store);
                          }),
                    ],
                  ),
                ),
              ],
            ),

            Padding(
              padding:
              const EdgeInsets.only(left: 20.0, right:20, top: 30, bottom: 20),
              child: TextField(
                controller: searchTEC,
                onChanged: (text) {
                  print(searchTEC.text);
                  // setState(() {
                  //   storesProvider.getStoresByNameCat(
                  //       widget.storeCatName, searchTEC.text);
                  //   searchStoreResults = storesProvider.storesByNameCat;
                  //   searchStoreResults.forEach((element) {
                  //     print(element.storeName);
                  //   });
                  // });
                },
                decoration: InputDecoration(
                  fillColor: Colors.grey[50],
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(width: 0.8),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(
                        width: 0.8, color: Theme.of(context).primaryColor),
                  ),
                  hintText: "Search For Stores",
                  prefixIcon: Icon(Icons.search, size: 30),
                  suffixIcon: IconButton(
                    icon: Icon(Icons.cancel),
                    onPressed: () {
                      setState(() {
                        searchTEC = TextEditingController();
                      });
                    },
                  ),
                ),
              ),
            ),

            ProductGrid(store: widget.store,)
            /*Expanded(
              child: (store == null
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircularProgressIndicator(
                          backgroundColor: green,
                        ),
                      ],
                    )
                  : Container(
                      height: MediaQuery.of(context).size.height - 125,
                      child: Expanded(
                        child: ProductGrid(
                          store: store,
                        ),
                      ),
                    )),
            ),*/
          ],
        ),
      ),
      bottomNavigationBar: BottomBar(),
    );
  }
}


//
// class ProductScreen extends StatelessWidget {
//   final Store store;
//
//
//   ProductScreen({this.store});
//
//
//   showAlertDialog(BuildContext context) {
//
//     // set up the button
//     Widget okButton = FlatButton(
//       child: Text("OK"),
//       onPressed: () {
//         Navigator.pop(context);
//       },
//     );
//
//     // set up the AlertDialog
//     AlertDialog alert = AlertDialog(
//       title: Text("${store.storeName}"),
//       content: SingleChildScrollView(
//         child: Container(
//           height: MediaQuery.of(context).size.width/2,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text("Brand Name: ${store.brandName}", style: textFieldStyleSize(10),),
//               Text("Phone Number: +91 123 345 678", style: textFieldStyleSize(10),),
//               Text("Traditional shop ran by the L'Annunciata Family for over 17 decades, its known for their top quality and good service, you can visit us at our operating ours, for any help please call our phone number. Good Day", style: textFieldStyleSizeColor(16, Colors.black),softWrap: true,)
//             ],
//           ),
//         ),
//       ),
//       actions: [
//         okButton,
//       ],
//     );
//
//     // show the dialog
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return alert;
//       },
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             Stack(
//               children: <Widget>[
//                 ClipRRect(
//                   borderRadius: BorderRadius.vertical(
//                     bottom: Radius.circular(30),
//                   ),
//                   child: Image(
//                       height: (MediaQuery.of(context).size.height) / 4 + 50,
//                       width: MediaQuery.of(context).size.width,
//                       fit: BoxFit.cover,
//                       image: NetworkImage(store.imageUrl)),
//                 ),
//                 Positioned(
//                   bottom: 0,
//                   child:
//                   Container(
//                     width: MediaQuery.of(context).size.width,
//                     decoration: BoxDecoration(
//                       gradient: LinearGradient(
//                         begin: Alignment.topCenter,
//                         end: Alignment.bottomCenter,
//                         colors: [
//                           Colors.transparent,
//                           Colors.black.withOpacity((1)),
//                         ],
//                       ),
//                       borderRadius: BorderRadius.vertical(
//                         bottom: Radius.circular(30),
//                       ),
//                     ),
//                     padding: EdgeInsets.only(right: 15, left: 15, bottom: 5, top: 5),
//
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: <Widget>[
//                         Text(
//                           store.storeName,
//                           style: TextStyle(
//                             fontSize: 23,
//                             color: white,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//
//                         Container(
//                           child: IconButton(icon: Icon(Icons.info_outline, color: white,), onPressed: () { showAlertDialog(context); },
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 Padding(
//                   padding:
//                   const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: <Widget>[
//                       IconButton(
//                           iconSize: 30,
//                           color: green,
//                           icon: Icon(Icons.arrow_back_ios),
//                           onPressed: () => Navigator.pop(context)),
//                       IconButton(
//                           iconSize: 30,
//                           color: green,
//                           icon:
//                           (/*widget.store.isFavorite ? Icon(Icons.favorite) :*/ Icon(
//                               Icons.favorite_border)),
//                           onPressed: () {
//                             print("added to favaoirtes");
//                             //blocFavorites.addToFavorites(widget.store);
//                           }),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//
//             // Column(
//             //   crossAxisAlignment: CrossAxisAlignment.start,
//             //   children: <Widget>[
//             //     Padding(
//             //       padding:
//             //           const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
//             //       child: Row(
//             //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             //         children: <Widget>[
//             //           Text(
//             //             store.storeName,
//             //             style: TextStyle(
//             //               fontSize: 20,
//             //               fontWeight: FontWeight.bold,
//             //             ),
//             //           ),
//             //           Text(
//             //             "0.2 miles away",
//             //             style: TextStyle(
//             //               fontSize: 14,
//             //               fontWeight: FontWeight.w300,
//             //             ),
//             //           ),
//             //         ],
//             //       ),
//             //     ),
//             //     Padding(
//             //       padding: const EdgeInsets.symmetric(horizontal: 15),
//             //       child: RatingStars(store.rating),
//             //     ),
//             //     Padding(
//             //       padding:
//             //           const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
//             //       child: Text(
//             //         store.brandName,
//             //         style: TextStyle(
//             //           fontSize: 14,
//             //           fontWeight: FontWeight.w300,
//             //         ),
//             //       ),
//             //     ),
//             //     Padding(
//             //       padding:
//             //           const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
//             //       child: Row(
//             //         mainAxisAlignment: MainAxisAlignment.spaceAround,
//             //         children: <Widget>[
//             //           RaisedButton(
//             //             padding:
//             //                 EdgeInsets.symmetric(horizontal: 25, vertical: 10),
//             //             shape: RoundedRectangleBorder(
//             //                 borderRadius: BorderRadius.circular(15)),
//             //             onPressed: () {},
//             //             color: green,
//             //             child: Text(
//             //               "Reviews",
//             //               style: TextStyle(fontSize: 16, color: Colors.white),
//             //             ),
//             //           ),
//             //           RaisedButton(
//             //             onPressed: () {},
//             //             padding:
//             //                 EdgeInsets.symmetric(horizontal: 25, vertical: 10),
//             //             shape: RoundedRectangleBorder(
//             //               borderRadius: BorderRadius.circular(15),
//             //             ),
//             //             color: green,
//             //             child: Text(
//             //               "Contact",
//             //               style: TextStyle(fontSize: 16, color: Colors.white),
//             //             ),
//             //           ),
//             //         ],
//             //       ),
//             //     ),
//             //     SizedBox(
//             //       height: 10,
//             //     ),
//             //     Center(
//             //       child: Text(
//             //         "Menu",
//             //         style: TextStyle(
//             //           fontSize: 20,
//             //           fontWeight: FontWeight.w600,
//             //           letterSpacing: 1.2,
//             //         ),
//             //       ),
//             //     ),
//             //     SizedBox(
//             //       height: 10,
//             //     ),
//             //   ],
//             // ),
//             ProductGrid(store: store,)
//             /*Expanded(
//               child: (store == null
//                   ? Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         CircularProgressIndicator(
//                           backgroundColor: green,
//                         ),
//                       ],
//                     )
//                   : Container(
//                       height: MediaQuery.of(context).size.height - 125,
//                       child: Expanded(
//                         child: ProductGrid(
//                           store: store,
//                         ),
//                       ),
//                     )),
//             ),*/
//           ],
//         ),
//       ),
//       bottomNavigationBar: BottomBar(),
//     );
//   }
// }
