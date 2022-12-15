import 'package:saffron_trial_10/models/product.dart';
import 'package:saffron_trial_10/models/store.dart';

class OrderItem{
  final int productId;
  final String productName;
  final double odPrice;
  final int odDiscount;
  final int odQuantity;

  OrderItem({
    this.productId,
    this.productName,
    this.odPrice,
    this.odDiscount,
    this.odQuantity,
  });
}

class OrderList{
  final int storeID;
  final List<OrderItem> orders;

  OrderList({this.storeID, this.orders});
}