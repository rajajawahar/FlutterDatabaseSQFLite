class Employee{

  String firstName;
  String lastName;
  String mobileNo;
  String emailId;
  
  Employee(this.firstName, this.lastName,this.mobileNo,this.emailId);
  
   Employee.fromMap(Map map) {
    firstName = map[firstName];
    lastName = map[lastName];
    mobileNo = map[mobileNo];
    emailId = map[emailId];
  }
  
}