import 'package:flutter/material.dart';
import 'package:nif_web/model/stats_model.dart';
import 'package:nif_web/services/network/api_service.dart';

class StatsProvider extends ChangeNotifier {
  bool _statsLoaded = false;
  bool get getStatloaded=>_statsLoaded;
  set setStatloaded(bool statLoaded){
    _statsLoaded = statLoaded;
    notifyListeners();
    }
  Stat _stat = Stat(); 
  Stat getStat()=>_stat;
  Future <void> getsStatsProvider () async {
    try {
      _statsLoaded = true;
      var response = await ApiService.getServices().getStatsApi();
      StatModel statModel = statModelFromJson(response);
      _stat = statModel.data!;
      _statsLoaded = false ;
      // print(response);
    } catch (e) {
      _statsLoaded = false;
      print(e);
    }
    notifyListeners();
  }

}
