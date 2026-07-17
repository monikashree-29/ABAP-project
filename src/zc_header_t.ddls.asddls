@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'projections'
@Search.searchable: true
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define root view entity zc_header_t 
provider contract transactional_query
as projection on zi_header_t
{
    key Salesdocument,
    Salesdocumenttype,
    Orderreason,
    Salesorganization,
    Distributionchannel,
    Division,
    @Search.defaultSearchElement: true
    Salesoffice,
    Salesgroup,
    @Semantics.amount.currencyCode: 'Currency'
    NetPrice,
    Currency,
    LocalCreatedBy,
    LocalCreatedAt,
    LocalLastChangedBy,
    LocalLastChangedAt,
    /* Associations */
    _salesitem : redirected to composition child zc_item_t
}
