@EndUserText.label: 'HUNGXA Flight Consumption View'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true
define view entity ZHUNGXA_C_FLIGHT
  as projection on ZHUNGXA_I_FLIGHT
{
    key CarrierId,
    key ConnectionId,
    key FlightDate,
    Price,
    CurrencyCode,
    PlaneTypeId,
    SeatsMax,
    SeatsOccupied,
    Percentage,
    PercentageS,
    Status,
    /* Associations */
    _Connection : redirected to parent ZHUNGXA_C_CONN
}
