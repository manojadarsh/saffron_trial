import 'package:flutter/material.dart';
import 'package:saffron_trial_10/models/order_item.dart';
import 'package:saffron_trial_10/models/product.dart';
import 'package:saffron_trial_10/screens/products/productServices.dart';

class Order {
  Order({
    this.countOfStores,
    this.countOfItems,
    this.totalValueOfItems,
    this.totalDiscountValue,
    this.voucherCode,
    this.voucherAmount,
    this.orderedStores,
  });

  int countOfStores;
  int countOfItems;
  int totalValueOfItems;
  int totalDiscountValue;
  String voucherCode;
  int voucherAmount;
  List<OrderStore> orderedStores;
}

class OrderStore {
  OrderStore({
    this.storeId,
    this.totalItems,
    this.voucherCode,
    this.storeSpecialInstructions,
    this.bookingAlteredIndicator,
    this.bookingAlteredMessage,
    this.itemDetails,
  });

  int storeId;
  int totalItems;
  String voucherCode;
  String storeSpecialInstructions;
  int bookingAlteredIndicator;
  String bookingAlteredMessage;
  List<ItemDetail> itemDetails;
}

class ItemDetail {
  ItemDetail({
    this.productId,
    this.productName,
    this.productDescription,
    this.odPrice,
    this.odDiscount,
    this.odQuantity,
  });

  int productId;
  String productName;
  String productDescription;
  double odPrice;
  int odDiscount;
  int odQuantity;
}

class Cart with ChangeNotifier {
  Map<int, List<ItemDetail>> _orders = {};

  Map<int, List<ItemDetail>> get orders {
    return _orders;
  }

  void addItem(Product product) {
    // ItemDetail itemDetail = ;

    /* OrderStore orderStore = OrderStore(storeId: product.storeId);
    print(orderStore.storeId);
    print(itemDetail.productName);*/
    if (_orders.containsKey(product.storeId)) {
      for (int i = 0; i < _orders[product.storeId].length; i++) {
        if (_orders[product.storeId][i].productId == product.productId) {
          print("matching products____________");
          _orders[product.storeId][i].odQuantity =
              _orders[product.storeId][i].odQuantity + 1;
          print("quantity: ${_orders[product.storeId][i].odQuantity}");
        } else {
          print("same store different product");
          _orders[product.storeId].add(ItemDetail(
              productId: product.productId,
              productName: product.productName,
              odPrice: product.price,
              odQuantity: 1,
              productDescription: product.productDescription,
              odDiscount: 1));
          //print(_orders);
        }
        //print(i);
      }
      //print(_orders.keys);
      //_orders[product.storeId].forEach((element) {print(element.productName);});
      //print(_orders[product.storeId]);
      // print(_orders.keys.first.storeId);
      print("contains stores ____________");
      /*if (_orders[orderStore].contains(itemDetail)) {
        print("contains product");
        print(_orders[orderStore].toString());78
      }*/
    } else {
      print("doesn't contain stores __________");
      List<ItemDetail> desiredItems = [];
      desiredItems.add(ItemDetail(
          productId: product.productId,
          productName: product.productName,
          odPrice: product.price,
          odQuantity: 1,
          productDescription: product.productDescription,
          odDiscount: 1));
      _orders.putIfAbsent(product.storeId, () => desiredItems);
      print(_orders.length);
      _orders.forEach((k, v) => print('${k}: ${v.single.productName}'));
      _orders[product.storeId].forEach((element) {
        print(element.odPrice);
      });
    }
    print(_orders);
    notifyListeners();
  }

  double subTotal() {
    double subTotal = 0;
    _orders.forEach((key, value) {
      _orders[key].forEach((element) {
        subTotal += element.odQuantity * element.odPrice;
      });
    });
    return subTotal;
  }

  void removeFromCart(int storeID, int prodID) {
    _orders[storeID].removeAt(prodID);
    notifyListeners();
  }

  int subQuantity() {
    int subQuantity = 0;
    _orders.forEach((key, value) {
      _orders[key].forEach((element) {
        subQuantity += element.odQuantity;
      });
    });
    return subQuantity;
  }

  void clearCart() {
    _orders = {};
    notifyListeners();
  }

  String storeTotal(int storeId) {
    double total = 0;
    _orders[storeId].forEach((element) {
      total += element.odPrice * element.odQuantity;
    });

    //_orders.forEach((key, cartItem) { total += cartItem.price * cartItem.quantity;});
    return total.toStringAsFixed(2);
  }

  int storeQuantity(int storeId) {
    int quantity = 0; //_orders[storeId].length;
    _orders[storeId].forEach((element) {
      quantity += element.odQuantity;
    });
    return quantity;
  }
}

class Carts with ChangeNotifier {
  //for one item
  Map<String, dynamic> _item = {};

  //for  all the stores oder items
  List<Map<String, dynamic>> stores = [];
  Map<String, dynamic> mapStoreOrder(OrderStore orderStore) {
    Map<String, dynamic> selStore = {
      'storeId': orderStore.storeId,
    };
    return selStore;
  }

