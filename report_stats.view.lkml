include: "stats.view.lkml"

view: base_report_stats  {

  dimension: month {
    type: date
    allow_fill: no
    convert_tz: no
    sql: ${TABLE}.Month ;;
  }

  dimension: quarter {
    type: date_quarter
    allow_fill: no
    convert_tz: no
    sql: ${TABLE}.Month ;;
  }

  dimension: campaignname {
    label: "Campaign"
    type: string
    sql: ${TABLE}.CampaignName ;;
  }

  dimension: state {
    label: "State"
    map_layer_name: us_states
    type: string
    sql: ${TABLE}.state ;;
  }

  dimension: device {
    label: "Device"
    type: string
    sql: ${TABLE}.Device ;;
  }

  dimension: adnetworktype {
    label: "Ad Network"
    type: string
    sql: ${TABLE}.AdNetworkType ;;
  }

  dimension: cost {
    type: number
    sql: ${TABLE}.Cost ;;
  }

  dimension: clicks {
    type: number
    sql: ${TABLE}.Clicks ;;
  }

  dimension: conversions {
    type: number
    sql: ${TABLE}.Conversions ;;
  }

  dimension: interactions {
    type: number
    sql: ${TABLE}.Interactions ;;
  }

  dimension: impressions {
    type: number
    sql: ${TABLE}.Impressions ;;
  }

  dimension: cost_usd {
    type: number
    sql: (${cost} / 1000000) ;;
  }

  measure: total_cost {
    hidden: yes
    type: sum
    sql: ${cost} ;;
  }

  measure: total_cost_usd {
    label: "Cost"
    type: sum
    sql:  ${cost_usd};;
    value_format_name: usd_0
  }

  measure: total_conversions {
    label: "Conversions"
    type: sum
    sql: ${conversions} ;;
    value_format_name: decimal_0
  }

  measure: total_impressions {
    label: "Impressions"
    type:  sum
    sql:  ${impressions} ;;
    value_format_name: decimal_0
  }

  measure: total_interactions {
    label: "Interactions"
    type:  sum
    sql:  ${interactions} ;;
    value_format_name: decimal_0
  }

  measure: total_clicks {
    label: "Clicks"
    type: sum
    sql: ${clicks} ;;
    value_format_name: decimal_0
  }

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

view: report_stats {
  extends: [base_report_stats]
  derived_table: {
    sql: SELECT
  CONCAT(FORMAT_TIMESTAMP('%Y-%m', TIMESTAMP(geo_stats._DATA_DATE) ), "-01") AS Month,
  CASE
      WHEN campaign.CampaignName = "NA - Search - Competition" THEN "NA - Search - Competition"
      WHEN campaign.CampaignName = "NA - Search - BI - Tool" THEN "NA - Search - Widget"
      WHEN campaign.CampaignName = "NA - Search - Business Intelligence Software" THEN "NA - Search - Gizmo"
      WHEN campaign.CampaignName = "NA - Display - Remarketing Image Nov 2016" THEN "NA - Display - Image"
      WHEN campaign.CampaignName = "NA - Search - Brand" THEN "NA - Search - Brand"
      WHEN campaign.CampaignName = "NA - Search - Data Visualization" THEN "NA - Search - Gadget"
      WHEN campaign.CampaignName = "NA - Search - Data Analytics Tools" THEN "NA - Search - Tool"
      ELSE "NA - Display - Gadget" END AS CampaignName,
  geo_us_state.Name  AS State,
  CASE
    WHEN geo_stats.Device LIKE '%Desktop%' THEN "Desktop"
    ELSE "Mobile" END AS Device,
  CASE
    WHEN geo_stats.AdNetworkType1 = 'SHASTA_AD_NETWORK_TYPE_1_SEARCH' THEN 'Search'
    ELSE 'Content' END AS AdNetworkType,
  COALESCE(ROUND(SUM(geo_stats.Cost) * ((RAND() * 9) + 1)), 0) AS Cost,
  COALESCE(ROUND(SUM(geo_stats.Conversions ) * ((RAND() * 9) + 1)), 0) AS Conversions,
  COALESCE(ROUND(SUM(geo_stats.Clicks ) * ((RAND() * 9) + 1)), 0) AS Clicks,
  COALESCE(ROUND(SUM(geo_stats.Interactions * ((RAND() * 9) + 1) )), 0) AS Interactions,
  COALESCE(ROUND(SUM(geo_stats.Impressions * ((RAND() * 9) + 1) )), 0) AS Impressions
FROM adwords_v201609.GeoStats_6747157124  AS geo_stats
LEFT JOIN adwords_v201609.geo_criteria_20170420  AS geo_us_state ON geo_stats.RegionCriteriaId = geo_us_state.Criteria_ID AND
      geo_us_state.Parent_ID = 2840 AND geo_us_state.Target_Type = 'State'
LEFT JOIN adwords_v201609.Campaign_6747157124  AS campaign ON geo_stats.CampaignId = campaign.CampaignId AND
      (TIMESTAMP(geo_stats._DATA_DATE)) = (TIMESTAMP(campaign._DATA_DATE))

GROUP BY 1,2,3,4,5
      ;;
    persist_for: "24 hours"
  }
}
