- dashboard: digital_marketing_application
  title: Digital Marketing Application
  layout: newspaper
  elements:
  - name: Average cost per conversion over time
    title: Average cost per conversion over time
    model: adwords_demo
    explore: account_basic_stats
    type: looker_line
    fields:
    - account_basic_stats.average_cost_per_conversion
    - account_basic_stats._data_week
    sorts:
    - account_basic_stats._data_week desc
    limit: 500
    column_limit: 50
    label: Average Cost per Conversion
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: time
    y_axis_scale_mode: linear
    show_null_points: false
    point_style: none
    interpolation: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    leftAxisLabelVisible: false
    leftAxisLabel: ''
    rightAxisLabelVisible: false
    rightAxisLabel: ''
    barColors:
    - red
    - blue
    smoothedBars: false
    orientation: automatic
    labelPosition: left
    percentType: total
    percentPosition: inline
    valuePosition: right
    labelColorEnabled: false
    labelColor: "#FFF"
    series_types: {}
    show_dropoff: true
    y_axes:
    - label: ''
      maxValue:
      minValue:
      orientation: left
      showLabels: true
      showValues: true
      tickDensity: default
      tickDensityCustom: 5
      type: log
      unpinAxis: false
      valueFormat:
      series:
      - id: account_basic_stats.total_impressions
        name: Campaign Stats Total Impressions
      - id: account_basic_stats.total_interactions
        name: Campaign Stats Total Interactions
      - id: account_basic_stats.total_conversions
        name: Campaign Stats Total Conversions
    discontinuous_nulls: false
    focus_on_hover: false
    reference_lines: []
    trend_lines:
    - color: "#000000"
      label_position: right
      period: 7
      regression_type: linear
      series_index: 1
      show_label: false
      label_type: string
    row: 4
    col: 0
    width: 24
    height: 5
  - name: Device network multiples
    title: Device network multiples
    model: adwords_demo
    explore: account_basic_stats
    type: looker_donut_multiples
    fields:
    - account_basic_stats.device_type
    - account_basic_stats.total_cost_usd
    - account_basic_stats.ad_network_type
    pivots:
    - account_basic_stats.ad_network_type
    filters:
      account_basic_stats.ad_network_type: "-Other"
      account_basic_stats.device_type: "-Unknown"
    sorts:
    - account_basic_stats.total_cost_usd desc 0
    - account_basic_stats.ad_network_type
    limit: 500
    column_limit: 50
    show_value_labels: false
    font_size: 12
    value_labels: legend
    label_type: labPer
    label: Funnel by device
    stacking: ''
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    leftAxisLabelVisible: false
    leftAxisLabel: ''
    rightAxisLabelVisible: false
    rightAxisLabel: ''
    barColors:
    - red
    - blue
    smoothedBars: false
    orientation: automatic
    labelPosition: left
    percentType: total
    percentPosition: inline
    valuePosition: right
    labelColorEnabled: false
    labelColor: "#FFF"
    series_types: {}
    show_dropoff: true
    y_axes:
    - label: ''
      maxValue:
      minValue:
      orientation: left
      showLabels: true
      showValues: true
      tickDensity: default
      tickDensityCustom: 5
      type: log
      unpinAxis: false
      valueFormat:
      series:
      - id: account_basic_stats.total_impressions
        name: Campaign Stats Total Impressions
      - id: account_basic_stats.total_interactions
        name: Campaign Stats Total Interactions
        name: Campaign Stats Total Conversions
    row: 9
    col: 12
    width: 12
    height: 7
  - name: Campaign details
    title: Campaign details
    model: adwords_demo
    explore: campaign_basic_stats
    type: table
    fields:
    - campaign.campaign_name
    - campaign_basic_stats.total_impressions
    - campaign_basic_stats.total_interactions
    - campaign_basic_stats.total_conversions
    - campaign_basic_stats.total_cost_usd
    - campaign_basic_stats.average_interaction_rate
    - campaign_basic_stats.average_cost_per_click
    - campaign_basic_stats.average_conversion_rate
    - campaign_basic_stats.average_cost_per_conversion
    sorts:
    - campaign_basic_stats.total_cost_usd desc
    limit: 10
    column_limit: 50
    label: Campaign Details
    query_timezone: America/Los_Angeles
    show_view_names: false
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: white
    limit_displayed_rows: false
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    enable_conditional_formatting: false
    conditional_formatting_ignored_fields: []
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    hidden_fields:
    - campaign_basic_stats.total_interactions
    - campaign_basic_stats.total_conversions
    - campaign_basic_stats.total_impressions
    row: 9
    col: 0
    width: 12
    height: 7
