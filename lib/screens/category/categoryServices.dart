import 'package:saffron_trial_10/models/category.dart';
import 'package:http/http.dart' as http;

int c_length;


class categoryServices {
  static List<Category> categoryListHTTP = [];
  static const String categoryURL = 'http://shopfreshlii.a3jm.com:3000/v2/categories/';

  static Future<List<Category>> getCategories() async {
    try {

      final response = await http.get(categoryURL);
      if (response.statusCode == 200) {
        final List<Category> categories = categoryFromJson(response.body);
        var length = categories.length;
        c_length = length;
        categoryListHTTP = categories;
        return categoryListHTTP;

      } else {
        return List<Category>();
      }
    } catch (e) {
      return List<Category>();
    }
  }
}
