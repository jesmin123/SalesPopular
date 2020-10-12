import 'package:flutter/material.dart';
import 'package:sales_popular/model/CustomerDetails.dart';

class EnquiryProvider extends ChangeNotifier{
  CustomerDetails _customerDetail;
  int _stepNo = 0;
  int get stepNo => _stepNo;

  set stepNo(int value) {
    _stepNo = value;
    notifyListeners();
  }

  initData({CustomerDetails customerDetails}){
      this.customerDetail = new CustomerDetails();
  }


  CustomerDetails get customerDetail => _customerDetail;

  set customerDetail(CustomerDetails value) {
    _customerDetail = value;
    notifyListeners();
  }

  checkforExistingCustomer(String mobNo){
    //TODO Implement logic
  }

}