#   - name: Ad spend qtd
#     title: Ad spend qtd
#     model: adwords_demo
#     explore: account_quarter_stats
#     type: single_value
#     fields:
#     - account_quarter_stats.total_cost_usd
#     - account_quarter_stats._data_quarter
#     - last_account_quarter_stats.total_cost_usd
#     fill_fields:
#     - account_quarter_stats._data_quarter
#     sorts:
#     - account_quarter_stats._data_quarter desc
#     limit: 500
#     column_limit: 50
#     dynamic_fields:
#     - table_calculation: quarterly_change
#       label: Quarterly Change
#       expression: "${account_quarter_stats.total_cost_usd} - ${last_account_quarter_stats.total_cost_usd}\n"
#       value_format:
#       value_format_name: usd_0
#     hidden_fields:
#     - last_account_quarter_stats.total_cost_usd
#     label: Ad Spend QTD
#     query_timezone: America/Los_Angeles
#     custom_color_enabled: false
#     custom_color: forestgreen
#     show_single_value_title: true
#     show_comparison: true
#     comparison_type: change
#     comparison_reverse_colors: false
#     show_comparison_label: false
#     stacking: ''
#     show_value_labels: false
#     label_density: 25
#     legend_position: center
#     x_axis_gridlines: false
#     y_axis_gridlines: true
#     show_view_names: false
#     limit_displayed_rows: false
#     y_axis_combined: true
#     show_y_axis_labels: true
#     show_y_axis_ticks: true
#     y_axis_tick_density: default
#     y_axis_tick_density_custom: 5
#     show_x_axis_label: true
#     show_x_axis_ticks: true
#     x_axis_scale: auto
#     y_axis_scale_mode: linear
#     ordering: none
#     show_null_labels: false
#     show_totals_labels: false
#     show_silhouette: false
#     totals_color: "#808080"
#     series_types: {}
#     single_value_title: Spend QTD
#     comparison_label: ''
#     row: 0
#     col: 0
#     width: 12
#     height: 2
#   - name: Cost per conversion qtd
#     title: Cost per conversion qtd
#     model: adwords_demo
#     explore: account_quarter_stats
#     type: single_value
#     fields:
#     - account_quarter_stats._data_quarter
#     - account_quarter_stats.average_cost_per_conversion
#     - last_account_quarter_stats.average_cost_per_conversion
#     fill_fields:
#     - account_quarter_stats._data_quarter
#     sorts:
#     - account_quarter_stats._data_quarter desc
#     limit: 500
#     column_limit: 50
#     dynamic_fields:
#     - table_calculation: quarterly_change
#       label: Quarterly % Change
#       expression: "(${account_quarter_stats.average_cost_per_conversion} -  ${last_account_quarter_stats.average_cost_per_conversion})/${last_account_quarter_stats.average_cost_per_conversion}\n"
#       value_format:
#       value_format_name: percent_0
#     hidden_fields:
#     - last_account_quarter_stats.average_cost_per_conversion
#     label: Cost per Conversion QTD
#     query_timezone: America/Los_Angeles
#     custom_color_enabled: false
#     custom_color: forestgreen
#     show_single_value_title: true
#     show_comparison: true
#     comparison_type: change
#     comparison_reverse_colors: true
#     show_comparison_label: false
#     stacking: ''
#     show_value_labels: false
#     label_density: 25
#     legend_position: center
#     x_axis_gridlines: false
#     y_axis_gridlines: true
#     show_view_names: false
#     limit_displayed_rows: false
#     y_axis_combined: true
#     show_y_axis_labels: true
#     show_y_axis_ticks: true
#     y_axis_tick_density: default
#     y_axis_tick_density_custom: 5
#     show_x_axis_label: true
#     show_x_axis_ticks: true
#     x_axis_scale: auto
#     y_axis_scale_mode: linear
#     ordering: none
#     show_null_labels: false
#     show_totals_labels: false
#     show_silhouette: false
#     totals_color: "#808080"
#     series_types: {}
#     single_value_title: Cost per Conversion QTD
#     comparison_label: ''
#     row: 2
#     col: 0
#     width: 6
#     height: 2
#   - name: Conversion rate qtd
#     title: Conversion rate qtd
#     model: adwords_demo
#     explore: account_quarter_stats
#     type: single_value
#     fields:
#     - account_quarter_stats._data_quarter
#     - account_quarter_stats.average_conversion_rate
#     - last_account_quarter_stats.average_conversion_rate
#     fill_fields:
#     - account_quarter_stats._data_quarter
#     sorts:
#     - account_quarter_stats._data_quarter desc
#     limit: 500
#     column_limit: 50
#     dynamic_fields:
#     - table_calculation: quarterly_change
#       label: Quarterly % Change
#       expression: "(${account_quarter_stats.average_conversion_rate} - ${last_account_quarter_stats.average_conversion_rate})/${last_account_quarter_stats.average_conversion_rate}\n"
#       value_format:
#       value_format_name: percent_0
#     hidden_fields:
#     - last_account_quarter_stats.average_conversion_rate
#     label: Conversion Rate QTD
#     query_timezone: America/Los_Angeles
#     custom_color_enabled: false
#     custom_color: forestgreen
#     show_single_value_title: true
#     show_comparison: true
#     comparison_type: change
#     comparison_reverse_colors: false
#     show_comparison_label: false
#     stacking: ''
#     show_value_labels: false
#     label_density: 25
#     legend_position: center
#     x_axis_gridlines: false
#     y_axis_gridlines: true
#     show_view_names: false
#     limit_displayed_rows: false
#     y_axis_combined: true
#     show_y_axis_labels: true
#     show_y_axis_ticks: true
#     y_axis_tick_density: default
#     y_axis_tick_density_custom: 5
#     show_x_axis_label: true
#     show_x_axis_ticks: true
#     x_axis_scale: auto
#     y_axis_scale_mode: linear
#     ordering: none
#     show_null_labels: false
#     show_totals_labels: false
#     show_silhouette: false
#     totals_color: "#808080"
#     series_types: {}
#     single_value_title: Conversion Rate QTD
#     comparison_label: ''
#     row: 2
#     col: 6
#     width: 6
#     height: 2
#   - name: Conversions qtd
#     title: Conversions qtd
#     model: adwords_demo
#     explore: account_quarter_stats
#     type: single_value
#     fields:
#     - account_quarter_stats._data_quarter
#     - account_quarter_stats.total_conversions
#     - last_account_quarter_stats.total_conversions
#     fill_fields:
#     - account_quarter_stats._data_quarter
#     sorts:
#     - account_quarter_stats._data_quarter desc
#     limit: 500
#     column_limit: 50
#     dynamic_fields:
#     - table_calculation: quarterly_change
#       label: Quarterly Change
#       expression: "${account_quarter_stats.total_conversions} - ${last_account_quarter_stats.total_conversions}\n"
#       value_format:
#       value_format_name:
#     hidden_fields:
#     - last_account_quarter_stats.total_conversions
#     label: Conversions QTD
#     query_timezone: America/Los_Angeles
#     custom_color_enabled: false
#     custom_color: forestgreen
#     show_single_value_title: true
#     show_comparison: true
#     comparison_type: change
#     comparison_reverse_colors: false
#     show_comparison_label: false
#     stacking: ''
#     show_value_labels: false
#     label_density: 25
#     legend_position: center
#     x_axis_gridlines: false
#     y_axis_gridlines: true
#     show_view_names: false
#     limit_displayed_rows: false
#     y_axis_combined: true
#     show_y_axis_labels: true
#     show_y_axis_ticks: true
#     y_axis_tick_density: default
#     y_axis_tick_density_custom: 5
#     show_x_axis_label: true
#     show_x_axis_ticks: true
#     x_axis_scale: auto
#     y_axis_scale_mode: linear
#     ordering: none
#     show_null_labels: false
#     show_totals_labels: false
#     show_silhouette: false
#     totals_color: "#808080"
#     series_types: {}
#     single_value_title: Conversions QTD
#     comparison_label: ''
#     row: 0
#     col: 12
#     width: 12
#     height: 2
#   - name: Interaction rate qtd
#     title: Interaction rate qtd
#     model: adwords_demo
#     explore: account_quarter_stats
#     type: single_value
#     fields:
#     - account_quarter_stats._data_quarter
#     - account_quarter_stats.average_interaction_rate
#     - last_account_quarter_stats.average_interaction_rate
#     fill_fields:
#     - account_quarter_stats._data_quarter
#     sorts:
#     - account_quarter_stats._data_quarter desc
#     limit: 500
#     column_limit: 50
#     dynamic_fields:
#     - table_calculation: quarterly_change
#       label: Quarterly % Change
#       expression: "(${account_quarter_stats.average_interaction_rate} - ${last_account_quarter_stats.average_interaction_rate}\
#         \ )/${last_account_quarter_stats.average_interaction_rate}\n"
#       value_format:
#       value_format_name: percent_0
#     hidden_fields:
#     - last_account_quarter_stats.average_interaction_rate
#     label: Interaction Rate QTD
#     query_timezone: America/Los_Angeles
#     custom_color_enabled: false
#     custom_color: forestgreen
#     show_single_value_title: true
#     show_comparison: true
#     comparison_type: change
#     comparison_reverse_colors: false
#     show_comparison_label: false
#     stacking: ''
#     show_value_labels: false
#     label_density: 25
#     legend_position: center
#     x_axis_gridlines: false
#     y_axis_gridlines: true
#     show_view_names: false
#     limit_displayed_rows: false
#     y_axis_combined: true
#     show_y_axis_labels: true
#     show_y_axis_ticks: true
#     y_axis_tick_density: default
#     y_axis_tick_density_custom: 5
#     show_x_axis_label: true
#     show_x_axis_ticks: true
#     x_axis_scale: auto
#     y_axis_scale_mode: linear
#     ordering: none
#     show_null_labels: false
#     show_totals_labels: false
#     show_silhouette: false
#     totals_color: "#808080"
#     series_types: {}
#     single_value_title: Interaction Rate QTD
#     comparison_label: ''
#     row: 2
#     col: 18
#     width: 6
#     height: 2
#   - name: Cost per interaction qtd
#     title: Cost per interaction qtd
#     model: adwords_demo
#     explore: account_quarter_stats
#     type: single_value
#     fields:
#     - account_quarter_stats._data_quarter
#     - account_quarter_stats.average_cost_per_interaction
#     - last_account_quarter_stats.average_cost_per_interaction
#     fill_fields:
#     - account_quarter_stats._data_quarter
#     sorts:
#     - account_quarter_stats._data_quarter desc
#     limit: 500
#     column_limit: 50
#     dynamic_fields:
#     - table_calculation: quarterly_change
#       label: Quarterly % Change
#       expression: "(${account_quarter_stats.average_cost_per_interaction} - ${last_account_quarter_stats.average_cost_per_interaction})/${last_account_quarter_stats.average_cost_per_interaction}\n"
#       value_format:
#       value_format_name: percent_0
#     hidden_fields:
#     - last_account_quarter_stats.average_cost_per_interaction
#     label: Cost per Interaction QTD
#     query_timezone: America/Los_Angeles
#     custom_color_enabled: false
#     custom_color: forestgreen
#     show_single_value_title: true
#     show_comparison: true
#     comparison_type: change
#     comparison_reverse_colors: false
#     show_comparison_label: false
#     stacking: ''
#     show_value_labels: false
#     label_density: 25
#     legend_position: center
#     x_axis_gridlines: false
#     y_axis_gridlines: true
#     show_view_names: false
#     limit_displayed_rows: false
#     y_axis_combined: true
#     show_y_axis_labels: true
#     show_y_axis_ticks: true
#     y_axis_tick_density: default
#     y_axis_tick_density_custom: 5
#     show_x_axis_label: true
#     show_x_axis_ticks: true
#     x_axis_scale: auto
#     y_axis_scale_mode: linear
#     ordering: none
#     show_null_labels: false
#     show_totals_labels: false
#     show_silhouette: false
#     totals_color: "#808080"
#     series_types: {}
#     single_value_title: Cost per Interaction QTD
#     comparison_label: ''
#     row: 2
#     col: 12
#     width: 6
#     height: 2
#   - name: us_map
#     title: US Map
#     model: adwords_demo
#     explore: account_basic_stats
#     type: looker_geo_choropleth
#     fields: [geo_us_state.name, account_basic_stats.average_cost_per_conversion]
#     sorts: [account_basic_stats.average_cost_per_conversion desc]
#     limit: 500
#     column_limit: 50
#     map: auto
#     map_projection: ''
#     show_view_names: true
#     quantize_colors: false
#     stacking: ''
#     show_value_labels: false
#     label_density: 25
#     legend_position: center
#     x_axis_gridlines: false
#     y_axis_gridlines: true
#     limit_displayed_rows: false
#     y_axis_combined: true
#     show_y_axis_labels: true
#     show_y_axis_ticks: true
#     y_axis_tick_density: default
#     y_axis_tick_density_custom: 5
#     show_x_axis_label: true
#     show_x_axis_ticks: true
#     x_axis_scale: auto
#     y_axis_scale_mode: linear
#     ordering: none
#     show_null_labels: false
#     show_totals_labels: false
#     show_silhouette: false
#     totals_color: "#808080"
#     series_types: {}
  - name: interaction_rate_over_time
    title: Interaction Rate
    model: adwords_demo
    explore: account_basic_stats
    type: looker_area
    fields: [account_basic_stats._data_week, account_basic_stats.average_interaction_rate]
    fill_fields: [account_basic_stats._data_week]
    sorts: [account_basic_stats._data_week desc]
    limit: 500
    column_limit: 50
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    show_null_points: true
    point_style: none
    interpolation: linear
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    ordering: none
    show_null_labels: false
    series_types: {}
  - name: cost_per_interaction_over_time
    title: Cost per Interaction
    model: adwords_demo
    explore: account_basic_stats
    type: looker_area
    fields: [account_basic_stats._data_week, account_basic_stats.average_cost_per_interaction]
    fill_fields: [account_basic_stats._data_week]
    sorts: [account_basic_stats._data_week desc]
    limit: 500
    column_limit: 50
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    show_null_points: true
    point_style: none
    interpolation: linear
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    ordering: none
    show_null_labels: false
    series_types: {}
  - name: conversion_rate_over_time
    title: Conversion Rate
    model: adwords_demo
    explore: account_basic_stats
    type: looker_area
    fields: [account_basic_stats._data_week, account_basic_stats.average_conversion_rate]
    fill_fields: [account_basic_stats._data_week]
    sorts: [account_basic_stats._data_week desc]
    limit: 500
    column_limit: 50
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    show_null_points: true
    point_style: none
    interpolation: linear
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    ordering: none
    show_null_labels: false
    series_types: {}
  - name: cost_per_conversion_over_time
    title: Cost per Conversion
    model: adwords_demo
    explore: account_basic_stats
    type: looker_area
    fields: [account_basic_stats._data_week, account_basic_stats.average_cost_per_conversion]
    fill_fields: [account_basic_stats._data_week]
    sorts: [account_basic_stats._data_week desc]
    limit: 500
    column_limit: 50
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    show_null_points: true
    point_style: none
    interpolation: linear
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    ordering: none
    show_null_labels: false
    series_types: {}
  - name: conversions_over_time
    title: Conversions
    model: adwords_demo
    explore: account_basic_stats
    type: looker_area
    fields: [account_basic_stats._data_week, account_basic_stats.total_conversions]
    fill_fields: [account_basic_stats._data_week]
    sorts: [account_basic_stats._data_week desc]
    limit: 500
    column_limit: 50
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    show_null_points: true
    point_style: none
    interpolation: linear
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    ordering: none
    show_null_labels: false
    series_types: {}
  - name: spend_over_time
    title: Spend
    model: adwords_demo
    explore: account_basic_stats
    type: looker_area
    fields: [account_basic_stats._data_week, account_basic_stats.total_cost_usd]
    fill_fields: [account_basic_stats._data_week]
    sorts: [account_basic_stats._data_week desc]
    limit: 500
    column_limit: 50
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    show_null_points: true
    point_style: none
    interpolation: linear
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    ordering: none
    show_null_labels: false
    series_types: {}