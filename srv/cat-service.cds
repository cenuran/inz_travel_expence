using travel from '../db/data-model.cds';

service CatalogService {

 entity Country
    as projection on travel.Country;

 entity Expence
    as projection on  travel.Expence;

 entity Project
    as projection on  travel.Project;

 entity Status
    as projection on  travel.Status;

 entity SubType
    as projection on  travel.SubType;

 entity Trip
    as projection on  travel.Trip;

 entity Type
    as projection on  travel.Type;

entity User
    as projection on  travel.User;

entity Currency
    as projection on  travel.Currency;

}