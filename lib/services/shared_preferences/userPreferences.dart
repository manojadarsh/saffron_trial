import 'package:saffron_trial_10/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  Future<bool> saveUser(User user) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setInt("userId", user.id);
    prefs.setString("first_name", user.firstName);
    prefs.setString("last_name", user.lastName);
    prefs.setString("email", user.email);
    //prefs.setString("phone", user.phone);
    prefs.setString("title", user.title);
    prefs.setString("token", user.jwtToken);
    //prefs.setString("renewalToken", user.renewalToken);

    //return prefs.commit();
  }

  Future<User> getUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

   /* //int userId = prefs.getInt("userId");
    String name = prefs.getString("name");
    //String email = prefs.getString("email");
    String phone = prefs.getString("phone");
    String type = prefs.getString("type");
    String token = prefs.getString("token");
    String renewalToken = prefs.getString("renewalToken");*/

    int userId = prefs.getInt("userId");
    String firstName = prefs.getString("first_name");
    String lastName = prefs.getString("last_name");
    String email = prefs.getString("email");
    //prefs.setString("phone", user.phone);
    String title = prefs.getString("title");
    String token = prefs.getString("token");
    //prefs.setString("renewalToken", user.renewalToken);

    return User(
        id: userId,
        firstName: firstName,
        lastName: lastName,
        email: email,
        //phone: phone,
        title: title,
        jwtToken: token);
        //renewalToken: renewalToken);
  }

  void removeUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.remove("userId");
    prefs.remove("first_name");
    prefs.remove("last_name");
    prefs.remove("email");
    //prefs.setString("phone", user.phone);
    prefs.remove("title");
    prefs.remove("token");
  }

  Future<String> getToken(args) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("token");
    return token;
  }
}
