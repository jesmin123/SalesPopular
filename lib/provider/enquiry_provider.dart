import 'package:flutter/material.dart';
import 'package:sales_popular/model/CustomerDetails.dart';

class EnquiryProvider extends ChangeNotifier{
  CustomerDetails customerDetail;

  initData({CustomerDetails customerDetails}){
      this.customerDetail = customerDetails!=null?customerDetails:new CustomerDetails();
  }


  checkforExistingCustomer(String mobNo){
    //TODO Implement logic
  }

}