import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:saffron_trial_10/app_properties.dart';
import 'package:saffron_trial_10/widgets/bottom_appBar.dart';

class OrderConfirmation extends StatelessWidget {
  final String orderReference;
  OrderConfirmation(this.orderReference);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Container(
              margin: EdgeInsets.all(25),
              child: Stack(
                 overflow: Overflow.visible,
                alignment: Alignment.center,
                children: [
                  Positioned(left: -15,child: SpinKitPulse(color: green, size: 25,)),
                  Positioned(right: -15,child: SpinKitPulse(color: green, size: 25,)),
                  Positioned(top: -15,child: SpinKitPulse(color: green, size: 25,)),
                  Positioned(bottom: -15,child: SpinKitPulse(color: green, size: 25,)),
                  Container(
                    margin: EdgeInsets.all(15),
                    //child: Icon(Icons.check),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(200), color: red.withOpacity(0.4)),
                    width: MediaQuery.of(context).size.width / 1.5,
                    height: MediaQuery.of(context).size.width / 1.5,
                  ),

                  Container(
                    margin: EdgeInsets.all(25),
                    child: Icon(Icons.check,color: green, size: 45,),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(200), border: Border.all(color: green), color: lightgreen),
                    width: MediaQuery.of(context).size.width / 3,
                    height: MediaQuery.of(context).size.width / 3,
                  ),
                ],
              ),
            ),
            Container(
              child: Text(orderReference),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomBar(),
    );
  }
}
