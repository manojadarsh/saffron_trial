import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:saffron_trial_10/providers/Checkout/addressProvider.dart';
import '../../../app_properties.dart';
import 'place_service.dart';
import 'address_search.dart';
import 'package:uuid/uuid.dart';

import 'package:uuid/uuid.dart';

class AddressScreen extends StatefulWidget {
  AddressScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _AddressScreenState createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  final _controller = TextEditingController();
  String _streetNumber = '';
  String _street = '';
  String _city = '';
  String _zipCode = '';

  // @override
  // void dispose() {
  //   _controller.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    final addPro = Provider.of<AddressProvider>(context, listen: false);
    return Container(
      height: MediaQuery.of(context).size.height,
      margin: EdgeInsets.only(left: 20, right: 20),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextField(
              controller: _controller,
              readOnly: true,
              onTap: () async {
                // generate a new token here
                final sessionToken = Uuid().v4();
                final Suggestion result = await showSearch(
                  context: context,
                  delegate: AddressSearch(sessionToken),
                );
                // This will change the text displayed in the TextField
                if (result != null) {
                  final placeDetails = await PlaceApiProvider(sessionToken)
                      .getPlaceDetailFromId(result.placeId);
                  setState(() {
                    _controller.text = result.description;
                    _streetNumber = placeDetails.streetNumber;
                    _street = placeDetails.street;
                    _city = placeDetails.city;
                    _zipCode = placeDetails.zipCode;
                    addPro.setStreetNumber(_streetNumber);
                    addPro.setStreetName(_street);
                    addPro.setCityName(_city);
                    addPro.setZIPCode(_zipCode);
                    addPro.getCityName();

                  });
                }
              },
              decoration: InputDecoration(
                icon: Container(
                  width: 10,
                  height: 10,
                  child: Icon(
                    Icons.home,
                    color: Colors.black,
                  ),
                ),
                hintText: "Enter your shipping address",
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(left: 8.0, top: 16.0),
              ),
            ),
            SizedBox(height: 20.0),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4)
              ),

              margin: EdgeInsets.symmetric(vertical: 5),
              color: lightgreen,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                child: Row(
                  children: [
                    Text('Street Number: ', style: textFieldStyle(),),
                    Text('$_streetNumber', style: textFieldStyleSizeColor(15, grey)),
                  ],
                ),
              ),
            ),
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4)
              ),
              margin: EdgeInsets.symmetric(vertical: 5),
              color: lightgreen,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                child: Row(
                  children: [
                    Text('Street: ', style: textFieldStyle()),
                    Text('$_street', style: textFieldStyleSizeColor(15, grey)),
                  ],
                ),
              ),
            ),
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4)
              ),
              margin: EdgeInsets.symmetric(vertical: 5),
              color: lightgreen,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                child: Row(
                  children: [
                    Text('City: ', style: textFieldStyle()),
                    Text('$_city', style: textFieldStyleSizeColor(15, grey)),
                  ],
                ),
              ),
            ),
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4)
              ),
              margin: EdgeInsets.symmetric(vertical: 5),
              color: lightgreen,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                child: Row(
                  children: [
                    Text('ZIP Code: ', style: textFieldStyle()),
                    Text('$_zipCode', style: textFieldStyleSizeColor(15, grey)),
                  ],
                ),
              ),
            ),
            TextField(
              keyboardType: TextInputType.multiline,
              minLines: 1,
              maxLines: 5,

              decoration: InputDecoration(hintText: "Delivery Instructions", fillColor: lightgreen, filled: true),
            ),
            // Text('Street Number: $_streetNumber'),
            // Text('Street: $_street'),
            // Text('City: $_city'),
            // Text('ZIP Code: $_zipCode'),
          ],
        ),
      ),
    );
  }
}
