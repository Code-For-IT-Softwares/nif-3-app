import 'dart:convert';

import 'package:flutter/material.dart';
import '../model/new_user_model.dart';
import '../services/network/api_service.dart';

class CreateUserProvider extends ChangeNotifier {
  bool _isUserCreated = false;
  bool get isUserCreated => _isUserCreated;
  NewUserModel? _newUser;
  NewUserModel? get newUser => _newUser;
  NewUserData? _newUserData;
  NewUserData? get newUserData => _newUserData;


  Future<void> createnewUser(String fullname, String phoneno, String email,
      String role, BuildContext context) async {
    try {
      _isUserCreated = true;
      Map<String, dynamic> requestData = {
        "fullname": fullname,
        "phoneno": phoneno,
        "email": email,
        "role": role
      };
      var response =
          await ApiService.getServices().newUserApi(jsonEncode(requestData));
      NewUserModel userModel = newUserFromJson(response);
      NewUserData demoUserData = userModel.data!;
      _isUserCreated = false;
      _newUserData = demoUserData;
      print(_newUserData?.userid);
      print(_newUserData?.password);
    } catch (e) {
      _isUserCreated = false;
      print("$e Catch");
    }
    // print(_userData?.fullname);
    notifyListeners();
  }
}
