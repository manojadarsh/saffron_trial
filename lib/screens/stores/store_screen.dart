import 'package:flutter/material.dart';
import 'package:saffron_trial_10/models/category.dart';
import 'package:saffron_trial_10/models/store.dart';
import 'package:saffron_trial_10/providers/stores.dart';
import 'package:saffron_trial_10/screens/stores/search/searchStoreCat_screen.dart';
import 'package:saffron_trial_10/screens/stores/store_grid.dart';
import 'package:saffron_trial_10/screens/stores/store_list.dart';
import 'package:saffron_trial_10/widgets/bottom_appBar.dart';
import 'package:provider/provider.dart';
import 'package:saffron_trial_10/widgets/top_appBar.dart';

import '../../app_properties.dart';

class StoreScreen extends StatefulWidget {
  final Category category;
  StoreScreen({this.category});

  @override
  _StoreScreenState createState() => _StoreScreenState();
}

class _StoreScreenState extends State<StoreScreen> {

  @override
  void initState() {
    super.initState();
    final storesProvider = Provider.of<Stores>(
        context, listen: false
    );
    var storePro = storesProvider;
    print(storePro.numberOfStores);
  }



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
                children: [
                  TopAppBar(message: "${widget.category.storeCategoryName} Stores",),
                  // Container(
                  //   width: MediaQuery.of(context).size.width,
                  //   height: MediaQuery.of(context).size.height/6,
                  //   decoration: BoxDecoration(
                  //       color: white,
                  //       boxShadow: [
                  //         BoxShadow(
                  //           color: Colors.grey.withOpacity(0.5),
                  //           spreadRadius: 2,
                  //           blurRadius: 7,
                  //           offset: Offset(0, 3), // changes position of shadow
                  //         ),
                  //       ],
                  //       borderRadius: BorderRadius.vertical(
                  //           bottom: Radius.circular(30)
                  //       )
                  //   ),
                  //   child: Column(
                  //     mainAxisAlignment: MainAxisAlignment.center,
                  //     crossAxisAlignment: CrossAxisAlignment.center,
                  //     children: [
                  //       SizedBox(height: 15,),
                  //       Text("Select Store", style: headingTextStyle(),),
                  //     ],
                  //   ),
                  // ),
                  //Search Bar
                  // Padding(
                  //   padding: const EdgeInsets.all(20.0),
                  //   child: TextField(
                  //     decoration: InputDecoration(
                  //       fillColor: Colors.grey[50],
                  //       filled: true,
                  //       border: OutlineInputBorder(
                  //         borderRadius: BorderRadius.circular(30),
                  //         borderSide: BorderSide(width: 0.8),
                  //       ),
                  //       enabledBorder: OutlineInputBorder(
                  //         borderRadius: BorderRadius.circular(30),
                  //         borderSide: BorderSide(
                  //             width: 0.8, color: Theme.of(context).primaryColor),
                  //       ),
                  //       hintText: "Search For Stores",
                  //       prefixIcon: Icon(Icons.search, size: 30),
                  //       suffixIcon: Icon(Icons.cancel, size: 30),
                  //     ),
                  //   ),
                  // ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    alignment: Alignment.centerRight,
                    child: IconButton(icon: Icon(Icons.search, color: green, size: 30,), onPressed: () {
                      changeScreenPush(context, SearchStoreCatScreen(storeCatName: widget.category.storeCategoryName,));
                    }),
                  ),
                  StoreGrid(category: widget.category,),

                ],
              ),
      ),
      bottomNavigationBar: BottomBar(),
    );
  }
}
