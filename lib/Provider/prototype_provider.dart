import 'package:flutter/material.dart';
import 'package:nif_web/model/prototype_model.dart';
import 'package:nif_web/services/network/api_service.dart';

class PrototypeProvider extends ChangeNotifier {
  List<Prototype> _prototype = []; 
  List<Prototype> get getPrototype=>_prototype;
  int get getPrototypeListLentgh=>_prototype.length;
  void getsPrototypeProvider () async {
    try {
      var response = await ApiService.getServices().getPrototypeApi();
      PrototypeListModel prototypeListModel = prototypeListModelFromJson(response);
      _prototype = prototypeListModel.data!;
      print(response);
    } catch (e) {
      print(e);
    }
    notifyListeners();
  }

}
