

class UserData{
  String name;
  String mobileNo;
  String userName;
  String empId;
  String userId;
  String department;
  String branchName;
  String branchCode;

  UserData({this.name, this.mobileNo, this.userName, this.empId, this.userId,
      this.department, this.branchName, this.branchCode});

  String getName(){
    return this.name;
  }
}