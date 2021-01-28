
import 'package:flutter/cupertino.dart';

class CustomerDetails{

  String customerType;
  String salutation;
  String customerName;
  String dob;
  String email;
  String mobileNo;
  String secondaryMobileNo;
  String addressLine1;
  String addressLine2;
  String addressArea;
  String village;
  String taluk;
  String district;
  String state;


  CustomerDetails({
      this.customerType,
      this.salutation,
      this.customerName,
      this.dob,
      this.email,
      this.mobileNo,
      this.secondaryMobileNo,
      this.addressLine1,
      this.addressLine2,
      this.addressArea,
      this.village,
      this.taluk,
      this.district,
      this.state
  });


  String getCustomerType() => customerType!=null?customerType:"";

  String getSalutation() => salutation!=null?salutation:"";

  String getCustomerName() => customerName!=null?customerName:"";

  String getDob() => dob!=null?dob:"";

  String getEmail() => email!=null?email:"";

  String getMobileNo() => mobileNo!=null?mobileNo:"";

  String getSecondaryMobileNo() => secondaryMobileNo!=null?secondaryMobileNo:"";

  String getAddressLine1() => addressLine1!=null?addressLine1:"";

  String getAddressLine2() => addressLine2!=null?addressLine2:"";

  String getAddressArea() => addressArea!=null?addressArea:"";

  String getVillage() => village!=null?village:"";

  String getTaluk() => taluk!=null?taluk:"";


  factory CustomerDetails.fromJSON(Map<String,dynamic>json){
    try{
    return CustomerDetails(customerType: json['customerType'], salutation: json['salutation'], customerName: json['customerName'],
    dob: json['dob'], email: json['email'], mobileNo: json['mobno'], secondaryMobileNo: json['secondaryMobileNo'],
      addressLine1: json['addressLine1'], addressLine2: json['addressLine2'], addressArea: json['addressArea'],
      village: json['village'], taluk: json['taluk'], district: json['district'], state: json['state']
    );
    }
    catch(ex){
      debugPrint(ex.toString());
      return null;
    }
  }

  Map<String, dynamic> toJson()=>
      {
        'customerType':customerType,
        'salutation': salutation,
        'customerName': customerName,
        'dob': dob,
        'email': email,
        'mobno': mobileNo,
        'secMobNo': secondaryMobileNo,
        'addressLine1': addressLine1,
        'addressLine2': addressLine2,
        'addressArea': addressArea,
        'village': village,
        'taluk': taluk,
        'district': district,
        'state': state,
      };
}


class NewCarDetails{

  String carMake;
  String carModel;
  String variant;
  String color;
  String likelyToPurchaseWithin;
  String followUpDate;
  String followUpTime;
  String scheduleCallOn;
  String assignToBranch;
  String testDriveDate;
  String testDriveTime;

  NewCarDetails({
    this.carMake,
    this.carModel,
    this.variant,
    this.color,
    this.likelyToPurchaseWithin,
    this.followUpDate,
    this.followUpTime,
    this.scheduleCallOn,
    this.assignToBranch,
    this.testDriveDate,
    this.testDriveTime
  });

 Map<String, dynamic> toJson()=>{
   'carMake': carMake,
   'carModel': carModel,
   'variant': variant,
   'color': color,
   'isAvailable': true,
   'likelyToPurchase': '20',
   'followUp':{
     'date': followUpDate,
     'time': followUpTime,
   },
   'branch': assignToBranch,
   'testDrive':{
     'date': testDriveDate,
     'time': testDriveTime,
   },
 } ;
  factory NewCarDetails.fromJSON(Map<String,dynamic>json){
    try{
      return NewCarDetails(carMake: json['carMake'],carModel: json['carModel'], variant:  json['variant'],
          color:  json['color'], likelyToPurchaseWithin:  json['likelyToPurchase'].toString(),  followUpDate:  json['followUP']['date'],
         followUpTime:   json['followUP']['time'], testDriveDate:  json['testDrive']['date'], testDriveTime:  json['testDrive']['time'],
          assignToBranch:  json['branch']  );
    }
    catch(ex){
      debugPrint(ex.toString());
      return null;
    }
  }

}


class OldCarDetails{

  String exchangeCarMake;
  String exchangeCarModel;
  String exchangeCarVariant;
  String exchangeCarColor;
  String evalutorBranch;
  String evalutorName;
  String remarks;

  OldCarDetails({
      this.exchangeCarMake,
      this.exchangeCarModel,
      this.exchangeCarVariant,
      this.exchangeCarColor,
      this.evalutorBranch,
      this.evalutorName,
      this.remarks
  });

  Map<String, dynamic> toJson()=>{

      'carMake': exchangeCarMake,
      'carModel': exchangeCarModel,
      'variant': exchangeCarVariant,
      'color': exchangeCarColor,
      'evaluatorBranch':evalutorBranch,
      'evaluatorname': evalutorName,
      'remarks': remarks,

  };
  factory OldCarDetails.fromJSON(Map<String,dynamic>json){
    try{
      return OldCarDetails(exchangeCarMake:  json['carMake'], exchangeCarModel:  json['carModel'], exchangeCarVariant: json['varient'],
          exchangeCarColor:  json['color'], evalutorBranch:  json['evaluatorBranch'], evalutorName:  json['evaluatorName'],
          remarks:  json['remarks']
      );
    }
    catch(ex){
      debugPrint(ex.toString());
      return null;
    }
  }


}


class BookingDetails {

  String salesexecutive;
  String paymentType;
  String source;
  String amount;


  BookingDetails({this.salesexecutive, this.paymentType, this.amount, this.source});

  Map<String, dynamic> toJson()=>{
      'salesExecutive' : salesexecutive,
      'paymentType' : paymentType,
    'amount' : amount,
    "sourceofEnquiry": source

  };
  factory BookingDetails.fromJSON(Map<String,dynamic>json){
    try{
      return BookingDetails(salesexecutive:  json['salesExecutive'], paymentType:  json['paymentType'], amount:  json['amount'].toString(),
          source:  json['sourceofEnquiry']
      );
    }
    catch(ex){
      debugPrint(ex.toString());
      return null;
    }
  }

}



