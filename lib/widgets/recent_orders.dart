/*
import 'package:flutter/material.dart';
import 'package:freshlii_trial3/models/product.dart';



class RecentOrders extends StatelessWidget {
  _buildRecentOrder(BuildContext context, Product product) {
    return Container(
      margin: EdgeInsets.all(10),
      width: 335,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(width: 1, color: Colors.grey[50])),
      child: Expanded(
        child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween ,
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image(
              height: 100.0,
              width: 100.0,
              fit: BoxFit.cover,
              image: NetworkImage(product.imageUrl),
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    "${product.productName}",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text("${product.storeName}",
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                      overflow: TextOverflow.ellipsis),
                  Text("\$${product.price}",
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                      overflow: TextOverflow.ellipsis),
                ],
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(30)),
                child: IconButton(
                    icon: Icon(
                      Icons.add,
                      size: 30,
                      color: Colors.white,
                    ),
                    onPressed: () {}),
                margin: EdgeInsets.only(right: 20),
              ),
            ],
          )
        ],
      ),)
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Text(
            "Recent Orders",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
          ),
        ),
        Container(
          height: 120,
          padding: EdgeInsets.only(left: 10),
          child: ListView.builder(
            physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: currentUser.orders.length,
              itemBuilder: (BuildContext context, int index) {
                Order order = currentUser.orders[index];
                return _buildRecentOrder(context, order);
              }),
        ),
      ],
    );
  }
}
*/
