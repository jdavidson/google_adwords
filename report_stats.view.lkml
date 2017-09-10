include: "stats.view.lkml"

view: base_report_stats  {
  extends: [stats]

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
