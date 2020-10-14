import 'package:flutter/material.dart';
import 'package:sales_popular/model/UserData.dart';

class UserDataProvider extends ChangeNotifier{

  UserData _userData;

  UserData get userData => _userData;

  set userData(UserData value) {
    _userData = value;
    notifyListeners();
  }

  getData(){
    _userData = UserData(name: "Biby Chacko",empId: "046656",branchCode: "SKL_JOK",branchName: "Kanjirapally",department: "Sales",mobileNo: "9061973040",userId: "asdfg",userName: "Biby_POP");
  }

}