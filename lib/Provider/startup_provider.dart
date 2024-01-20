import 'package:flutter/material.dart';
import 'package:nif_web/model/startup_model.dart';
import 'package:nif_web/services/network/api_service.dart';

class StartUpProvider extends ChangeNotifier {
  List<StartUp> _startup = []; 
  List<StartUp> get getStartUp=>_startup;
  int get getStartUpListLength=>_startup.length;
  void getsStartUpProvider () async {
    try {
      var response = await ApiService.getServices().getStartUpApi();
      StartUpListModel startupListModel = startUpListModelFromJson(response);
      _startup = startupListModel.data!;
      print(response);
    } catch (e) {
      print(e);
    }
    notifyListeners();
  }

}
