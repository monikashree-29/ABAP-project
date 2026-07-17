@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'cds for table2'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
 serviceQuality: #X,
 sizeCategory: #S,
 dataClass: #MIXED
}
define view entity zi_item_t as select from zmoni_item_t
association to parent zi_header_t as _salesHeader
 on $projection.Salesdocument = _salesHeader.Salesdocument
{
    key salesdocument as Salesdocument,
    key salesitemnumber as Salesitemnumber,
    material as Material,
    plant as Plant,
    @Semantics.quantity.unitOfMeasure: 'Quantityunits'
    quantity as Quantity,
    quantityunits as Quantityunits,
     @Semantics.user.createdBy: true
    local_created_by as LocalCreatedBy,
    @Semantics.systemDateTime.createdAt: true
    local_created_at as LocalCreatedAt,
    @Semantics.user.lastChangedBy: true
    local_last_changed_by as LocalLastChangedBy,
    @Semantics.systemDateTime.localInstanceLastChangedAt: true
    local_last_changed_at as LocalLastChangedAt,
    _salesHeader
}
