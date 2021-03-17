import 'package:flutter/material.dart';
import 'package:sales_popular/model/CaseModel.dart';
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
      getSalesEnquiryDetails();
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

  List<CaseModel> _casesList = [];

  List<CaseModel> get casesList => _casesList;

  set casesList(List<CaseModel> value) {
    _casesList = value;
    notifyListeners();
  }

  List<CaseModel> getCasesByDate(String date){
    List<CaseModel> casesDateList = [];

    casesList.forEach((element) {
      String caseDate = element.newCarDetails.followUpDate.substring(0,10);
      if(caseDate==date){
        casesDateList.add(element);
      }
    });

    return casesDateList;

  }

  Future getSalesEnquiryDetails() async{
    List<CaseModel> casesListTemp = [];
    String route ="getopenenquiries?salesExecutive=Naveen P N-26040T";
    RespObj response = await api.getData(route);
    List<dynamic> data= response.data['getOpenSalesEnquiriesDetails'];
    data.forEach((element) {
      casesListTemp.add(CaseModel.fromJson(element));
    });
    casesList = casesListTemp;
    print(data);
}
  Future getSalesWithDateEnquiryDetails(String fromDate,String toDate) async{
    List<CaseModel> casesListTemp = [];
    String route ="getenquiries?fromDate=${fromDate}&toDate=${toDate}&salesExecutive=Naveen P N-26040T";
    RespObj response = await api.getData(route);
    List<dynamic> data= response.data['getSalesEnquiriesDetails'];
    data.forEach((element) {
      casesListTemp.add(CaseModel.fromJson(element));
    });
    casesList = casesListTemp;
    print(data);
  }

CaseModel _selectedCaseModel;

  CaseModel get selectedCaseModel => _selectedCaseModel;

  set selectedCaseModel(CaseModel value) {
    _selectedCaseModel = value;
    notifyListeners();
  }

  List<DateTime> _date;

  List<DateTime> get date => _date;

  set date(List<DateTime> value) {
    _date = value;
    notifyListeners();
  }


}