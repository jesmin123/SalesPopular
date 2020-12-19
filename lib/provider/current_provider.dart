import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:sales_popular/api/api.dart';
import 'package:sales_popular/model/CaseModel.dart';

class CurrentProvider extends ChangeNotifier{

  CaseModel caseModel = new CaseModel();

  saveTransaction(String userId,String sessionId,String param2){
    String route='http://13.234.53.184/mobapitesting/api/process';
    Map<String, dynamic> jsonMap = {
      "FunctionName":"TransSave",
      "BoolParam3":"true",
      "StringParam1":"Vehicle Sales Enquiries For Mobile-AD4W",
      "SessionId":sessionId,
      "UserId":userId,
      "StringParam2":param2,
    };
    String jsonString = json.encode(jsonMap);
    api.postData(route,mBody: jsonString).then((value){
      if (value.status){
        print(value.data);
        Map response=value.data;
      }
    });
  }}