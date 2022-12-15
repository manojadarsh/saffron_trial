import 'package:flutter/material.dart';

import '../app_properties.dart';

class PopTopAppBar extends StatelessWidget {
  final String message;
  PopTopAppBar({this.message});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height/6,

      decoration: BoxDecoration(
          color: white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
          borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(30)
          )
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(height: 15,),
          Positioned(
              left: 0,
              child: IconButton(
                icon: Icon(Icons.arrow_back, color: green,),
                onPressed: () {
                  Navigator.pop(context);
                },
              )),
          Text("$message", style: headingTextStyle(),),
        ],
      ),
    );
  }
}
