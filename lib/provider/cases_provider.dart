import 'package:flutter/material.dart';
import 'package:sales_popular/model/CaseModel.dart';

class CasesProvider extends ChangeNotifier{

  List<CaseModel> _cases = new List();
  bool _isCaseLoading = false;


  List<CaseModel> get cases => _cases;

  addToCases(CaseModel caseModel){
    _cases.add(caseModel);
    notifyListeners();
  }

  bool get isCaseLoading => _isCaseLoading;

  set isCaseLoading(bool value) {
    _isCaseLoading = value;
    notifyListeners();
  }






}