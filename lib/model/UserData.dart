

class UserData {
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

  String getName() {
    return this.name;
  }

  String getMobileNo() {
    return this.mobileNo;
  }

  String getUserName() {
    return this.userName;
  }

  String getEmpId() {
    return this.empId;
  }

  String getUserId() {
    return this.userId;
  }

  String getDepartment() {
    return this.department;
  }

  String getBranchName() {
    return this.branchName;
  }

  String getBranchCode() {
    return this.branchCode;
  }

  factory UserData.fromJSON(Map<dynamic, dynamic> json){
    try{
      return UserData(name: json['UserName'],empId: json['Emp_Code'],branchCode: json['Emp_Branch'],department: json['Department']);
    }catch(ex){
      print(ex.toString());
      return null;
    }
  }
}