import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:saffron_trial_10/app_properties.dart';
import 'package:saffron_trial_10/models/store.dart';
import 'package:saffron_trial_10/providers/stores.dart';
import 'package:saffron_trial_10/screens/products/product_screen.dart';
import 'package:saffron_trial_10/widgets/rating_stars.dart';

class SearchStoreCatScreen extends StatefulWidget {
  final String storeCatName;
  SearchStoreCatScreen({this.storeCatName});
  @override
  _SearchStoreCatScreenState createState() => _SearchStoreCatScreenState();
}

class _SearchStoreCatScreenState extends State<SearchStoreCatScreen> {
  String searchField;

  TextEditingController searchTEC = TextEditingController();

  @override
  void initState() {
    super.initState();
    final storesProvider = Provider.of<Stores>(context, listen: false);
    storesProvider.getStoresByNameCat(widget.storeCatName, searchTEC.text);
    //var storesearch = storesProvider.storesByNameCat;
    //print(storesearch);
    //print(storePro.numberOfStores);
  }

  List<Store> searchStoreResults = [];

  @override
  Widget build(BuildContext context) {
    double imageDimension = MediaQuery.of(context).size.width/7;
    final storesProvider = Provider.of<Stores>(context, listen: true);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.only(left: 20.0, right:20, top: 30),
              child: TextField(
                controller: searchTEC,
                onChanged: (text) {
                  print(searchTEC.text);
                  setState(() {
                    searchField = text;
                    storesProvider.getStoresByNameCat(
                        widget.storeCatName, searchTEC.text);
                    searchStoreResults = storesProvider.storesByNameCat;
                    searchStoreResults.forEach((element) {
                      print(element.storeName);
                    });
                  });
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
            // Container(
            //   child: Text("${searchTEC.text}"),
            // ),
            Container(
              height: MediaQuery.of(context).size.height - 150,
              child: searchStoreResults == null
                  ? Text("No Results")
                  : ListView.builder(
                      itemCount: searchStoreResults.length,
                      itemBuilder: (context, index) {
                        Store store = searchStoreResults[index];
                        return Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                          child: ListTile(
                            onTap: () {
                              changeScreenPush(context, ProductScreen(store: store,));
                            },
                            leading:
                            ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image(image: NetworkImage(store.imageUrl),width:imageDimension, height: imageDimension,fit: BoxFit.cover,)),
                            title: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  store.storeName,
                                  style: textFieldStyleSizeColor(15, green),
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(vertical: 20),
                                  height: 15, width: 15, decoration: BoxDecoration(
                                    color: store.storeActive == 1? green : red,
                                    borderRadius: BorderRadius.circular(15)
                                ),),
                                RatingStars(store.rating),
                              ],
                            ),
                          ),
                        );
                      }),
            )
          ],
        ),
      ),
    );
  }
}
