include: "base.view.lkml"
include: "base_stats.view.lkml"

view: stats {
  extension: required

  dimension: cost_usd {
    type: number
    sql: (${cost} / 1000000) ;;
  }

  measure: total_cost {
    hidden: yes
    type: sum
    sql: ${cost} * ((RAND() * 9) + 1) ;;
  }

  measure: total_cost_usd {
    label: "Cost"
    type: sum
    sql:  ${cost_usd} * ((RAND() * 9) + 1) ;;
    value_format_name: usd_0
  }

  measure: total_conversions {
    label: "Conversions"
    type: sum
    sql: ${conversions} * ((RAND() * 9) + 1) ;;
    value_format_name: decimal_0
  }

  measure: total_impressions {
    label: "Impressions"
    type:  sum
    sql:  ${impressions} * ((RAND() * 9) + 1) ;;
    drill_fields: [external_customer_id, total_impressions]
    value_format_name: decimal_0
  }

  measure: total_interactions {
    label: "Interactions"
    type:  sum
    sql:  ${interactions} * ((RAND() * 9) + 1) ;;
    drill_fields: [external_customer_id, total_impressions]
    value_format_name: decimal_0
  }

  measure: total_clicks {
    label: "Clicks"
    type: sum
    sql: ${clicks} * ((RAND() * 9) + 1) ;;
    value_format_name: decimal_0
  }

## Due the manner in which Looker compiles SQL queries, finding weighted averages in this instance is better accomplished through an aggregated measure
## rather than creating a new dimension to be aggregated over

  measure: average_interaction_rate {
    label: "Interation Rate"
    type: number
    sql: ${total_interactions}*1.0/nullif(${total_impressions},0) ;;
    value_format_name: percent_2
  }

  measure: average_click_rate {
    label: "Click Through Rate"
    type: number
    sql: ${total_clicks}*1.0/nullif(${total_impressions},0) ;;
    value_format_name: percent_2
  }

  measure: average_cost_per_conversion {
    label: "Cost per Conversion"
    type: number
    sql: ${total_cost_usd}*1.0 / NULLIF(${total_conversions},0) ;;
    value_format_name: usd
  }

  measure: average_cost_per_click {
    label: "Cost per Click"
    type: number
    sql: ${total_cost_usd}*1.0 / NULLIF(${total_clicks},0) ;;
    value_format_name: usd
  }

  measure: average_cost_per_interaction {
    label: "Cost per Interaction"
    type: number
    sql: ${total_cost_usd}*1.0 / NULLIF(${total_interactions},0) ;;
    value_format_name: usd
  }

  measure: average_cost_per_impression {
    label: "Cost per Impression"
    type: number
    sql: ${total_cost_usd}*1.0 / NULLIF(${total_impressions},0) ;;
    value_format_name: usd
  }

  measure: average_conversion_rate {
    label: "Conversion Rate"
    type: number
    sql: ${total_conversions}*1.0 / NULLIF(${total_clicks},0) ;;
    value_format_name: percent_2
  }
}
