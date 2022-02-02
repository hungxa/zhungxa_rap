@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'HUNGXA Connection Consumption View'
@Metadata.allowExtensions: true
define root view entity ZHUNGXA_C_CONN provider contract transactional_query 
       as projection on ZHUNGXA_I_CONN {
    key CarrierId,
    key ConnectionId,
    AirportFromId,
    AirportToId,
    DepartureTime,
    ArrivalTime,
    Distance,
    DistanceUnit,
    /* Associations */
    _Flight : redirected to composition child ZHUNGXA_C_FLIGHT
}
