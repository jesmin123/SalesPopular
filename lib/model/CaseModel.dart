
import 'dart:convert';

import 'package:sales_popular/api/api.dart';
import 'package:sales_popular/model/CustomerDetails.dart';

class CaseModel{

  CustomerDetails customerDetails;
  NewCarDetails newCarDetails;
  bool isCarExchange;
  OldCarDetails oldCarDetails;
  BookingDetails bookingDetails;




  CaseModel({this.customerDetails, this.newCarDetails, this.isCarExchange,
      this.oldCarDetails, this.bookingDetails});


  String getFinalData(){
    Map data = this.toJson();
    String dataS = jsonEncode(data);
    print(dataS);
    dataS  = base64.encode(utf8.encode(dataS));
    print(dataS);
    return dataS;
  }

  Map<String, dynamic> toJson(){
     Map<String,dynamic> data =  {
        'customerData':customerDetails.toJson(),
        'newCar' : newCarDetails.toJson(),
        'isCarExchange': true,
        'oldcar' : oldCarDetails.toJson(),
        'booking': bookingDetails.toJson()
      };
     return data;
  }

  factory CaseModel.fromJson(Map<String, dynamic> json){
    try{
      return CaseModel(customerDetails:CustomerDetails.fromJSON(json['customerData']),
          newCarDetails: NewCarDetails.fromJSON(json['newCar']),
          isCarExchange: json['isCarExchange'],
          oldCarDetails: OldCarDetails.fromJSON(json['oldCar']),
          bookingDetails: BookingDetails.fromJSON(json['booking']));
    } catch (ex){
      print(ex.toString());
      return null;
    }
  }

}