- dashboard: sales_manager
  title: Sales Manager
  layout: newspaper
  preferred_viewer: dashboards
  elements:
  - title: All Teams - Tracking to License Quota
    name: All Teams - Tracking to License Quota
    model: sfdc_demo
    explore: company_goals
    type: looker_column
    fields: [sales_rep.segment_region, opportunity_line_item.closed_won_arr, opportunity.team_license_goal]
    filters:
      opportunity.opportunity_closed_in_period: Current Period
      sales_rep.sales_team: Inside,Outside
    sorts: [opportunity_line_item.closed_won_arr desc]
    limit: 500
    dynamic_fields: [{measure: team_booking_goal, based_on: opportunity.license_goal,
        type: max, label: Team Booking Goal, expression: !!null '', value_format: !!null '',
        value_format_name: !!null '', _kind_hint: measure, _type_hint: number}]
    query_timezone: America/Los_Angeles
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: circle_outline
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    color_application:
      collection_id: f14810d2-98d7-42df-82d0-bc185a074e42
      palette_id: 89f8fd99-5003-4efd-ae1a-ae0aa28825ca
      options:
        steps: 5
    y_axes: [{label: '', orientation: left, series: [{axisId: opportunity.team_license_goal,
            id: opportunity.team_license_goal, name: Team License Goal}, {axisId: opportunity_line_item.closed_won_arr,
            id: opportunity_line_item.closed_won_arr, name: Won ARR}], showLabels: false,
        showValues: true, unpinAxis: false, tickDensity: default, type: linear}]
    size_by_field: opportunity.team_license_goal
    series_types:
      team_booking_goal: scatter
      opportunity.team_license_goal: scatter
    series_colors:
      team_booking_goal: "#E57947"
      opportunity_line_item.closed_won_arr: "#2196F3"
      opportunity.team_license_goal: "#E57947"
    series_point_styles:
      team_booking_goal: square
    defaults_version: 1
    hidden_fields: []
    listen:
      Time Period: opportunity.time_period_filter
    row: 3
    col: 12
    width: 12
    height: 8
  - name: Team Quota Progress
    title: Team Quota Progress
    type: text
    title_text: Team Quota Progress
    subtitle_text: How is our team tracking towards goals?
    body_text: "<div class='alert alert-info' role='alert'>Use<i>time period</i> to toggle between annual and quarterly attainment'</div>"
    row: 0
    col: 0
    width: 24
    height: 3
  - name: Pipeline Health
    title: Pipeline Health
    type: text
    title_text: Pipeline Health
    subtitle_text: How does the pipeline for our team look?
    row: 22
    col: 0
    width: 24
    height: 4
  - name: Individual Performance
    title: Individual Performance
    type: text
    title_text: Individual Performance
    subtitle_text: Which individuals need extra assistance?
    row: 34
    col: 0
    width: 24
    height: 4
  - title: Attainment
    name: Attainment
    model: sfdc_demo
    explore: company_goals
    type: looker_bar
    fields: [opportunity_line_item.closed_won_arr, opportunity_line_item.upside_arr,
      opportunity_line_item.forecast_arr, opportunity_line_item.pipeline_arr, opportunity.license_goal]
    filters:
      opportunity.stage_name: "-Closed Lost"
      opportunity.opportunity_closed_in_period: Current Period
    sorts: [opportunity_line_item.closed_won_arr desc]
    limit: 500
    column_limit: 50
    dynamic_fields: [{table_calculation: won, label: "% Won", expression: "${opportunity_line_item.closed_won_arr}/${opportunity.license_goal}",
        value_format: !!null '', value_format_name: percent_1, _kind_hint: measure,
        _type_hint: number}, {table_calculation: upside, label: "% Upside", expression: "${opportunity_line_item.upside_arr}/${opportunity.license_goal}",
        value_format: !!null '', value_format_name: percent_1, _kind_hint: measure,
        _type_hint: number}, {table_calculation: forecast, label: "% Forecast", expression: "${opportunity_line_item.forecast_arr}/${opportunity.license_goal}",
        value_format: !!null '', value_format_name: percent_1, _kind_hint: measure,
        _type_hint: number}, {table_calculation: pipeline, label: "% Pipeline", expression: "${opportunity_line_item.pipeline_arr}/${opportunity.license_goal}",
        value_format: !!null '', value_format_name: percent_1, _kind_hint: measure,
        _type_hint: number}]
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: false
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: normal
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    color_application:
      collection_id: f14810d2-98d7-42df-82d0-bc185a074e42
      palette_id: 89f8fd99-5003-4efd-ae1a-ae0aa28825ca
      options:
        steps: 5
    y_axes: [{label: '', orientation: bottom, series: [{axisId: won, id: won, name: "%\
              \ Won"}, {axisId: upside, id: upside, name: "% Upside"}, {axisId: forecast,
            id: forecast, name: "% Forecast"}, {axisId: pipeline, id: pipeline, name: "%\
              \ Pipeline"}], showLabels: false, showValues: false, maxValue: 1.2,
        minValue: 0, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    hidden_series: [pipeline, forecast]
    series_types: {}
    reference_lines: [{reference_type: line, range_start: max, range_end: min, margin_top: deviation,
        margin_value: mean, margin_bottom: deviation, label_position: right, color: "#000000",
        line_value: '1', label: 100%}, {reference_type: line, range_start: max, range_end: min,
        margin_top: deviation, margin_value: mean, margin_bottom: deviation, label_position: right,
        color: "#000000", line_value: '1.15', label: 115%}]
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: progress_percentage
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    hidden_fields: [sales_rep.quarterly_quota, opportunity_line_item.closed_won_arr,
      opportunity_line_item.upside_arr, opportunity_line_item.forecast_arr, opportunity_line_item.pipeline_arr,
      opportunity.license_goal]
    listen:
      Sales Team Segment: sales_rep.sales_team
      Sales Team Region: sales_rep.region
      Time Period: opportunity.time_period_filter
    row: 11
    col: 12
    width: 12
    height: 5
  - title: Days Left in Q
    name: Days Left in Q
    model: sfdc_demo
    explore: company_goals
    type: single_value
    fields: [calendar.current_days_left_in_period, calendar.time_period]
    filters: {}
    sorts: [calendar.time_period]
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: false
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    value_format: '0'
    comparison_label: Remaining Days
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    series_types: {}
    listen:
      Time Period: opportunity.time_period_filter
    row: 3
    col: 0
    width: 12
    height: 2
  - name: ''
    title: ''
    type: text
    title_text: ''
    body_text: |-
      <div class='alert alert-info'><font color='#282828' size='5'><center><b>ARR</b></center></font></div>
    row: 5
    col: 0
    width: 6
    height: 2
  - title: New ARR
    name: New ARR
    model: sfdc_demo
    explore: company_goals
    type: single_value
    fields: [opportunity_line_item.closed_won_arr]
    filters:
      opportunity.stage_name: ''
      opportunity.opportunity_closed_in_period: Current Period
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: false
    show_comparison: false
    comparison_type: progress_percentage
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#2196F3"
    value_format: ''
    comparison_label: Quarter Goal
    defaults_version: 1
    note_state: collapsed
    note_display: below
    note_text: Closed This Period
    listen:
      Sales Team Segment: sales_rep.sales_team
      Sales Team Region: sales_rep.region
      Time Period: opportunity.time_period_filter
    row: 13
    col: 0
    width: 6
    height: 3
  - title: License Attainment
    name: License Attainment
    model: sfdc_demo
    explore: company_goals
    type: marketplace_viz_liquid_fill_gauge::liquid_fill_gauge-marketplace
    fields: [opportunity.percent_arr_attainment]
    filters:
      opportunity.opportunity_closed_in_period: Current Period
    limit: 500
    column_limit: 50
    dynamic_fields: [{table_calculation: attainment, label: Attainment %, expression: "(${opportunity_line_item.total_arr}/${opportunity.license_goal})*100",
        value_format: !!null '', value_format_name: decimal_0, _kind_hint: measure,
        _type_hint: number, is_disabled: true}]
    hidden_fields: [goals.team_booking_goal]
    hidden_points_if_no: []
    series_labels: {}
    show_view_names: true
    showComparison: false
    minValue: 0
    maxValue: 1
    circleThickness: 0.05
    circleFillGap: 0.05
    circleColor: "#2196F3"
    waveHeight: 0.05
    waveCount: 1
    waveRiseTime: 1000
    waveAnimateTime: 1800
    waveRise: true
    waveHeightScaling: true
    waveAnimate: true
    waveColor: "#E57947"
    waveOffset: 0
    textVertPosition: 0.5
    textSize: 0.86
    valueCountUp: true
    displayPercent: true
    textColor: "#000000"
    waveTextColor: "#FFFFFF"
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: progress_percentage
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    value_format: ''
    comparison_label: Quarter Goal
    defaults_version: 0
    series_types: {}
    title_hidden: true
    listen:
      Sales Team Segment: sales_rep.sales_team
      Sales Team Region: sales_rep.region
      Time Period: opportunity.time_period_filter
    row: 7
    col: 0
    width: 6
    height: 6
  - name: " (2)"
    title: " (2)"
    type: text
    title_text: ''
    body_text: |-
      <div class='alert alert-info'><font color='#282828' size='5'><center><b>NRR</b></center></font></div>
    row: 5
    col: 6
    width: 6
    height: 2
  - title: New NRR
    name: New NRR
    model: sfdc_demo
    explore: company_goals
    type: single_value
    fields: [opportunity_line_item.closed_won_nrr]
    filters:
      opportunity.opportunity_closed_in_period: Current Period
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: false
    show_comparison: false
    comparison_type: progress_percentage
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#2196F3"
    value_format: ''
    comparison_label: Quarter Goal
    defaults_version: 1
    note_state: collapsed
    note_display: below
    note_text: Closed This Period
    listen:
      Sales Team Segment: sales_rep.sales_team
      Sales Team Region: sales_rep.region
      Time Period: opportunity.time_period_filter
    row: 13
    col: 6
    width: 6
    height: 3
  - name: Opportunities
    title: Opportunities
    type: text
    title_text: Opportunities
    subtitle_text: Opportunities that may need some attention
    row: 61
    col: 0
    width: 24
    height: 4
  - title: ACV by Stage Name
    name: ACV by Stage Name
    model: sfdc_demo
    explore: opportunity_line_item
    type: looker_bar
    fields: [opportunity.total_amount, opportunity.stage_name, opportunity.count]
    filters:
      opportunity.type: New Business,Addon/Upsell
      opportunity.stage_name: "-Closed Won,-Closed Lost,-Active Lead"
      opportunity.forecast_category: "-Omitted"
    sorts: [opportunity.stage_name desc]
    limit: 500
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: circle
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    color_application:
      collection_id: f14810d2-98d7-42df-82d0-bc185a074e42
      palette_id: 89f8fd99-5003-4efd-ae1a-ae0aa28825ca
      options:
        steps: 5
    y_axes: [{label: !!null '', orientation: top, series: [{axisId: opportunity.count,
            id: opportunity.count, name: Number of Opportunities}], showLabels: false,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}, {label: '', orientation: bottom, series: [{axisId: opportunity.total_amount,
            id: opportunity.total_amount, name: Total ACV}], showLabels: false, showValues: true,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}]
    size_by_field: opportunity.count
    series_types:
      opportunity.count: scatter
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    listen:
      Sales Team Segment: sales_rep.sales_team
      Sales Team Region: sales_rep.region
    row: 26
    col: 5
    width: 12
    height: 8
  - title: ACV by Forecast
    name: ACV by Forecast
    model: sfdc_demo
    explore: opportunity_line_item
    type: looker_column
    fields: [opportunity.forecast_category, opportunity.total_amount, opportunity.count]
    filters:
      opportunity.type: New Business,Addon/Upsell
      opportunity.stage_name: "-Closed Won,-Closed Lost"
      opportunity.forecast_category: "-Omitted"
    sorts: [opportunity.total_amount desc]
    limit: 500
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    color_application:
      collection_id: f14810d2-98d7-42df-82d0-bc185a074e42
      palette_id: 89f8fd99-5003-4efd-ae1a-ae0aa28825ca
      options:
        steps: 5
    y_axes: [{label: '', orientation: left, series: [{axisId: opportunity.total_amount,
            id: opportunity.total_amount, name: Total ACV}], showLabels: false, showValues: true,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear},
      {label: !!null '', orientation: right, series: [{axisId: opportunity.count,
            id: opportunity.count, name: Number of Opportunities}], showLabels: false,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    series_types: {}
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    listen:
      Sales Team Segment: sales_rep.sales_team
      Sales Team Region: sales_rep.region
    row: 26
    col: 17
    width: 7
    height: 8
  - title: 'Active Opps: New Business'
    name: 'Active Opps: New Business'
    model: sfdc_demo
    explore: opportunity_line_item
    type: single_value
    fields: [opportunity.count]
    filters:
      opportunity.type: New Business
      opportunity.stage_name: "-Closed Won,-Closed Lost"
      opportunity.forecast_category: "-Omitted"
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#2196F3"
    defaults_version: 1
    listen:
      Sales Team Segment: sales_rep.sales_team
      Sales Team Region: sales_rep.region
    row: 26
    col: 0
    width: 5
    height: 4
  - title: 'Active Opps: Addon / Upsells'
    name: 'Active Opps: Addon / Upsells'
    model: sfdc_demo
    explore: opportunity_line_item
    type: single_value
    fields: [opportunity.count]
    filters:
      opportunity.type: Addon/Upsell
      opportunity.stage_name: "-Closed Won,-Closed Lost"
      opportunity.forecast_category: "-Omitted"
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    listen:
      Sales Team Segment: sales_rep.sales_team
      Sales Team Region: sales_rep.region
    row: 30
    col: 0
    width: 5
    height: 4
  - title: Opportunity Acceptance Rate
    name: Opportunity Acceptance Rate
    model: sfdc_demo
    explore: opportunity_line_item
    type: looker_bar
    fields: [opportunity.percent_of_opportunities_accepted, sales_rep.name]
    filters:
      opportunity.created_date: this year
      sales_rep.name: "-NULL"
    sorts: [opportunity.percent_of_opportunities_accepted desc]
    limit: 500
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    color_application:
      collection_id: f14810d2-98d7-42df-82d0-bc185a074e42
      palette_id: 89f8fd99-5003-4efd-ae1a-ae0aa28825ca
      options:
        steps: 5
    y_axes: [{label: '', orientation: bottom, series: [{axisId: opportunity.percent_of_opportunities_accepted,
            id: opportunity.percent_of_opportunities_accepted, name: Percent of Opportunities
              Accepted}], showLabels: false, showValues: false, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    series_types: {}
    reference_lines: [{reference_type: line, range_start: max, range_end: min, margin_top: deviation,
        margin_value: mean, margin_bottom: deviation, label_position: right, color: "#E57947",
        line_value: ".9", label: 90% Acceptance Rate}]
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    comparison_label: Goal
    conditional_formatting: [{type: less than, value: 0.9, background_color: '', font_color: "#E57947",
        color_application: {collection_id: f14810d2-98d7-42df-82d0-bc185a074e42, palette_id: 493e0f89-1e28-4f9b-9f49-9cb1e77a0331},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    defaults_version: 1
    listen:
      Sales Team Segment: sales_rep.sales_team
      Sales Team Region: sales_rep.region
    row: 49
    col: 8
    width: 8
    height: 12
  - title: Number of Self Sourced Opportunities
    name: Number of Self Sourced Opportunities
    model: sfdc_demo
    explore: opportunity_line_item
    type: looker_bar
    fields: [sales_rep.name, opportunity.count_self_sources]
    filters:
      opportunity.created_date: this year
      sales_rep.name: "-NULL"
    sorts: [opportunity.count_self_sources desc]
    limit: 500
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    color_application:
      collection_id: f14810d2-98d7-42df-82d0-bc185a074e42
      palette_id: 89f8fd99-5003-4efd-ae1a-ae0aa28825ca
      options:
        steps: 5
    y_axes: [{label: '', orientation: bottom, series: [{axisId: opportunity.percent_of_opportunities_accepted,
            id: opportunity.percent_of_opportunities_accepted, name: Percent of Opportunities
              Accepted}], showLabels: false, showValues: false, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    series_types: {}
    reference_lines: [{reference_type: line, range_start: max, range_end: min, margin_top: deviation,
        margin_value: mean, margin_bottom: deviation, label_position: right, color: "#E57947",
        line_value: '12', label: 12 Opportunities Generated}]
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    comparison_label: Goal
    conditional_formatting: [{type: less than, value: 0.9, background_color: '', font_color: "#E57947",
        color_application: {collection_id: f14810d2-98d7-42df-82d0-bc185a074e42, palette_id: 493e0f89-1e28-4f9b-9f49-9cb1e77a0331},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    defaults_version: 1
    note_state: collapsed
    note_display: below
    note_text: ''
    listen:
      Sales Team Segment: sales_rep.sales_team
      Sales Team Region: sales_rep.region
    row: 49
    col: 16
    width: 8
    height: 12
  - title: Number of Opps by Days in Current Stage
    name: Number of Opps by Days in Current Stage
    model: sfdc_demo
    explore: opportunity_line_item
    type: looker_pie
    fields: [opportunity.count, opportunity.days_in_current_stage_tier]
    fill_fields: [opportunity.days_in_current_stage_tier]
    filters:
      opportunity.type: New Business,Addon/Upsell
      opportunity.stage_name: "-Closed Lost,-Closed Won"
      opportunity.forecast_category: "-Omitted"
      opportunity.close_date: this quarter
    sorts: [opportunity.days_in_current_stage_tier]
    limit: 500
    column_limit: 50
    value_labels: labels
    label_type: labPer
    inner_radius: 50
    color_application:
      collection_id: f14810d2-98d7-42df-82d0-bc185a074e42
      palette_id: 89f8fd99-5003-4efd-ae1a-ae0aa28825ca
      options:
        steps: 5
    series_colors:
      Yes - opportunity.count: "#E57947"
      56 or Above: "#E57947"
    series_labels:
      opportunity.total_amount: ACV
      opportunity_line_item.total_nrr: NRR
      opportunity_line_item.total_arr: ARR
      Below 14: Less Than 2 Weeks
      14 to 27: Less Than 4 Weeks
      28 to 41: Less Than 8 Weeks
      42 to 55: Less Than 10 Weeks
      56 or Above: More Than 10 Weeks
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    y_axes: [{label: '', orientation: left, series: [{axisId: Active Lead - 1 - opportunity_line_item.total_arr,
            id: Active Lead - 1 - opportunity_line_item.total_arr, name: Active Lead},
          {axisId: Qualified - 2 - opportunity_line_item.total_arr, id: Qualified
              - 2 - opportunity_line_item.total_arr, name: Qualified}, {axisId: In
              Trial - 3 - opportunity_line_item.total_arr, id: In Trial - 3 - opportunity_line_item.total_arr,
            name: In Trial}], showLabels: false, showValues: false, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: normal
    limit_displayed_rows: false
    hide_legend: true
    legend_position: center
    label_value_format: ''
    series_types: {}
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: ordinal
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    enable_conditional_formatting: true
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    series_cell_visualizations:
      opportunity.total_amount:
        is_active: false
      opportunity_line_item.total_nrr:
        is_active: false
    series_text_format:
      opportunity.forecast_category:
        bold: true
      opportunity.total_amount:
        bold: true
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: "#2196F3",
        font_color: !!null '', color_application: {collection_id: f14810d2-98d7-42df-82d0-bc185a074e42,
          palette_id: 90a81bec-f33f-43c9-a36a-0ea5f037dfa0, options: {constraints: {
              min: {type: minimum}, mid: {type: number, value: 0}, max: {type: maximum}},
            mirror: true, reverse: false, stepped: false}}, bold: false, italic: false,
        strikethrough: false, fields: []}]
    defaults_version: 1
    listen:
      Sales Team Segment: sales_rep.sales_team
      Sales Team Region: sales_rep.region
    row: 65
    col: 0
    width: 11
    height: 10
  - title: Annual Quota Attainment
    name: Annual Quota Attainment
    model: sfdc_demo
    explore: opportunity_line_item
    type: looker_bar
    fields: [opportunity_line_item.closed_won_arr, opportunity_line_item.upside_arr,
      opportunity_line_item.forecast_arr, opportunity_line_item.pipeline_arr, sales_rep.annual_arr_quota,
      sales_rep.name]
    filters:
      opportunity.close_date: this year
      opportunity.stage_name: "-Closed Lost"
      sales_rep.name: "-EMPTY"
    sorts: [won desc]
    limit: 500
    column_limit: 50
    dynamic_fields: [{table_calculation: won, label: "% Won", expression: "${opportunity_line_item.closed_won_arr}/${sales_rep.annual_arr_quota}",
        value_format: !!null '', value_format_name: percent_1, _kind_hint: measure,
        _type_hint: number}, {table_calculation: upside, label: "% Upside", expression: "${opportunity_line_item.upside_arr}/${sales_rep.annual_arr_quota}",
        value_format: !!null '', value_format_name: percent_1, _kind_hint: measure,
        _type_hint: number}, {table_calculation: forecast, label: "% Forecast", expression: "${opportunity_line_item.forecast_arr}/${sales_rep.annual_arr_quota}",
        value_format: !!null '', value_format_name: percent_1, _kind_hint: measure,
        _type_hint: number}, {table_calculation: pipeline, label: "% Pipeline", expression: "${opportunity_line_item.pipeline_arr}/${sales_rep.annual_arr_quota}",
        value_format: !!null '', value_format_name: percent_1, _kind_hint: measure,
        _type_hint: number}]
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: normal
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    color_application:
      collection_id: f14810d2-98d7-42df-82d0-bc185a074e42
      palette_id: 89f8fd99-5003-4efd-ae1a-ae0aa28825ca
      options:
        steps: 5
    y_axes: [{label: '', orientation: bottom, series: [{axisId: won, id: won, name: "%\
              \ Won"}, {axisId: upside, id: upside, name: "% Upside"}, {axisId: forecast,
            id: forecast, name: "% Forecast"}, {axisId: pipeline, id: pipeline, name: "%\
              \ Pipeline"}], showLabels: false, showValues: false, maxValue: 1.2,
        minValue: 0, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    hidden_series: [forecast, pipeline]
    series_types: {}
    reference_lines: [{reference_type: line, range_start: max, range_end: min, margin_top: deviation,
        margin_value: mean, margin_bottom: deviation, label_position: right, color: "#E57947",
        line_value: '1', label: 100%}, {reference_type: line, range_start: max, range_end: min,
        margin_top: deviation, margin_value: mean, margin_bottom: deviation, label_position: right,
        color: "#E57947", line_value: '1.15', label: 115%}]
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: progress_percentage
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    hidden_fields: [sales_rep.quarterly_quota, sales_rep.annual_arr_quota, opportunity_line_item.closed_won_arr,
      opportunity_line_item.upside_arr, opportunity_line_item.forecast_arr, opportunity_line_item.pipeline_arr]
    listen:
      Sales Team Segment: sales_rep.sales_team
      Sales Team Region: sales_rep.region
    row: 38
    col: 3
    width: 18
    height: 11
  - title: ACV by Close Date [this Quarter]
    name: ACV by Close Date [this Quarter]
    model: sfdc_demo
    explore: opportunity_line_item
    type: looker_area
    fields: [opportunity.stage_name, opportunity.close_date, opportunity_line_item.total_arr]
    pivots: [opportunity.stage_name]
    fill_fields: [opportunity.close_date]
    filters:
      opportunity.type: New Business,Addon/Upsell
      opportunity.stage_name: "-Closed Lost,-Closed Won,-Active Lead"
      opportunity.forecast_category: "-Omitted"
      opportunity.close_date: this quarter
    sorts: [opportunity.close_date, opportunity.stage_name]
    limit: 500
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: normal
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: time
    y_axis_combined: true
    show_null_points: true
    interpolation: monotone
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    color_application:
      collection_id: f14810d2-98d7-42df-82d0-bc185a074e42
      palette_id: 89f8fd99-5003-4efd-ae1a-ae0aa28825ca
      options:
        steps: 5
    y_axes: [{label: '', orientation: left, series: [{axisId: Active Lead - 1 - opportunity_line_item.total_arr,
            id: Active Lead - 1 - opportunity_line_item.total_arr, name: Active Lead},
          {axisId: Qualified - 2 - opportunity_line_item.total_arr, id: Qualified
              - 2 - opportunity_line_item.total_arr, name: Qualified}, {axisId: In
              Trial - 3 - opportunity_line_item.total_arr, id: In Trial - 3 - opportunity_line_item.total_arr,
            name: In Trial}], showLabels: false, showValues: false, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    hidden_series: []
    label_value_format: $#,##0,"K"
    series_types: {}
    series_labels:
      opportunity.total_amount: ACV
      opportunity_line_item.total_nrr: NRR
      opportunity_line_item.total_arr: ARR
    ordering: none
    show_null_labels: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    enable_conditional_formatting: true
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    series_cell_visualizations:
      opportunity.total_amount:
        is_active: false
      opportunity_line_item.total_nrr:
        is_active: false
    series_text_format:
      opportunity.forecast_category:
        bold: true
      opportunity.total_amount:
        bold: true
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: "#2196F3",
        font_color: !!null '', color_application: {collection_id: f14810d2-98d7-42df-82d0-bc185a074e42,
          palette_id: 90a81bec-f33f-43c9-a36a-0ea5f037dfa0, options: {constraints: {
              min: {type: minimum}, mid: {type: number, value: 0}, max: {type: maximum}},
            mirror: true, reverse: false, stepped: false}}, bold: false, italic: false,
        strikethrough: false, fields: []}]
    defaults_version: 1
    hidden_fields: []
    listen:
      Sales Team Segment: sales_rep.sales_team
      Sales Team Region: sales_rep.region
    row: 65
    col: 11
    width: 13
    height: 10
  - title: Period Over Period Attainment
    name: Period Over Period Attainment
    model: sfdc_demo
    explore: company_goals
    type: looker_line
    fields: [calendar.days_left_in_period, opportunity_line_item.closed_won_arr, opportunity.opportunity_closed_in_period,
      opportunity.team_license_goal]
    pivots: [opportunity.opportunity_closed_in_period]
    filters:
      opportunity.opportunity_closed_in_period: "-Not in Period"
      opportunity.close_date: before 0 days ago
    sorts: [calendar.days_left_in_period desc, opportunity.opportunity_closed_in_period
        0]
    limit: 500
    column_limit: 50
    dynamic_fields: [{table_calculation: total_attainment, label: Total % Attainment,
        expression: 'running_total(${opportunity_line_item.closed_won_arr})/${opportunity.team_license_goal}',
        value_format: !!null '', value_format_name: percent_0, _kind_hint: measure,
        _type_hint: number}]
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: true
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: linear
    y_axis_combined: true
    show_null_points: false
    interpolation: monotone
    color_application:
      collection_id: f14810d2-98d7-42df-82d0-bc185a074e42
      palette_id: 89f8fd99-5003-4efd-ae1a-ae0aa28825ca
      options:
        steps: 5
    series_types: {}
    series_colors:
      Current Period - attainment: "#E57947"
    custom_color_enabled: true
    show_single_value_title: false
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    value_format: '0'
    comparison_label: Remaining Days
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    hidden_fields: [opportunity_line_item.closed_won_arr, opportunity.team_license_goal]
    y_axes: []
    listen:
      Sales Team Segment: sales_rep.sales_team
      Sales Team Region: sales_rep.region
      Time Period: opportunity.time_period_filter
    row: 16
    col: 0
    width: 24
    height: 6
  - title: Services Attainment
    name: Services Attainment
    model: sfdc_demo
    explore: company_goals
    type: marketplace_viz_liquid_fill_gauge::liquid_fill_gauge-marketplace
    fields: [opportunity.percent_nrr_attainment]
    filters:
      opportunity.opportunity_closed_in_period: Current Period
    limit: 500
    column_limit: 50
    dynamic_fields: [{table_calculation: attainment, label: Attainment %, expression: "(${opportunity_line_item.total_arr}/${opportunity.license_goal})*100",
        value_format: !!null '', value_format_name: decimal_0, _kind_hint: measure,
        _type_hint: number, is_disabled: true}]
    hidden_fields: [goals.team_booking_goal]
    hidden_points_if_no: []
    series_labels: {}
    show_view_names: true
    showComparison: false
    minValue: 0
    maxValue: 1
    circleThickness: 0.05
    circleFillGap: 0.05
    circleColor: "#2196F3"
    waveHeight: 0.05
    waveCount: 1
    waveRiseTime: 1000
    waveAnimateTime: 1800
    waveRise: true
    waveHeightScaling: true
    waveAnimate: true
    waveColor: "#E57947"
    waveOffset: 0
    textVertPosition: 0.5
    textSize: 0.86
    valueCountUp: true
    displayPercent: true
    textColor: "#000000"
    waveTextColor: "#FFFFFF"
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: progress_percentage
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    value_format: ''
    comparison_label: Quarter Goal
    defaults_version: 0
    series_types: {}
    title_hidden: true
    listen:
      Sales Team Segment: sales_rep.sales_team
      Sales Team Region: sales_rep.region
      Time Period: opportunity.time_period_filter
    row: 7
    col: 6
    width: 6
    height: 6
  - title: Opportunity Win Rate
    name: Opportunity Win Rate
    model: sfdc_demo
    explore: opportunity_line_item
    type: looker_bar
    fields: [sales_rep.name, opportunity.win_rate]
    filters:
      opportunity.created_date: this year
      sales_rep.name: "-NULL"
    sorts: [opportunity.win_rate desc]
    limit: 500
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    color_application:
      collection_id: f14810d2-98d7-42df-82d0-bc185a074e42
      palette_id: 89f8fd99-5003-4efd-ae1a-ae0aa28825ca
      options:
        steps: 5
    y_axes: [{label: '', orientation: bottom, series: [{axisId: opportunity.percent_of_opportunities_accepted,
            id: opportunity.percent_of_opportunities_accepted, name: Percent of Opportunities
              Accepted}], showLabels: false, showValues: false, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    series_types: {}
    reference_lines: [{reference_type: line, range_start: max, range_end: min, margin_top: deviation,
        margin_value: mean, margin_bottom: deviation, label_position: right, color: "#E57947",
        line_value: ".25", label: 50% Win Rate}]
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    comparison_label: Goal
    conditional_formatting: [{type: less than, value: 0.9, background_color: '', font_color: "#E57947",
        color_application: {collection_id: f14810d2-98d7-42df-82d0-bc185a074e42, palette_id: 493e0f89-1e28-4f9b-9f49-9cb1e77a0331},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    defaults_version: 1
    listen:
      Sales Team Segment: sales_rep.sales_team
      Sales Team Region: sales_rep.region
    row: 49
    col: 0
    width: 8
    height: 12
  filters:
  - name: Sales Team Segment
    title: Sales Team Segment
    type: field_filter
    default_value: Inside
    allow_multiple_values: true
    required: false
    model: sfdc_demo
    explore: opportunity_line_item
    listens_to_filters: []
    field: sales_rep.sales_team
  - name: Sales Team Region
    title: Sales Team Region
    type: field_filter
    default_value: West
    allow_multiple_values: true
    required: false
    model: sfdc_demo
    explore: opportunity_line_item
    listens_to_filters: []
    field: sales_rep.region
  - name: Time Period
    title: Time Period
    type: field_filter
    default_value: quarter
    allow_multiple_values: true
    required: false
    model: sfdc_demo
    explore: company_goals
    listens_to_filters: []
    field: opportunity.time_period_filter
