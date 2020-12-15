import 'package:flutter/material.dart';
import 'package:sales_popular/api/myserverutils.dart';
import 'package:sales_popular/model/RespObj.dart';
import 'package:sales_popular/model/UserData.dart';

class UserDataProvider extends ChangeNotifier{

    String Password;
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

  registerUser(String emp,String mobile,String password)
  {
    String route = '?function=user_register&mobile=${mobile}&emp_code=${emp}&password=${password}';
    myServer.getData(route).then((value){
      if(value.status){
        print(value.data);
      }
      Password=password;
      Map result=value.data;
      String OTP=result['posts']['otp'];
      String userId=result['posts']['user_id'];
      print(OTP);
      print(userId);
      registerOtp(userId, OTP, password);

    });
  }
  registerOtp(String userid,String otp,String password)
  {
    String route= '?function=verify_otp&user_id=${userid}&otp=${otp}';
    myServer.getData(route).then((value) {
      if (value.status) {
        print(value.data);
      }
      Map result=value.data;
      String accesstoken=result['posts']['access_token'];
      updatePassword(userid, Password, accesstoken);
    });
  }
   updatePassword(String userid,String password,String accesstoken){
     String route= '?function=update_password&user_id=${userid}&password=${Password}&access_token=${accesstoken}';
     myServer.getData(route).then((value) {
       if (value.status) {
         print(value.data);
       }
     });

}
  Future<RespObj> login(String userid,String password) async {
    String route= '?function=user_login&mobile=${userid}&password=${password}';
    RespObj resp = await  myServer.getData(route);
    return resp;
}}
