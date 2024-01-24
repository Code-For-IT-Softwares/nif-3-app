import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:nif_web/model/user_model.dart';
import 'package:nif_web/pages/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../pages/home_page.dart';
import '../pages/login_page.dart';
import '../services/network/api_service.dart';

class AuthProvider extends ChangeNotifier {
  bool _isSignedIn = false;
  bool _isSignedOut = false;
  UserData? _userData;
  bool _isDataLoaded = false;
  bool get isSignedIn => _isSignedIn;
  bool get isSignedOut => _isSignedOut;
  UserData? get userData => _userData;
  bool get isDataLoaded => _isDataLoaded;

  Future<void> userAuthProvider(
      String userId, String password, BuildContext context) async {
    try {
      _isDataLoaded = true;
      Map<String, dynamic> requestData = {
        "userid": userId,
        "password": password
      };
      var response =
          await ApiService.getServices().userAuthApi(jsonEncode(requestData));
      UserModel userModel = userModelFromJson(response);
      UserData demoUserData = userModel.data!;

      final SharedPreferences sharedUser =
          await SharedPreferences.getInstance();
      await sharedUser.setString("user_data", jsonEncode(demoUserData.toJson()));
      await sharedUser.setBool("isSignedIn", true);
      _isSignedIn = true;
      _isDataLoaded = false;
      String userDataJson = sharedUser.getString("user_data") ?? "";
      _userData = UserData.fromJson(jsonDecode(userDataJson));
      
      // print(_userData?.fullname);
      // print(AuthProvider()._userData?.fullname);
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => HomePage(user: userData),
        ),(Route<dynamic> route) => false,
      );
      // notifyListeners();
    } catch (e) {
      print("$e Catch");
    }
      // print(_userData?.fullname);
    notifyListeners();
  }

  Future<void> checkDataStatus() async {
    final SharedPreferences sharedUser = await SharedPreferences.getInstance();
      String userDataJson = sharedUser.getString("user_data") ?? "";
      _userData = UserData.fromJson(jsonDecode(userDataJson));
      // print(_userData?.fullname);
      notifyListeners();
  }


  Future<bool> checkSignInStatus() async {
    final SharedPreferences sharedUser = await SharedPreferences.getInstance();
    _isSignedIn = sharedUser.getBool("isSignedIn") ?? false;
    if (_isSignedIn) {
      // print(AuthProvider()._userData?.fullname);
      String userDataJson = sharedUser.getString("user_data") ?? "";
      _userData = UserData.fromJson(jsonDecode(userDataJson));
      notifyListeners();
      // return _isSignedIn;
    }
    return _isSignedIn;
  }

  Future<void> signOut(BuildContext context) async {
    _isSignedOut = true;
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => SplashScreen()),
    );
    final SharedPreferences sharedUser = await SharedPreferences.getInstance();
    await sharedUser.setBool("isSignedIn", false);
    await sharedUser.remove("user_data");
    _isSignedIn = false;
    _userData = null;

    _isSignedOut= false;
    notifyListeners();
  }
}