  //for list of items
  List<Map<String, dynamic>> _itemsDetailed = [];
  //for mapping each item
  Map<String, dynamic> mapSelectedProduct(ItemDetail itemDetail) {
    Map<String, dynamic> selProd = {
      'productId': itemDetail.productId,
      'productName': itemDetail.productName,
      'productDescription': itemDetail.productDescription,
      'odPrice': itemDetail.odPrice,
      'odDiscount': itemDetail.odDiscount,
      'odQuantity': itemDetail.odQuantity
    };
    return selProd;
  }

  Map<String, dynamic> get orders {
    return _item;
  }

  void addItem(Product product) {
    ItemDetail item = ItemDetail(
        productId: product.productId,
        productName: product.productName,
        odPrice: product.price,
        odQuantity: 1,
        productDescription: product.productDescription,
        odDiscount: 1);
    //print("cool");
    if (stores.isEmpty) {
      print('empty');
      OrderStore newStore = OrderStore(storeId: product.storeId);
      var newMapStore = mapStoreOrder(newStore);
      print(newMapStore);
      if (newMapStore.containsKey('itemDetails')) {
        print('contains key');
      } else {
        print('doesnnt contain key');
        var mapItem = mapSelectedProduct(item);
        List mapItemList = [];
        mapItemList.add(mapItem);
        newMapStore.putIfAbsent('itemDetails', () => mapItemList);
        stores.add(newMapStore);
        //print(newMapStore);
        print(stores);
      }
    }
    notifyListeners();
  }

  /*void addItem(Product product) {
    //creating store map first
    OrderStore orderStore = OrderStore(storeId: product.storeId);
    _storeOrder.putIfAbsent('storeId', () => orderStore.storeId);
    _storeOrder.putIfAbsent('itemDetails', () => null);
    print(orderStore.storeId);

    //creating item first
    ItemDetail itemDetail = ItemDetail(productName: product.productName, productDescription: product.productDescription, odQuantity: 1, odPrice: product.price, productId: product.id);
    print(itemDetail.productName);

    if (_item.containsKey(product.storeId)) {
      for(int i = 0; i < _item[product.storeId].length; i++){
        if(_item[product.storeId][i].productId == product.productId){
          print("matching products____________");
          _item[product.storeId][i].odQuantity = _item[product.storeId][i].odQuantity + 1;
          print("quantity: ${_item[product.storeId][i].odQuantity}");
        } else {
          print("same store different product");
          _item[product.storeId].add(ItemDetail(
              productId: product.productId,
              productName: product.productName,
              odPrice: product.price,
              odQuantity: 1,
              productDescription: product.productDescription,
              odDiscount: 1));
          //print(_orders);
        }
        //print(i);
      }
      //print(_orders.keys);
      //_orders[product.storeId].forEach((element) {print(element.productName);});
      //print(_orders[product.storeId]);
      // print(_orders.keys.first.storeId);
      print("contains stores ____________");
      */ /*if (_orders[orderStore].contains(itemDetail)) {
        print("contains product");
        print(_orders[orderStore].toString());78
      }*/ /*
    } else {
      print("doesn't contain stores __________");
      List<ItemDetail> desiredItems = [];
      desiredItems.add(ItemDetail(
          productId: product.productId,
          productName: product.productName,
          odPrice: product.price,
          odQuantity: 1,
          productDescription: product.productDescription,
          odDiscount: 1));
     // _item.putIfAbsent(product.storeId, () => desiredItems);
      print(_item.length);
      _item.forEach((k,v) => print('${k}: ${v.single.productName}'));
      _item[product.storeId].forEach((element) {print(element.odPrice);});
    }
    print(_item);
    notifyListeners();
  }*/

  double subTotal() {
    double subTotal = 0;
    _item.forEach((key, value) {
      _item[key].forEach((element) {
        subTotal += element.odQuantity * element.odPrice;
      });
    });
    return subTotal;
  }

  void removeFromCart(int storeID, int prodID) {
    _item[storeID].removeAt(prodID);
    notifyListeners();
  }

  int subQuantity() {
    int subQuantity = 0;
    _item.forEach((key, value) {
      _item[key].forEach((element) {
        subQuantity += element.odQuantity;
      });
    });
    return subQuantity;
  }

  void clearCart() {
    _item = {};
    notifyListeners();
  }

  String storeTotal(int storeId) {
    double total = 0;
    _item[storeId].forEach((element) {
      total += element.odPrice * element.odQuantity;
    });

    //_orders.forEach((key, cartItem) { total += cartItem.price * cartItem.quantity;});
    return total.toStringAsFixed(2);
  }

  int storeQuantity(int storeId) {
    int quantity = 0; //_orders[storeId].length;
    _item[storeId].forEach((element) {
      quantity += element.odQuantity;
    });
    return quantity;
  }
}

/*

class Cart with ChangeNotifier {
  Map<int, OrderList> _items = {};

  Map<int, OrderList> get items{
    return _items;
  }

  void addItem(int storeID, int productID, Product product) {
    if (_items.containsKey(productID) && _items.containsKey(storeID)) {
      _items.update(
          productID,
              (existingItem) => OrderList(
              storeId: existingItem.storeId,
              id: DateTime.now().toString(),
              product: product,
              quantity: existingItem.quantity + 1));
    } else {
      _items.putIfAbsent(productID, () => OrderItem(storeId: product.storeId, id: DateTime.now().toString(), product: product, quantity: 1));
    }
    notifyListeners();
  }
}
*/
