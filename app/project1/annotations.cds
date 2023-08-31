using CatalogService as service from '../../srv/cat-service';

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