namespace travel;

entity Trip {
  key ID : Integer;
      startDate : Date;
      endDate : Date;
      country : Association to Country;
}

entity Country {
  key ISOID : String;
      countryName : String;
}

entity Status {
  key ID : Integer;
      statusDesc : String;
}

entity Type {
  key ID : Integer;
      typeDesc : String;
}

entity SubType {
  key ID : Integer;
      subTypeDesc : String;
}

entity Currency {
  key ID : Integer;
      currency : String;
}

entity User {
  key ID : Integer;
      name : String;
      surname : String;
      email : String;
}

entity Project {
  key ID : Integer;
      projectDesc : String;
      PMUser : Association to User;
}

entity Expence {
  key ID : Integer;
      dateOfExpence : Date;
      rejectionReason : String;
      amount : Integer;
      type : Association to Type;
      subType : Association to SubType;
      project : Association to Project;
      trip : Association to Trip;
      status : Association to Status;
      currency : Association to Currency;
}