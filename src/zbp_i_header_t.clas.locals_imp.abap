CLASS lsc_ZI_HEADER_T DEFINITION INHERITING FROM cl_abap_behavior_saver.
  PROTECTED SECTION.

    METHODS finalize REDEFINITION.

    METHODS check_before_save REDEFINITION.

    METHODS save REDEFINITION.

    METHODS cleanup REDEFINITION.

    METHODS cleanup_finalize REDEFINITION.

ENDCLASS.

CLASS lsc_ZI_HEADER_T IMPLEMENTATION.

   METHOD finalize.
  ENDMETHOD.

  METHOD check_before_save.
  ENDMETHOD.

  METHOD save.

  "Get data from buffer
    DATA(lo_util) = zcl_moni_util=>get_instance( ).

    lo_util->get_hdr_value(
      IMPORTING
        ex_sales_hdr = DATA(ls_sales_hdr) ).

    lo_util->get_itm_value(
      IMPORTING
        ex_sales_itm = DATA(ls_sales_itm) ).

    lo_util->get_hdr_t_deletion(
      IMPORTING
        ex_sales_docs = DATA(lt_sales_header) ).

    lo_util->get_itm_t_deletion(
      IMPORTING
        ex_sales_info = DATA(lt_sales_items) ).

    lo_util->get_deletion_flags(
      IMPORTING
        ex_so_hdr_del = DATA(lv_so_hdr_del) ).

    "Save / Update Header
    IF ls_sales_hdr IS NOT INITIAL.
      MODIFY zmoni_header_t FROM @ls_sales_hdr.
    ENDIF.

    "Save / Update Item
    IF ls_sales_itm IS NOT INITIAL.
      MODIFY zmoni_item_t FROM @ls_sales_itm.
    ENDIF.

    "Deletion Logic
    IF lv_so_hdr_del = abap_true.

      "Delete Header and corresponding Items
      LOOP AT lt_sales_header INTO DATA(ls_del_hdr).

        DELETE FROM zmoni_header_t
          WHERE salesdocument = @ls_del_hdr-salesdocument.

        DELETE FROM zmoni_item_t
          WHERE salesdocument = @ls_del_hdr-salesdocument.

      ENDLOOP.
    ELSE.

      "Delete only Header
      LOOP AT lt_sales_header INTO ls_del_hdr.

        DELETE FROM zmoni_header_t
          WHERE salesdocument = @ls_del_hdr-salesdocument.
      ENDLOOP.

      "Delete only Item
      LOOP AT lt_sales_items INTO DATA(ls_del_itm).

        DELETE FROM zmoni_item_t
          WHERE salesdocument   = @ls_del_itm-salesdocument
            AND salesitemnumber = @ls_del_itm-salesitemnumber.
      ENDLOOP.
    ENDIF.
  ENDMETHOD.

  METHOD cleanup.
   zcl_moni_util=>get_instance( )->cleanup_buffer( ).
  ENDMETHOD.

  METHOD cleanup_finalize.
  ENDMETHOD.
ENDCLASS.
