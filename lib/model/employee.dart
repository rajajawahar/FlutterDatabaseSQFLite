class Employee{

  String firstName;
  String lastName;
  String mobileNo;
  String emailId;
  
  Employee(this.firstName, this.lastName,this.mobileNo,this.emailId);
  

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map["firstname"] = firstName;
    map["lastname"] = lastName;
    map["mobileno"] = mobileNo;
    map["emailid"] = emailId;
    return map;
  }
}