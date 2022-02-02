CLASS lhc_zhungxa_i_flight DEFINITION INHERITING FROM cl_abap_behavior_handler.

  PRIVATE SECTION.

    METHODS get_instance_features FOR INSTANCE FEATURES
      IMPORTING keys REQUEST requested_features FOR zhungxa_i_flight RESULT result.

ENDCLASS.

CLASS lhc_zhungxa_i_flight IMPLEMENTATION.

  METHOD get_instance_features.

    DATA: lt_flight_import TYPE TABLE FOR READ IMPORT zhungxa_i_flight.
    DATA: lt_flight TYPE TABLE FOR READ RESULT zhungxa_i_flight.

    lt_flight_import = CORRESPONDING  #( keys ).

    READ ENTITY IN LOCAL MODE zhungxa_i_flight FIELDS ( Percentage ) WITH lt_flight_import
      RESULT lt_flight.

    LOOP AT lt_flight ASSIGNING FIELD-SYMBOL(<ls_flight>).
      IF <ls_flight>-Percentage > 80.
        APPEND VALUE #( %tky = <ls_flight>-%tky
                        %field-Price = if_abap_behv=>fc-f-read_only )
          TO result.
      ENDIF.
    ENDLOOP.

  ENDMETHOD.

ENDCLASS.

CLASS lhc_ZHUNGXA_I_CONN DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR zhungxa_i_conn RESULT result.

ENDCLASS.

CLASS lhc_ZHUNGXA_I_CONN IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

ENDCLASS.
