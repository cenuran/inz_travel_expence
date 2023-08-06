namespace travel;

entity Trip {
  key ID : Integer;
    description : String;
    startDate : Date;
    endDate : Date;
    country : Association to Country;
    employee_id : Association to User;
}

entity Country {
  key ISOID : String;
  countryName : String;
}

entity Status {
  key statusDesc : String;
}

entity Type {
  key type :  String;
  typeDesc : String;
}

entity SubType {
  key subType : String;
  subTypeDesc : String;
  type : Association to Type
}

entity Currency {
  key ID : String;
      currency : String;
}

entity User {
  key ID : Integer;
      name : String;
      surname : String;
      email : String;
      role : Association to UserRole;
}

entity Project {
  key ID : Integer;
  name : String;
  projectDesc : String;
  PMUser : Association to User;
  status_pr : Association to StatusProject;
}

entity Expence {
  key ID : Integer;
      dateOfExpense : Date;
      amount : Integer;
      currency : Association to Currency;
      type : Association to Type;
      subType : Association to SubType;
      project : Association to Project;
      trip : Association to Trip;
      statusDesc : Association to Status;
      employee_id : Association to User;
      approver_id : Association to User;
      
}

entity UserRole {
  key name : String;
  
}

entity StatusProject{
  key status_pr : String;
}