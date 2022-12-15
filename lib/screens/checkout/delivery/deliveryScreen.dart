import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:saffron_trial_10/app_properties.dart';
import 'package:saffron_trial_10/models/cart.dart';
import 'package:saffron_trial_10/models/dateslot.dart';
import 'package:saffron_trial_10/providers/dateSlotProvider.dart';

class DeliveryScreen extends StatefulWidget {
  final Cart cart;
  DeliveryScreen({this.cart});
  @override
  _DeliveryScreenState createState() => _DeliveryScreenState();
}

class _DeliveryScreenState extends State<DeliveryScreen> {
  @override
  void initState() {
    super.initState();
    final dateSlotProvider =
        Provider.of<DateSlotsProvider>(context, listen: false);
    dateSlotProvider.getSlots(widget.cart.results.cartsData.userId, 1);
    print("init: ${dateSlotProvider.dateSlots.message}");
  }

  @override
  Widget build(BuildContext context) {
    int selectedIndex;

    final dateSlotsProvider = Provider.of<DateSlotsProvider>(context, listen: true);
    final slotsProvider = Provider.of<SlotProvider>(context, listen: false);
    var slots = dateSlotsProvider.dateSlots.data.response;

    //print("dataeslot : ${paymentIntent.dateSlots.message}");
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.all(20),
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.symmetric(vertical: 15),
              child: Text(
                "Select Delivery Speed",
                style: textFieldStyleSize(20),
              ), //Text("Hi"),,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: MediaQuery.of(context).size.width / 3,
                  width: MediaQuery.of(context).size.width / 3,
                  decoration: BoxDecoration(
                      color: lightgreen,
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      //Text("Hi"),
                      Icon(
                        Icons.delivery_dining,
                        size: 55,
                        color: green,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "Normal",
                            style: textFieldStyle(),
                          ),
                          Text(
                            "\$4.99",
                            style: textFieldStyle(),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Switch(value: false, onChanged: null),
                Container(
                  height: MediaQuery.of(context).size.width / 3,
                  width: MediaQuery.of(context).size.width / 3,
                  decoration: BoxDecoration(
                      color: lightgreen,
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      //Text("Hi"),
                      Icon(
                        Icons.delivery_dining,
                        size: 65,
                        color: green,
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "Speedy",
                            style: textFieldStyle(),
                          ),
                          Text(
                            "\$8.99",
                            style: textFieldStyle(),
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),

            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.symmetric(vertical: 15),
              child: Text(
                "Select Date",
                style: textFieldStyleSize(20),
              ), //Text("Hi"),,
            ),
            Container(
              margin: EdgeInsets.all(15),
              height: MediaQuery.of(context).size.width/4,
              //width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                  itemCount: slots.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    var slot = slots[index];
                    print(slot.date);
                    return InkWell(
                      onTap: () {
                        print("hi");
                        setState(() {
                          slotsProvider.setSlot(slot);
                        });

                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        margin: EdgeInsets.symmetric(horizontal: 5),
                        decoration: BoxDecoration(
                          color: slotsProvider.slot == slot ? green :lightgreen,
                          border: slotsProvider.slot == slot ? Border.all(color: green,  width: 2) : null,
                          borderRadius: BorderRadius.only(topRight: Radius.circular(10),bottomLeft: Radius.circular(10) ),
                        ),
                        child: Column(
                          children: [
                            Text("${slot.date} ${slot.month}"),
                            Text(" ${slot.availableSlots} - (${slot.totalSlots})")
                          ],
                        ),
                      ),
                    );
                  }),
            ),
            // Row(
            //   children: [
            //     Card(
            //       margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            //       color: lightgreen,
            //       shape: RoundedRectangleBorder(
            //         borderRadius: BorderRadius.circular(5),
            //       ),
            //       child: Container(
            //           padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),child: Text("03 Sep", style: textFieldStyle(),)),
            //     ),
            //     Card(
            //       margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            //       color: lightgreen,
            //       shape: RoundedRectangleBorder(
            //         borderRadius: BorderRadius.circular(5),
            //       ),
            //       child: Container(
            //           padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),child: Text("04 Sep", style: textFieldStyle(),)),
            //     ),
            //     Card(
            //       margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            //       color: lightgreen,
            //       shape: RoundedRectangleBorder(
            //         borderRadius: BorderRadius.circular(5),
            //       ),
            //       child: Container(
            //           padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),child: Text("05 Sep", style: textFieldStyle(),)),
            //     ),
            //   ],
            // )
          ],
        ),
      ),
    );
  }
}

class DeliveryScreen1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      height: MediaQuery.of(context).size.height,
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.symmetric(vertical: 15),
            child: Text(
              "Select Delivery Speed",
              style: textFieldStyleSize(20),
            ), //Text("Hi"),,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: MediaQuery.of(context).size.width / 3,
                width: MediaQuery.of(context).size.width / 3,
                decoration: BoxDecoration(
                    color: lightgreen, borderRadius: BorderRadius.circular(10)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    //Text("Hi"),
                    Icon(
                      Icons.delivery_dining,
                      size: 55,
                      color: green,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "Normal",
                          style: textFieldStyle(),
                        ),
                        Text(
                          "\$4.99",
                          style: textFieldStyle(),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Switch(value: false, onChanged: null),
              Container(
                height: MediaQuery.of(context).size.width / 3,
                width: MediaQuery.of(context).size.width / 3,
                decoration: BoxDecoration(
                    color: lightgreen, borderRadius: BorderRadius.circular(10)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    //Text("Hi"),
                    Icon(
                      Icons.delivery_dining,
                      size: 65,
                      color: green,
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "Speedy",
                          style: textFieldStyle(),
                        ),
                        Text(
                          "\$8.99",
                          style: textFieldStyle(),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
          Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.symmetric(vertical: 15),
            child: Text(
              "Select Date",
              style: textFieldStyleSize(20),
            ), //Text("Hi"),,
          ),
          Row(
            children: [
              Card(
                margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                color: lightgreen,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Container(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    child: Text(
                      "03 Sep",
                      style: textFieldStyle(),
                    )),
              ),
              Card(
                margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                color: lightgreen,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Container(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    child: Text(
                      "04 Sep",
                      style: textFieldStyle(),
                    )),
              ),
              Card(
                margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                color: lightgreen,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Container(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    child: Text(
                      "05 Sep",
                      style: textFieldStyle(),
                    )),
              ),
            ],
          )
        ],
      ),
    );
  }
}
