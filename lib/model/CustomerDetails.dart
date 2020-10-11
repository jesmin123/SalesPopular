
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
      this.taluk});

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
}