import 'package:flutter/material.dart';
import 'package:nif_web/model/idea_model.dart';
import 'package:nif_web/services/network/api_service.dart';

class IdeaProvider extends ChangeNotifier {
  List<Idea> _idea = []; 
  List<Idea> get getIdea =>_idea;
  int get getideaListLength => _idea.length;
  void getsIdeaProvider () async {
    try {
      var response = await ApiService.getServices().getIdeaApi();
      IdeaListModel ideaListModel = ideaListModelFromJson(response);
      _idea = ideaListModel.data!;
      print(response);
    } catch (e) {
      print(e);
    }
    notifyListeners();
  }

}