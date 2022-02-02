@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'HUNGXA Connection Interface View'
@Metadata.ignorePropagatedAnnotations: false
define root view entity ZHUNGXA_I_CONN
  as select from /dmo/connection
  composition [0..*] of ZHUNGXA_I_FLIGHT as _Flight
{
  key carrier_id      as CarrierId,
  key connection_id   as ConnectionId,
      airport_from_id as AirportFromId,
      airport_to_id   as AirportToId,
      departure_time  as DepartureTime,
      arrival_time    as ArrivalTime,
      distance        as Distance,
      distance_unit   as DistanceUnit,
      
      _Flight
}
