@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'HUNGXA Flight Interface View'
@Metadata.ignorePropagatedAnnotations: false
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZHUNGXA_I_FLIGHT
  as select from /dmo/flight
  association to parent ZHUNGXA_I_CONN as _Connection on  $projection.CarrierId    = _Connection.CarrierId
                                                      and $projection.ConnectionId = _Connection.ConnectionId  
{
  key carrier_id     as CarrierId,
  key connection_id  as ConnectionId,
  key flight_date    as FlightDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      price          as Price,
      currency_code  as CurrencyCode,
      plane_type_id  as PlaneTypeId,
      seats_max      as SeatsMax,
      seats_occupied as SeatsOccupied,
    case seats_max
        when 0 then 0
        else cast ( ( seats_occupied / seats_max ) * 100 as abap.int1 )
    end as Percentage,
    concat(cast($projection.Percentage as abap.char(3)), '%') as PercentageS,
    case when $projection.Percentage < 60 then 3
         when $projection.Percentage < 80 then 2
         else 1
    end as Status,  
      _Connection
}
