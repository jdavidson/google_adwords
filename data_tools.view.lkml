view: data_tool_rates {
  derived_table: {
    sql:
      SELECT
      CAST(TIMESTAMP(master_stats._DATA_DATE)  AS DATE) AS master_stats__data_date,
      (COALESCE(SUM(master_stats.Interactions * ((RAND() * 9) + 1) ), 0))*1.0/nullif((COALESCE(SUM(master_stats.Impressions * ((RAND() * 9) + 1) ), 0)),0)  AS master_stats_average_interaction_rate,
      (COALESCE(SUM(master_stats.Conversions * ((RAND() * 9) + 1) ), 0))*1.0 / NULLIF((COALESCE(SUM(master_stats.Clicks * ((RAND() * 9) + 1) ), 0)),0)  AS master_stats_average_conversion_rate,
      (COALESCE(SUM(master_stats.Clicks * ((RAND() * 9) + 1) ), 0))*1.0/nullif((COALESCE(SUM(master_stats.Impressions * ((RAND() * 9) + 1) ), 0)),0)  AS master_stats_average_click_rate
    FROM  adwords_v201609.AccountBasicStats_6747157124 AS master_stats
    GROUP BY 1;;
  }

  dimension_group: event {
    type: time
    sql: TIMESTAMP(${TABLE}.master_stats__data_date) ;;
    timeframes: [date, week, month]
  }

  parameter: time_frame {
    allowed_value: { value: "Date" }
    allowed_value: { value: "Week" }
    allowed_value: { value: "Month" }
  }

  dimension: timeframe {
    sql: CASE
          WHEN {% parameter timeframe_filter %} = 'Date' THEN CAST(${event_date} as STRING)
          WHEN {% parameter timeframe_filter %} = 'Month' THEN ${event_month}
          WHEN {% parameter timeframe_filter %} = 'Week' THEN ${event_week}
          END ;;
    label_from_parameter: time_frame
  }

  parameter: primary_metric_name {
    type: unquoted
    default_value: "master_stats_average_click_rate"
    allowed_value: {
      value: "master_stats_average_click_rate"
      label: "Average Click Rate"
    }
    allowed_value: {
      value: "master_stats_average_interaction_rate"
      label: "Average Interaction Rate"
    }
    allowed_value: {
      value: "master_stats_average_conversion_rate"
      label: "Average Conversion Rate"
    }
  }

  parameter: second_metric_name {
    type: unquoted
    default_value: "master_stats_average_interaction_rate"
    allowed_value: {
      value: "master_stats_average_click_rate"
      label: "Average Click Rate"
    }
    allowed_value: {
      value: "master_stats_average_interaction_rate"
      label: "Average Interaction Rate "
    }
    allowed_value: {
      value: "master_stats_average_conversion_rate"
      label: "Average Conversion Rate"
    }
  }

  measure: primary_metric {
    sql: ${TABLE}.{% parameter primary_metric_name %};;
    type: average
    label_from_parameter: primary_metric_name
    value_format_name: percent_2
  }

  measure: second_metric {
    sql:  ${TABLE}.{% parameter second_metric_name %};;
    type: average
    label_from_parameter: second_metric_name
    value_format_name: percent_2
  }
}


view: data_tool_cost {
  derived_table: {
    sql:
      SELECT
        CAST(TIMESTAMP(master_stats._DATA_DATE)  AS DATE) AS master_stats__data_date,
        (COALESCE(SUM((master_stats.Cost / 1000000) * ((RAND() * 9) + 1) ), 0))*1.0 / NULLIF((COALESCE(SUM(master_stats.Conversions * ((RAND() * 9) + 1) ), 0)),0)  AS master_stats_average_cost_per_conversion,
        (COALESCE(SUM((master_stats.Cost / 1000000) * ((RAND() * 9) + 1) ), 0))*1.0 / NULLIF((COALESCE(SUM(master_stats.Clicks * ((RAND() * 9) + 1) ), 0)),0)  AS master_stats_average_cost_per_click,
        (COALESCE(SUM((master_stats.Cost / 1000000) * ((RAND() * 9) + 1) ), 0))*1.0 / NULLIF((COALESCE(SUM(master_stats.Impressions * ((RAND() * 9) + 1) ), 0)),0)  AS master_stats_average_cost_per_impression,
        (COALESCE(SUM((master_stats.Cost / 1000000) * ((RAND() * 9) + 1) ), 0))*1.0 / NULLIF((COALESCE(SUM(master_stats.Interactions * ((RAND() * 9) + 1) ), 0)),0)  AS master_stats_average_cost_per_interaction
      FROM adwords_v201609.AccountBasicStats_6747157124 AS master_stats
      GROUP BY 1;;
  }

  dimension_group: event {
    type: time
    sql: TIMESTAMP(${TABLE}.master_stats__data_date) ;;
    timeframes: [date, week, month]
  }

  parameter: select_time_frame {
    allowed_value: { value: "Date" }
    allowed_value: { value: "Week" }
    allowed_value: { value: "Month" }
  }

  dimension: time_frame {
    sql: CASE
          WHEN {% parameter select_time_frame %} = 'Date' THEN CAST(${event_date} as STRING)
          WHEN {% parameter select_time_frame %} = 'Month' THEN ${event_month}
          WHEN {% parameter select_time_frame %} = 'Week' THEN ${event_week}
          END ;;
    label_from_parameter: select_time_frame
  }

  parameter: primary_metric_name {
    type: unquoted
    default_value: "master_stats_average_cost_per_conversion"
    allowed_value: {
      value: "master_stats_average_cost_per_conversion"
      label: "Average Cost Per Conversion"
    }
    allowed_value: {
      value: "master_stats_average_cost_per_click"
      label: "Average Cost Per Click"
    }
    allowed_value: {
      value: "master_stats_average_cost_per_impression"
      label: "Average Cost Per Impression"
    }
    allowed_value: {
      value: "master_stats_average_cost_per_interaction"
      label: "Average Cost Per Interaction"
    }
  }

  parameter: second_metric_name {
    type: unquoted
    default_value: "master_stats_average_cost_per_click"
    allowed_value: {
      value: "master_stats_average_cost_per_conversion"
      label: "Average Cost Per Conversion"
    }
    allowed_value: {
      value: "master_stats_average_cost_per_click"
      label: "Average Cost Per Click"
    }
    allowed_value: {
      value: "master_stats_average_cost_per_impression"
      label: "Average Cost Per Impression"
    }
    allowed_value: {
      value: "master_stats_average_cost_per_interaction"
      label: "Average Cost Per Interaction"
    }
  }

  measure: primary_metric {
    sql: ${TABLE}.{% parameter primary_metric_name %};;
    type: average
    label_from_parameter: primary_metric_name
    value_format_name: usd
  }

  measure: second_metric {
    sql:  ${TABLE}.{% parameter second_metric_name %};;
    type: average
    label_from_parameter: second_metric_name
    value_format_name: usd
  }

}
