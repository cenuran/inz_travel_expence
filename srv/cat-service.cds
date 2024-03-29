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


view travelExpenceView 
   as select from travel.travelExpenceView

}


annotate CatalogService.travelExpenceView with @(
    UI: {
        Chart: {
            $Type: 'UI.ChartDefinitionType',
            ChartType: #Donut,
            Measures: ['amount'],
            MeasureAttributes: [{
                $Type: 'UI.ChartMeasureAttributeType',
                Measure: 'amount',
                Role: #Axis1
            }],             
            Dimensions: ['typeDesc'],
            DimensionAttributes: [{
                $Type: 'UI.ChartDimensionAttributeType',
                Dimension: 'typeDesc',
                Role: #Category
            }]       
        }
    }
);

/*

annotate CatalogService.travelExpenceView with @(
    UI: {
        SelectionFields: [dateOfExpense, typeDesc],
        LineItem: [
            { Value: dateOfExpense },
            { Value: typeDesc },
            { Value: amount },
            { Value: currency }
        ],   
    }
);
*/