import 'package:flutter/material.dart';
import 'package:sales_popular/model/UserData.dart';

class UserDataProvider extends ChangeNotifier{

  UserData _userData;
  bool _isLoading  = false;
  UserData get userData => _userData;

  set userData(UserData value) {
    _userData = value;
    notifyListeners();
  }


  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  getData(){
    isLoading = true;
    _userData = UserData(name: "Biby Chacko",empId: "046656",branchCode: "SKL_JOK",branchName: "Kanjirapally",department: "Sales",mobileNo: "9061973040",userId: "asdfg",userName: "Biby_POP");
    isLoading = false;
  }

}