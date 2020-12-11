import 'package:flutter/material.dart';
import 'package:sales_popular/model/CustomerDetails.dart';
import 'package:sales_popular/api/api.dart';
import 'package:sales_popular/model/RespObj.dart';

class EnquiryProvider extends ChangeNotifier{
  void initDataLoading() {
  }


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



 Future<bool> CheckAvailability(String carMake, String carModel, String variant, String color, String branch) async {
  bool isAvailable = false;
  String route = 'getstock?CarMake='+ carMake+ '&CarModel='+ carModel + '&Variant='+ variant+ '&Branch='+ branch+ '&Colour='+ color;
   RespObj response = await api.getData(route);
  int quantity = 0;
   if(response.status){
       dynamic data  = response.data;
       String qty = data[0]['qty'][0];
       print(qty);

       try{
         qty = qty.split(".")[0];
          quantity = int.parse(qty);
       }catch(ex){
         print(ex.toString());
          quantity = 0;
       }
    }
   if(quantity>0){
     isAvailable = true;
   }else{
     isAvailable = false;
   }
    return isAvailable;
}




}