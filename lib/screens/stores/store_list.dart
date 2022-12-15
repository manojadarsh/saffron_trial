// import 'package:flutter/material.dart';
// import 'package:saffron_trial_10/models/category.dart';
// import 'package:saffron_trial_10/models/store.dart';
// import 'package:saffron_trial_10/providers/stores.dart';
// import 'package:saffron_trial_10/screens/stores/storeDetails.dart';
// import 'package:saffron_trial_10/screens/stores/store_item.dart';
// import 'package:saffron_trial_10/widgets/rating_stars.dart';
// import 'package:provider/provider.dart';
//
// import '../../app_properties.dart';
//
// class StoreList extends StatefulWidget {
//   final Category category;
//   StoreList({this.category});
//
//   @override
//   _StoreListState createState() => _StoreListState();
// }
//
// class _StoreListState extends State<StoreList> {
//
//  Stores storePro;
//   @override
//   void initState() {
//     super.initState();
//     final storesProvider = Provider.of<Stores>(
//         context, listen: false
//     );
//     storesProvider.stores(widget.category.storeCategoryName);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     //print(categoryName);
//
//
//     final storesProvider = Provider.of<Stores>(
//         context, listen: true
//     );
//
//     //storesProvider.getStores(categoryName);
//
//     //final providerStoreList = storesProvider.stores(widget.category.storeCategoryName);
//     final providerStoreList = storesProvider.storeNoParam;
//
//
//     print("${providerStoreList.length}");
//     //check this part
//     return Container(
//       height: MediaQuery.of(context).size.height*3/5,
//        padding: EdgeInsets.only(bottom: 20),
//         child: ListView.builder(
//             itemCount: providerStoreList.length,
//             itemBuilder: (context, index) => ChangeNotifierProvider.value(
//                   value: providerStoreList[index],
//                   child: StoreItem(),
//                 )));
//     /* print("storescreen = $providerStoreList");
//       List<Widget> storeList = [];
//       stores.forEach((Store store) {
//         print("${store.isFavorite}");
//         storeList.add(GestureDetector(
//           onTap: () => Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (_) => StoreDetails(store: store),
//               )),
//           child: Container(
//             margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//             decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(15),
//                 border: Border.all(color: Colors.grey[200], width: 1.0)),
//             child: Row(
//               children: <Widget>[
//                 ClipRRect(
//                   borderRadius: BorderRadius.circular(15),
//                   child: Image(
//                       height: (MediaQuery.of(context).size.width-125)/2,
//                       width: (MediaQuery.of(context).size.width-125)/2,
//                       fit: BoxFit.cover,
//                       image: NetworkImage(store.imageUrl)),
//
//                 ),
//                 Container(
//                   margin: EdgeInsets.all(12),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: [
//                       Container(
//                         width: (MediaQuery.of(context).size.width-110)/2,
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                           children: <Widget>[
//                             Text(store.storeName,
//                                 style: TextStyle(
//                                   fontSize: 20,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                                 overflow: TextOverflow.ellipsis),
//                             RatingStars(store.rating),
//                             Text(store.storeActive.toString(),
//                                 style: TextStyle(
//                                   fontSize: 14,
//                                   fontWeight: FontWeight.w600,
//                                 ),
//                                 overflow: TextOverflow.ellipsis),
//                             Text(
//                               "0.2 miles away",
//                               style: TextStyle(
//                                 fontSize: 14,
//                                 fontWeight: FontWeight.w600,
//                               ),
//                               overflow: TextOverflow.ellipsis,
//                             ),
//                           ],
//                         ),
//                       ),
//                       Container(
//                         child: IconButton(
//                           color: green,
//                           icon: (store.isFavorite ? Icon(Icons.favorite) : Icon(Icons.favorite_border)),
//                           onPressed: () {
//                             */ /*setState(() {
//                               store.isFavorite = !store.isFavorite;
//                             });
//                             isInFavorite(store);*/ /*
//                           },
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//
//               ],
//             ),
//           ),
//         ));
//       });
//       return Column(
//         children: storeList,
//       );
// */
//
//     /*return Expanded(
//       child: Column(
//         children: [
//           ListView.builder(
//             itemBuilder: (context, index) {
//               Store store = stores[index];
//               return Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   Container(
//                     width: (MediaQuery.of(context).size.width - 110) / 2,
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       children: <Widget>[
//                         Text(store.storeName,
//                             style: TextStyle(
//                               fontSize: 20,
//                               fontWeight: FontWeight.bold,
//                             ),
//                             overflow: TextOverflow.ellipsis),
//                         RatingStars(store.rating),
//                         Text(store.storeActive.toString(),
//                             style: TextStyle(
//                               fontSize: 14,
//                               fontWeight: FontWeight.w600,
//                             ),
//                             overflow: TextOverflow.ellipsis),
//                         Text(
//                           "0.2 miles away",
//                           style: TextStyle(
//                             fontSize: 14,
//                             fontWeight: FontWeight.w600,
//                           ),
//                           overflow: TextOverflow.ellipsis,
//                         ),
//                       ],
//                     ),
//                   ),
//                   */ /* Container(
//                       child: IconButton(
//                         color: green,
//                         icon: (store.isFavorite ? Icon(Icons.favorite) : Icon(Icons.favorite_border)),
//                         onPressed: () {
//                           setState(() {
//                             store.isFavorite = !store.isFavorite;
//                           });
//                           isInFavorite(store);
//                         },
//                       ),
//                     ),*/ /*
//                 ],
//               );
//             },
//             itemCount: stores.length,
//           )
//         ],
//       ),
//     );*/
//   }
// }
