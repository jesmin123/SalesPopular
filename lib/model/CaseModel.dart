
import 'dart:convert';

import 'package:sales_popular/api/api.dart';
import 'package:sales_popular/model/CustomerDetails.dart';

class CaseModel{

  CustomerDetails _customerDetails;
  NewCarDetails _newCarDetails;
  bool _isCarExchange;
  OldCarDetails _oldCarDetails;
  BookingDetails _bookingDetails;


  CustomerDetails get customerDetails => _customerDetails;

  set customerDetails(CustomerDetails value) {
    _customerDetails = value;

  }

  CaseModel();

  NewCarDetails get newCarDetails => _newCarDetails;

  set newCarDetails(NewCarDetails value) {
    _newCarDetails = value;
  }

  bool get isCarExchange => _isCarExchange;

  set isCarExchange(bool value) {
    _isCarExchange = value;
  }

  OldCarDetails get oldCarDetails => _oldCarDetails;

  set oldCarDetails(OldCarDetails value) {
    _oldCarDetails = value;
  }

  BookingDetails get bookingDetails => _bookingDetails;

  set bookingDetails(BookingDetails value) {
    _bookingDetails = value;
  }

  String getFinalData(){
    Map data = toJson();
    String dataS = jsonEncode(data);
    print(dataS);
  }

  Map<String, dynamic> toJson()=>
      {
        'customerData':_customerDetails.toJson(),
        'newCar' : _newCarDetails.toJson(),
        'isCarExchange': true,
        'oldcar' : _oldCarDetails.toJson(),
        'booking': _bookingDetails.toJson()
      };
}