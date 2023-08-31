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

@Aggregation.ApplySupported.PropertyRestrictions: true
entity travelExpenceView as SELECT from travel.Expence
{
    ID,
    @Analytics.Dimension: true
    dateOfExpense,
    @Analytics.Measure: true
    @Aggregation.default: #SUM
    amount,
    currency.ID as currencyID,
    @Analytics.Dimension: true
    currency.currency,
    type.type,
    @Analytics.Dimension: true
    type.typeDesc,
    subType.subType,
    @Analytics.Dimension: true
    subType.subTypeDesc,
    subType.type as subTypeType ,
    project.ID as projectID,
    @Analytics.Dimension: true
    project.name,
    @Analytics.Dimension: true
    project.projectDesc,
    @Analytics.Dimension: true
    project.PMUser.ID as projectPMUserID,
    @Analytics.Dimension: true
    project.PMUser.name as projectPMUserName,
    @Analytics.Dimension: true
    project.PMUser.surname as projectPMUserSurname, 
    @Analytics.Dimension: true
    project.PMUser.role as projectPMUserRole,
    @Analytics.Dimension: true
    project.PMUser.email as projectPMUserEmail,
    @Analytics.Dimension: true
    project.status_pr.status_pr,
    trip.ID as tripID,
    @Analytics.Dimension: true
    trip.description,
    @Analytics.Dimension: true
    trip.startDate,
    @Analytics.Dimension: true
    trip.endDate,
    trip.country.ISOID,
    @Analytics.Dimension: true
    trip.country.countryName,
    trip.employee_id.ID as tripEmployee_idID, 
    @Analytics.Dimension: true
    trip.employee_id.name as tripEmployee_idName,
    @Analytics.Dimension: true
    trip.employee_id.surname as tripEmployee_idSurname,
    @Analytics.Dimension: true
    trip.employee_id.role as tripEmployee_idRole,
    @Analytics.Dimension: true
    trip.employee_id.email as tripEmployee_idEmail,
    employee_id.ID as employee_idID, 
    @Analytics.Dimension: true
    employee_id.name as employee_idName,
    @Analytics.Dimension: true
    employee_id.surname as employee_idSurname,
    @Analytics.Dimension: true
    employee_id.role as eployee_idRole,
    @Analytics.Dimension: true
    employee_id.email as employee_idEmail,
    @Analytics.Dimension: true
    statusDesc.statusDesc,
    approver_id.ID as approver_idID,
    @Analytics.Dimension: true
    approver_id.name as approver_idName,
    @Analytics.Dimension: true
    approver_id.surname as approver_idSurname,
    @Analytics.Dimension: true
    approver_id.role as approver_idRole,
    @Analytics.Dimension: true
    approver_id.email as approver_idEmail
};