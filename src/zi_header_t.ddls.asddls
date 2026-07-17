@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'cds for table1'
@Metadata.ignorePropagatedAnnotations: true
define root view entity zi_header_t as select from zmoni_header_t
composition [0..*] of zi_item_t  as _salesitem
{
    key salesdocument as Salesdocument,
    salesdocumenttype as Salesdocumenttype,
    orderreason as Orderreason,
    salesorganization as Salesorganization,
    distributionchannel as Distributionchannel,
    division as Division,
    salesoffice as Salesoffice,
    salesgroup as Salesgroup,
    @Semantics.amount.currencyCode: 'Currency'
    netprice    as NetPrice,
    currency as Currency,
    @Semantics.user.createdBy: true
    local_created_by as LocalCreatedBy,
    @Semantics.systemDateTime.createdAt: true
    local_created_at as LocalCreatedAt,
    @Semantics.user.lastChangedBy: true
    local_last_changed_by as LocalLastChangedBy,
    @Semantics.systemDateTime.localInstanceLastChangedAt: true
    local_last_changed_at as LocalLastChangedAt,
    _salesitem
}
