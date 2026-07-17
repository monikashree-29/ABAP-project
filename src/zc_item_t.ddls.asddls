@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'projections'
@Search.searchable: true
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define view entity zc_item_t as projection on zi_item_t
{
    key Salesdocument,
    key Salesitemnumber,
    @Search.defaultSearchElement: true    
    Material,
    Plant,
    @Semantics.quantity.unitOfMeasure: 'Quantityunits'
    Quantity,
    Quantityunits,
    LocalCreatedBy,
    LocalCreatedAt,
    LocalLastChangedBy,
    LocalLastChangedAt,
    /* Associations */
    _salesHeader : redirected to parent zc_header_t 
}
