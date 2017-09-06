- dashboard: digital_marketing
  title: Digital Marketing
  layout: newspaper
  elements:
  - name: spend
    title: Spend QTD
    model: google_adwords
    explore: report_stats
    type: single_value
    fields: [report_stats.month, report_stats.total_cost_usd]
    sorts: [report_stats.month desc]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - table_calculation: delta
      label: Delta
      expression: "(${report_stats.total_cost_usd} - offset(${report_stats.total_cost_usd},1))"
      value_format:
      value_format_name: percent_0
      _kind_hint: measure
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: true
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
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
  - name: spend_over_time
    title: ""
    model: google_adwords
    explore: report_stats
    type: looker_area
    fields: [report_stats.month, report_stats.total_cost_usd]
    sorts: [report_stats.month]
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

  - name: conversions
    title: Conversions
    model: google_adwords
    explore: report_stats
    type: single_value
    fields: [report_stats.month, report_stats.total_conversions]
    sorts: [report_stats.month desc]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - table_calculation: delta
      label: Delta
      expression: "(${report_stats.total_conversions} - offset(${report_stats.total_conversions},1))"
      value_format:
      value_format_name: percent_0
      _kind_hint: measure
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: true
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
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
  - name: conversions_over_time
    title: ""
    model: google_adwords
    explore: report_stats
    type: looker_area
    fields: [report_stats.month, report_stats.total_conversions]
    sorts: [report_stats.month]
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

  - name: cost_per_conversion
    title: Cost per Conversions
    model: google_adwords
    explore: report_stats
    type: single_value
    fields: [report_stats.month, report_stats.average_cost_per_conversion]
    sorts: [report_stats.month desc]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - table_calculation: delta
      label: Delta
      expression: "(${report_stats.average_cost_per_conversion} - offset(${report_stats.average_cost_per_conversion},1))\
        \ / offset(${report_stats.average_cost_per_conversion},1)"
      value_format:
      value_format_name: percent_0
      _kind_hint: measure
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: true
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
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
  - name: cost_per_conversion_over_time
    title: Cost per Conversion
    model: google_adwords
    explore: report_stats
    type: looker_area
    fields: [report_stats.month, report_stats.average_cost_per_conversion]
    sorts: [report_stats.month]
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


  - name: conversion_rate
    title: ""
    model: google_adwords
    explore: report_stats
    type: single_value
    fields: [report_stats.month, report_stats.average_conversion_rate]
    sorts: [report_stats.month desc]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - table_calculation: delta
      label: Delta
      expression: "(${report_stats.average_conversion_rate} - offset(${report_stats.average_conversion_rate},1))\
        \ / offset(${report_stats.average_conversion_rate},1)"
      value_format:
      value_format_name: percent_0
      _kind_hint: measure
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: true
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
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
  - name: conversion_rate_over_time
    title: Conversion Rate
    model: google_adwords
    explore: report_stats
    type: looker_area
    fields: [report_stats.month, report_stats.average_conversion_rate]
    sorts: [report_stats.month]
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

  - name: cost_per_interaction
    title: Cost per Interaction
    model: google_adwords
    explore: report_stats
    type: single_value
    fields: [report_stats.month, report_stats.average_cost_per_interaction]
    sorts: [report_stats.month desc]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - table_calculation: delta
      label: Delta
      expression: "(${report_stats.average_cost_per_interaction} - offset(${report_stats.average_cost_per_interaction},1))\
        \ / offset(${report_stats.average_cost_per_interaction},1)"
      value_format:
      value_format_name: percent_0
      _kind_hint: measure
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: true
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
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
  - name: cost_per_interaction_over_time
    title: ""
    model: google_adwords
    explore: report_stats
    type: looker_area
    fields: [report_stats.month, report_stats.average_cost_per_interaction]
    sorts: [report_stats.month]
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

  - name: interaction_rate
    title: Interaction Rate
    model: google_adwords
    explore: report_stats
    type: single_value
    fields: [report_stats.month, report_stats.average_interaction_rate]
    sorts: [report_stats.month desc]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - table_calculation: delta
      label: Delta
      expression: "(${report_stats.average_interaction_rate} - offset(${report_stats.average_interaction_rate},1))\
        \ / offset(${report_stats.average_interaction_rate},1)"
      value_format:
      value_format_name: percent_0
      _kind_hint: measure
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: true
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
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
  - name: interaction_rate_over_time
    title: ""
    model: google_adwords
    explore: report_stats
    type: looker_area
    fields: [report_stats.month, report_stats.average_interaction_rate]
    sorts: [report_stats.month]
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

  - name: us_map
    title: US Map
    model: google_adwords
    explore: report_stats
    type: looker_geo_choropleth
    fields: [report_stats.average_cost_per_conversion, report_stats.state]
    limit: 500
    column_limit: 50
    map: auto
    map_projection: ''
    show_view_names: true
    quantize_colors: false
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
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
    series_types: {}
  - name: device
    title: Device
    model: google_adwords
    explore: report_stats
    type: looker_pie
    fields: [report_stats.device, report_stats.total_conversions]
    filters:
      report_stats.device: "-Unknown"
    sorts: [report_stats.total_conversions desc]
    limit: 500
    column_limit: 50
    value_labels: legend
    label_type: labPer
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
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    hidden_fields:
    series_types: {}
  - name: funnel
    title: Funnel
    model: google_adwords
    explore: report_stats
    type: looker_column
    fields: [report_stats.adnetworktype, report_stats.total_impressions, report_stats.total_interactions,
      report_stats.total_conversions]
    filters:
      report_stats.adnetworktype: "-Other"
    sorts: [report_stats.total_conversions desc]
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
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    leftAxisLabelVisible: false
    leftAxisLabel: ''
    rightAxisLabelVisible: false
    rightAxisLabel: ''
    barColors: [red, blue]
    smoothedBars: false
    orientation: automatic
    labelPosition: left
    percentType: total
    percentPosition: inline
    valuePosition: right
    labelColorEnabled: false
    labelColor: "#FFF"
    value_labels: legend
    label_type: labPer
    hidden_fields:
    series_types: {}
    show_dropoff: true
    y_axes: [{label: '', maxValue: !!null '', minValue: !!null '', orientation: left,
        showLabels: true, showValues: true, tickDensity: default, tickDensityCustom: 5,
        type: log, unpinAxis: false, valueFormat: !!null '', series: [{id: report_stats.total_impressions,
            name: Report Stats Total Impressions}, {id: report_stats.total_interactions,
            name: Report Stats Total Interactions}, {id: report_stats.total_cost_usd,
            name: Report Stats Total Cost USD}]}]

  - name: campaign_details
    title: Campaign Details
    model: google_adwords
    explore: report_stats
    type: table
    fields: [report_stats.total_cost_usd, report_stats.total_conversions, report_stats.average_cost_per_conversion,
      report_stats.campaignname]
    sorts: [report_stats.total_cost_usd desc]
    limit: 10
    column_limit: 50
    show_view_names: true
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    conditional_formatting_ignored_fields: []
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: true
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
