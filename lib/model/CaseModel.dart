

class CaseModel{

  String time;
  String customerName;
  String vehicleName;
  String status;


  CaseModel({this.time, this.customerName, this.vehicleName, this.status});

  String getTime(){
    return time;
  }

  String getCustomerName(){
    return customerName;
  }

  String getVehicelName(){
    return vehicleName;
  }

  String getStatus(){
    return status;
  }


}