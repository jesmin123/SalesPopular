import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:sales_popular/api/api.dart';
import 'package:sales_popular/api/myserverutils.dart';
import 'package:sales_popular/model/RespObj.dart';
import 'package:sales_popular/model/UserData.dart';

class UserDataProvider extends ChangeNotifier{

    String Password;
  UserData _userData;
  String UserID;
  String accessToken;
  String SessionID;
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

  Future<bool> registerUser(String emp,String mobile,String password) async {

    String route = '?function=user_register&mobile=${mobile}&emp_code=${emp}&password=${password}';
    RespObj value = await myServer.getData(route);

      if(!value.status){
        return false;
      }
      Password=password;
      Map result=value.data;
      String userId=result['posts']['user_id'];
      UserID = userId;
      print(userId);
      return true;
  }

    Future<bool> registerOtp(String otp) async {
      String route= '?function=verify_otp&user_id=${UserID}&otp=${otp}';
      RespObj value = await myServer.getData(route);
      if (!value.status) {
          return false;
      }
      Map result=value.data;
      String accesstoken = result['posts']['access_token'];
      accessToken = accesstoken;
      return true;
    }

    Future<bool> updatePassword(String password) async {
     String route= '?function=update_password&user_id=${UserID}&password=${Password}&access_token=${accessToken}';
     RespObj value  = await myServer.getData(route);
       if (value.status) {
         print(value.data);
       }

       return value.status;
  }

    UserData _user ;


    UserData get user => _user;

  set user(UserData value) {
    _user = value;
    notifyListeners();
  }

  loginSessionId(String username,String Password){
          String route='http://13.234.53.184/mobapitesting/api/login?username=Mobile User&password=MobileUser';
          Map<String, dynamic> jsonMap = {
              "Company":"PVSL_Live1_MS",
              "UserName":"Mobile User",
              "Password":"MobileUser"
          };
          String jsonString = json.encode(jsonMap);
          api.postData(route,mBody: jsonString).then((value){
        if (value.status){
          print(value.data);
          Map response=value.data;
          UserID=response['UserId'];
          SessionID=response['SessionId'];

        }
          });
   }

    Future<RespObj> login(String userid,String password) async {
      String route= '?function=user_login&mobile=${userid}&password=${password}';
      RespObj resp = await  myServer.getData(route);
      if (resp.status){
        user = UserData.fromJSON(resp.data['posts']);
        loginSessionId('username', 'Password');
      }
      return resp;
    }}
