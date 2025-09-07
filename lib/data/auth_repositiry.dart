import 'package:shared_preferences/shared_preferences.dart';

class AuthRepositiry {

SharedPreferences? prefs;
 String usersList = 'users-list';
 String currentToken = 'current-token';

  initAuthRepo()async{
    prefs = await SharedPreferences.getInstance();
  }

  Future<void> login(String email, String password) async {
    await Future.delayed(Duration(seconds: 1));
    List<String> users = prefs?.getStringList(usersList) ?? [];
    
    if(users.contains(email)){
      String userToken = '0x123$email';
      prefs?.setString(currentToken, userToken);
      return;
    }

    throw Exception('user not registered');
  }

  Future<void> register(String email , String password) async {
   await Future.delayed(Duration(seconds: 1));
    List<String> users = prefs?.getStringList(usersList) ?? [];
    if (users.contains(email)) {
      throw Exception('user already registered');
    }
    users.add(email);
    prefs?.setStringList(usersList, users);
    String userToken = '0x123$email';
    prefs?.setString(currentToken, userToken);
  }

  Future<bool> logout() async {
    await Future.delayed(Duration(seconds: 1));
    prefs?.remove(currentToken);
    return true;
  }

  Future<bool> isLoggedIn() async {
    String? token = prefs?.getString(currentToken);
    return token != null;
  }
}

