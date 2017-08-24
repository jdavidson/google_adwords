view: geo_criteria_20170420 {
  sql_table_name: adwords_v201609.geo_criteria_20170420 ;;

  dimension: canonical_name {
    type: string
    sql: ${TABLE}.Canonical_Name ;;
  }

  dimension: country_code {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.Country_Code ;;
  }

  dimension: criteria_id {
    type: number
    sql: ${TABLE}.Criteria_ID ;;
  }

  dimension: name {
    map_layer_name: us_states
    type: string
    sql: ${TABLE}.Name ;;
  }

  dimension: parent_id {
    type: number
    sql: ${TABLE}.Parent_ID ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.Status ;;
  }

  dimension: target_type {
    type: string
    sql: ${TABLE}.Target_Type ;;
  }

  measure: count {
    type: count
    drill_fields: [canonical_name, name]
  }
}
