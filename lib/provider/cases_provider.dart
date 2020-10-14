import 'package:flutter/material.dart';
import 'package:sales_popular/model/CaseModel.dart';

class CasesProvider extends ChangeNotifier{

  List<CaseModel> _cases = new List();
  bool _isCaseLoading = false;

  getData(){
    isCaseLoading = true;
    Future.delayed(Duration(milliseconds: 20));
    CaseModel case1 = new CaseModel(status: "Serviced",customerName: "Aby Thomas",time: "10:30 AM",vehicleName: "Maruti Suzuki Celerio");
    addToCases(case1);
    isCaseLoading = false;
    CaseModel case2 = new CaseModel(status: "Pending",customerName: "Biby Chacko",time: "01:45 PM",vehicleName: "Maruti Suzuki Swift");
    addToCases(case2);
    CaseModel case3 = new CaseModel(status: "Serviced",customerName: "Aby Thomas",time: "09:00 AM",vehicleName: "Maruti Suzuki Alto");
    addToCases(case3);
    CaseModel case4 = new CaseModel(status: "Pending",customerName: "Aby Thomas",time: "11:30 AM",vehicleName: "Maruti Suzuki Ignis");
    addToCases(case4);
  }

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