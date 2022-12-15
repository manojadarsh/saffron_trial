
import 'package:saffron_trial_10/models/store.dart';
import 'package:http/http.dart' as http;

int s_length;

class storeServices {

  //static const String storeURL = 'http://shopfreshlii.a3jm.com:3000/v2/categories/?store_category_name';

  static Future<List<Store>> getStores(String storeCatName) async {
    final queryParameters = {
      "store_category_name": storeCatName,
    };
    try {
      //TODO this is the issue - must fix.
      final uri = Uri.http("shopfreshlii.a3jm.com:3000", '/v2/stores', queryParameters);
      final response = await http.get(uri);
      if (response.statusCode == 200) {
        final List<Store> stores = storeFromJson(response.body);
        print(response.body);
        print(stores);
        var length = stores.length;
        print("product lenght =" + length.toString());
        s_length = length;
        return stores;

      } else {
        print("error1");
        return List<Store>();
      }
    } catch (e) {
      print(e.toString());
      return List<Store>();
    }
  }
}
