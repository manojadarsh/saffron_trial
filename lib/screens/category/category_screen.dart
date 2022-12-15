import 'package:flutter/material.dart';
import 'package:saffron_trial_10/models/user.dart';
import 'package:saffron_trial_10/providers/userProvider.dart';
import 'package:saffron_trial_10/screens/category/category_grid.dart';
import 'package:saffron_trial_10/widgets/bottom_appBar.dart';
import 'package:provider/provider.dart';
import 'package:saffron_trial_10/widgets/top_appBar.dart';

import '../../app_properties.dart';

class CategoryScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final userProvider = Provider.of<UserProvider>(context);
    userProvider.getUser();
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TopAppBar(message: "Select Category",),
            // Container(
            //   width: MediaQuery.of(context).size.width,
            //   height: MediaQuery.of(context).size.height/6,
            //
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
            //       Text("Select Category", style: headingTextStyle(),),
            //     ],
            //   ),
            // ),
            Container(
                height:MediaQuery.of(context).size.height - MediaQuery.of(context).size.height/6 - 75,child: CategoryGrid()),
          ],
        ),
      ),
      bottomNavigationBar: BottomBar(),
    );
  }
}
