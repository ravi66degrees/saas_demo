- dashboard: saas_pulse_japanese
  title: SaaS Pulse (Japanese)
  layout: newspaper
  preferred_viewer: dashboards-next
  elements:
  - title: 現在の ARR
    name: 現在の ARR
    model: sfdc_demo
    explore: opportunity_line_item
    type: single_value
    fields: [opportunity_line_item.total_arr]
    filters:
      opportunity.is_active_contract: 'Yes'
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
    value_format: ''
    defaults_version: 1
    hidden_fields: []
    y_axes: []
    note_state: collapsed
    note_display: below
    note_text: '年間経常収益 '
    listen: {}
    row: 2
    col: 15
    width: 6
    height: 4
  - title: 既存顧客
    name: 既存顧客
    model: sfdc_demo
    explore: opportunity_line_item
    type: single_value
    fields: [account.count]
    filters:
      opportunity.is_active_contract: 'Yes'
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
    hidden_fields: []
    y_axes: []
    note_state: collapsed
    note_display: below
    note_text: 'アクティブな親アカウント '
    listen: {}
    row: 6
    col: 15
    width: 6
    height: 3
  - title: 新規ロゴ
    name: 新規ロゴ
    model: sfdc_demo
    explore: opportunity_line_item
    type: single_value
    fields: [account.count]
    filters:
      opportunity.stage_name: Closed Won
      opportunity.close_date: this quarter
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
    hidden_fields: []
    y_axes: []
    note_state: collapsed
    note_display: below
    note_text: This Quarter
    listen: {}
    row: 6
    col: 3
    width: 7
    height: 3
  - title: 失注顧客
    name: 失注顧客
    model: sfdc_demo
    explore: opportunity_line_item
    type: single_value
    fields: [account.count]
    filters:
      account.end_date: this quarter
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
    custom_color: "#B32F37"
    defaults_version: 1
    hidden_fields: []
    y_axes: []
    note_state: collapsed
    note_display: below
    note_text: 今四半期
    listen: {}
    row: 6
    col: 10
    width: 5
    height: 3
  - name: 四半期評価指標
    type: text
    title_text: 四半期評価指標
    subtitle_text: 全社業績評価指標
    body_text: ''
    row: 0
    col: 0
    width: 24
    height: 2
  - name: 四半期進捗
    type: text
    title_text: 四半期進捗
    subtitle_text: チーム目標に向けた四半期進捗
    body_text: "<hr/>\n<div class=\"btn-group btn-group-toggle\" data-toggle=\"buttons\"\
      >\n  <a href=\"/dashboards/6izj5f6nXuDRPAE2Ehorp8\" class=\"btn btn-secondary\">\n      \
      \    営業チーム概要\n  </a>\n  <a href=\"/dashboards/8SMc0Aj4eQO5orarr0UFXe\" class=\"btn btn-secondary\"\
      >\n  \tカスタマーサクセス概要\n  </a>\n  <a href=\"\" class=\"btn btn-secondary\">\n  \t\
      製品概要\n  </a>\n</div>"
    row: 9
    col: 0
    width: 24
    height: 4
  - name: ''
    type: text
    title_text: ''
    body_text: |-
      <font size="4"  style="margin-left: 40px">
      1. Sales
    row: 13
    col: 0
    width: 2
    height: 19
  - name: " (2)"
    type: text
    body_text: |-
      <font size="4"  style="margin-left: 40px">
      2. CS
    row: 34
    col: 0
    width: 2
    height: 7
  - title: '今四半期獲得順位 '
    name: '今四半期獲得順位 '
    model: sfdc_demo
    explore: opportunity_line_item
    type: looker_grid
    fields: [opportunity.total_amount, account.account_name, sales_rep.name, opportunity.close_date]
    filters:
      opportunity.stage_name: Closed Won
      opportunity.close_date: this quarter
    sorts: [opportunity.total_amount desc]
    limit: 15
    column_limit: 50
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    color_application:
      collection_id: f14810d2-98d7-42df-82d0-bc185a074e42
      palette_id: 89f8fd99-5003-4efd-ae1a-ae0aa28825ca
      options:
        steps: 5
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    series_cell_visualizations:
      opportunity.total_amount:
        is_active: true
        palette:
          palette_id: 85de97da-2ded-4dec-9dbd-e6a7d36d5825
          collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    value_format: ''
    defaults_version: 1
    series_types: {}
    hidden_fields: []
    y_axes: []
    listen: {}
    row: 19
    col: 12
    width: 10
    height: 7
  - title: 今四半期発生の新規Opportunity
    name: 今四半期発生の新規Opportunity
    model: sfdc_demo
    explore: opportunity_line_item
    type: looker_column
    fields: [account.account_source, opportunity.created_date, opportunity.count]
    pivots: [account.account_source]
    fill_fields: [opportunity.created_date]
    filters:
      opportunity.created_date: this quarter
    sorts: [account.account_source 0, opportunity.created_date]
    limit: 500
    column_limit: 50
    dynamic_fields: [{table_calculation: running_total_opportunity_count, label: Running
          total opportunity count, expression: 'if(${opportunity.created_date} <=
          now(),running_total(${opportunity.count}),null)', value_format: !!null '',
        value_format_name: decimal_0, is_disabled: false, _kind_hint: measure, _type_hint: number},
      {table_calculation: goal, label: Goal, expression: "if(row() = 1,0,\n  \nif(max(row())\
          \ = row(),\n  (300\n    +offset(${opportunity.count},-row()+1)),\n\n(extract_months(${opportunity.created_date})-min(extract_months(${opportunity.created_date})))*0.25*(300+offset(${opportunity.count},-row()+1))))\
          \ \n\n + running_total(if(row()=1,${opportunity.count},0))", value_format: !!null '',
        value_format_name: !!null '', _kind_hint: measure, _type_hint: number, is_disabled: true}]
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
    y_axes: [{label: '', orientation: left, series: [{axisId: Clearbit - running_total_opportunity_count,
            id: Clearbit - running_total_opportunity_count, name: Clearbit}, {axisId: LinkedIn
              - running_total_opportunity_count, id: LinkedIn - running_total_opportunity_count,
            name: LinkedIn}, {axisId: Organic - running_total_opportunity_count, id: Organic
              - running_total_opportunity_count, name: Organic}, {axisId: Referral
              - running_total_opportunity_count, id: Referral - running_total_opportunity_count,
            name: Referral}, {axisId: Trade Show - running_total_opportunity_count,
            id: Trade Show - running_total_opportunity_count, name: Trade Show}, {
            axisId: account.account_source___null - running_total_opportunity_count,
            id: account.account_source___null - running_total_opportunity_count, name: "∅"}],
        showLabels: false, showValues: true, maxValue: 300, unpinAxis: false, tickDensity: custom,
        tickDensityCustom: 5, type: linear}]
    series_types:
      goal: line
      account.account_source___null - goal: line
    series_colors:
      goal: "#E57947"
      account.account_source___null - goal: "#E57947"
    series_labels:
      account.account_source___null - running_total_opportunity_count: SDR / Self-Sourced
    reference_lines: []
    trend_lines: []
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
    defaults_version: 1
    hidden_fields: [opportunity.count]
    listen: {}
    row: 26
    col: 12
    width: 10
    height: 6
  - name: " (3)"
    type: text
    body_text: |-
      <font size="4"  style="margin-left: 40px">
      3. Product
    row: 43
    col: 0
    width: 2
    height: 8
  - name: " (4)"
    type: text
    body_text: "<p/>"
    row: 32
    col: 0
    width: 24
    height: 2
  - name: " (5)"
    type: text
    body_text: "<p/>"
    row: 41
    col: 0
    width: 24
    height: 2
  - title: CSAT
    name: CSAT
    model: sfdc_demo
    explore: ticket
    type: looker_line
    fields: [satisfaction_ratings.average_csat, satisfaction_ratings.percent_tickets_with_rating,
      ticket.created_week]
    fill_fields: [ticket.created_week]
    filters:
      ticket.created_date: this quarter
    sorts: [ticket.created_week]
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
    x_axis_scale: time
    y_axis_combined: true
    show_null_points: false
    interpolation: linear
    color_application:
      collection_id: f14810d2-98d7-42df-82d0-bc185a074e42
      palette_id: 89f8fd99-5003-4efd-ae1a-ae0aa28825ca
      options:
        steps: 5
    y_axes: [{label: '', orientation: left, series: [{axisId: satisfaction_ratings.average_csat,
            id: satisfaction_ratings.average_csat, name: Average CSAT}], showLabels: false,
        showValues: true, maxValue: 4, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}, {label: !!null '', orientation: right, series: [{axisId: satisfaction_ratings.percent_tickets_with_rating,
            id: satisfaction_ratings.percent_tickets_with_rating, name: Response Rate}],
        showLabels: false, showValues: false, maxValue: 1, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    series_types:
      satisfaction_ratings.average_csat: column
    series_colors:
      satisfaction_ratings.percent_tickets_with_rating: "#b6cbf0"
    series_labels:
      satisfaction_ratings.percent_tickets_with_rating: Response Rate
    reference_lines: [{reference_type: line, range_start: max, range_end: min, margin_top: deviation,
        margin_value: mean, margin_bottom: deviation, label_position: right, color: "#E57947",
        line_value: '3.7', label: 3.7 Goal}]
    ordering: none
    show_null_labels: false
    show_dropoff: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    comparison_label: Tickets with Ratings
    conditional_formatting: [{type: greater than, value: !!null '', background_color: "#2196F3",
        font_color: !!null '', color_application: {collection_id: f14810d2-98d7-42df-82d0-bc185a074e42,
          palette_id: 493e0f89-1e28-4f9b-9f49-9cb1e77a0331}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
    defaults_version: 1
    hidden_fields: []
    listen: {}
    row: 34
    col: 2
    width: 10
    height: 7
  - title: 新規 ARR
    name: 新規 ARR
    model: sfdc_demo
    explore: company_goals
    type: single_value
    fields: [opportunity.license_goal, opportunity_line_item.closed_won_arr]
    filters:
      opportunity.time_period_filter: quarter
      opportunity.opportunity_closed_in_period: Current Period
    sorts: [opportunity_line_item.closed_won_arr desc]
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: progress_percentage
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    comparison_label: 四半期ライセンス目標
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
    show_null_points: true
    defaults_version: 1
    series_types: {}
    hidden_fields: []
    y_axes: []
    listen: {}
    row: 2
    col: 3
    width: 7
    height: 4
  - title: '今四半期の累積新ARR '
    name: '今四半期の累積新ARR '
    model: sfdc_demo
    explore: company_goals
    type: looker_line
    fields: [opportunity_line_item.closed_won_arr, calendar.calendar_date, opportunity.team_license_goal]
    fill_fields: [calendar.calendar_date]
    filters:
      opportunity.time_period_filter: quarter
      opportunity.opportunity_closed_in_period: Current Period
    sorts: [calendar.calendar_date]
    limit: 500
    column_limit: 50
    dynamic_fields: [{table_calculation: running_total, label: Running Total, expression: 'if(${calendar.calendar_date}<now(),running_total(${opportunity_line_item.closed_won_arr}),null)',
        value_format: !!null '', value_format_name: usd, _kind_hint: measure, _type_hint: number},
      {table_calculation: steps_to_goal, label: Steps to Goal, expression: 'if(row()!=max(row()),((extract_months(${calendar.calendar_date})
          - min(extract_months(${calendar.calendar_date})))/3)*${opportunity.team_license_goal},${opportunity.team_license_goal})',
        value_format: !!null '', value_format_name: usd, _kind_hint: measure, _type_hint: number}]
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
    show_null_points: false
    interpolation: linear
    color_application:
      collection_id: f14810d2-98d7-42df-82d0-bc185a074e42
      palette_id: 89f8fd99-5003-4efd-ae1a-ae0aa28825ca
      options:
        steps: 5
    series_types:
      running_total: column
    series_colors:
      steps_to_goal: "#E57947"
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
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
    hidden_fields: [opportunity.team_license_goal, opportunity_line_item.closed_won_arr]
    y_axes: []
    listen: {}
    row: 13
    col: 2
    width: 10
    height: 6
  - title: '今四半期の累積NRR '
    name: '今四半期の累積NRR '
    model: sfdc_demo
    explore: company_goals
    type: looker_line
    fields: [calendar.calendar_date, opportunity.team_services_goal, opportunity_line_item.closed_won_nrr]
    fill_fields: [calendar.calendar_date]
    filters:
      opportunity.time_period_filter: quarter
      opportunity.opportunity_closed_in_period: Current Period
    sorts: [calendar.calendar_date]
    limit: 500
    column_limit: 50
    dynamic_fields: [{table_calculation: running_total, label: Running Total, expression: 'if(${calendar.calendar_date}<now(),running_total(${opportunity_line_item.closed_won_nrr}),null)',
        value_format: !!null '', value_format_name: usd, _kind_hint: measure, _type_hint: number},
      {table_calculation: steps_to_goal, label: Steps to Goal, expression: 'if(row()!=max(row()),((extract_months(${calendar.calendar_date})
          - min(extract_months(${calendar.calendar_date})))/3)*${opportunity.team_services_goal},${opportunity.team_services_goal})',
        value_format: !!null '', value_format_name: usd, _kind_hint: measure, _type_hint: number}]
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
    show_null_points: false
    interpolation: linear
    color_application:
      collection_id: f14810d2-98d7-42df-82d0-bc185a074e42
      palette_id: 89f8fd99-5003-4efd-ae1a-ae0aa28825ca
      options:
        steps: 5
    series_types:
      running_total: column
    series_colors:
      steps_to_goal: "#E57947"
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
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
    hidden_fields: [opportunity.team_services_goal, opportunity_line_item.closed_won_nrr]
    y_axes: []
    listen: {}
    row: 13
    col: 12
    width: 10
    height: 6
  - title: 目標に向けたチーム進捗
    name: 目標に向けたチーム進捗
    model: sfdc_demo
    explore: company_goals
    type: looker_column
    fields: [sales_rep.segment_region, opportunity_line_item.closed_won_arr, opportunity.team_license_goal]
    filters:
      opportunity.opportunity_closed_in_period: Current Period
      opportunity.time_period_filter: quarter
      sales_rep.sales_team: Inside,Outside
    sorts: [opportunity_line_item.closed_won_arr desc]
    limit: 500
    column_limit: 50
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
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: right
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
    y_axes: [{label: '', orientation: left, series: [{axisId: opportunity_line_item.closed_won_arr,
            id: opportunity_line_item.closed_won_arr, name: Won ARR}, {axisId: opportunity.team_license_goal,
            id: opportunity.team_license_goal, name: Team License Goal}], showLabels: false,
        showValues: true, unpinAxis: false, tickDensity: default, type: linear}]
    size_by_field: opportunity.team_license_goal
    hide_legend: true
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
    listen: {}
    row: 19
    col: 2
    width: 10
    height: 7
  - title: 今四半期の新規ロゴ (by ACV)
    name: 今四半期の新規ロゴ (by ACV)
    model: sfdc_demo
    explore: opportunity_line_item
    type: looker_wordcloud
    fields: [opportunity.total_amount, account.account_name]
    filters:
      account.start_date: this quarter
      opportunity.is_active_contract: 'Yes'
    sorts: [opportunity.total_amount desc]
    limit: 500
    column_limit: 50
    color_application:
      collection_id: f14810d2-98d7-42df-82d0-bc185a074e42
      palette_id: 89f8fd99-5003-4efd-ae1a-ae0aa28825ca
      options:
        steps: 5
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
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
        is_active: true
        palette:
          palette_id: 85de97da-2ded-4dec-9dbd-e6a7d36d5825
          collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    value_format: ''
    defaults_version: 1
    series_types: {}
    hidden_fields: []
    y_axes: []
    listen: {}
    row: 26
    col: 2
    width: 10
    height: 6
  - title: 前年比リテンション
    name: 前年比リテンション
    model: sfdc_demo
    explore: daily_active_accounts
    type: looker_line
    fields: [daily_active_accounts.net_retention, daily_active_accounts.calendar_day_of_year,
      daily_active_accounts.calendar_year]
    pivots: [daily_active_accounts.calendar_year]
    fill_fields: [daily_active_accounts.calendar_day_of_year, daily_active_accounts.calendar_year]
    filters:
      daily_active_accounts.calendar_date: 2 years
    sorts: [daily_active_accounts.net_retention desc 0, daily_active_accounts.calendar_year]
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
    show_null_points: false
    interpolation: linear
    color_application:
      collection_id: f14810d2-98d7-42df-82d0-bc185a074e42
      palette_id: 89f8fd99-5003-4efd-ae1a-ae0aa28825ca
      options:
        steps: 5
    y_axes: [{label: '', orientation: left, series: [{axisId: daily_active_accounts.net_retention,
            id: 2019 - daily_active_accounts.net_retention, name: '2019'}, {axisId: daily_active_accounts.net_retention,
            id: 2020 - daily_active_accounts.net_retention, name: '2020'}], showLabels: false,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    hidden_series: []
    reference_lines: [{reference_type: range, line_value: mean, range_end: max, margin_top: deviation,
        margin_value: mean, margin_bottom: deviation, label_position: left, color: "#72D16D",
        range_start: ".9", label: Good Retention}]
    defaults_version: 1
    hidden_fields: []
    listen: {}
    row: 34
    col: 12
    width: 10
    height: 7
  - title: "$BNR"
    name: "$BNR"
    model: sfdc_demo
    explore: daily_active_accounts
    type: single_value
    fields: [daily_active_accounts.calendar_date, daily_active_accounts.net_retention]
    fill_fields: [daily_active_accounts.calendar_date]
    sorts: [daily_active_accounts.calendar_date desc]
    limit: 1
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    conditional_formatting: [{type: less than, value: 0.9, background_color: '', font_color: "#B32F37",
        color_application: {collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7, palette_id: 85de97da-2ded-4dec-9dbd-e6a7d36d5825},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    hidden_fields: [daily_active_accounts.calendar_date]
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
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    series_types: {}
    y_axes: []
    note_state: collapsed
    note_display: hover
    note_text: '純収益保持率は、アクティブなARRの合計を取得し、過去365日間に最初の契約が開始された顧客からARRを差し引き、それを1年前のアクティブなARRと比較することによって計算されます。 '
    listen: {}
    row: 2
    col: 10
    width: 5
    height: 4
  - title: 合計プロダクト利用時間
    name: 合計プロダクト利用時間
    model: sfdc_demo
    explore: daily_user_count
    type: looker_column
    fields: [daily_client_sessions.estimated_usage_time, daily_user_count.event_date,
      daily_client_usage.average_distinct_users]
    fill_fields: [daily_user_count.event_date]
    filters:
      daily_user_count.event_date: this quarter
    sorts: [daily_user_count.event_date]
    limit: 500
    dynamic_fields: [{table_calculation: daily_average_usage_time_goal, label: Daily
          Average Usage Time Goal, expression: '80000000', value_format: !!null '',
        value_format_name: !!null '', _kind_hint: dimension, _type_hint: number, is_disabled: true}]
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
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: time
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
    y_axes: [{label: '', orientation: left, series: [{axisId: daily_client_sessions.estimated_usage_time,
            id: daily_client_sessions.estimated_usage_time, name: Estimated Usage
              Time}], showLabels: true, showValues: true, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}, {label: !!null '', orientation: right,
        series: [{axisId: daily_client_usage.average_distinct_users, id: daily_client_usage.average_distinct_users,
            name: Average Daily Users}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    series_types:
      daily_client_usage.average_distinct_users: line
    series_colors:
      daily_client_usage.average_distinct_users: "#FBB555"
    series_labels:
      daily_client_sessions.estimated_usage_time: Estimated Total Usage Time
      daily_client_usage.average_distinct_users: Daily Users
    reference_lines: [{reference_type: line, range_start: max, range_end: min, margin_top: deviation,
        margin_value: mean, margin_bottom: deviation, label_position: right, color: "#E57947",
        label: Daily Usage Goal (Min), line_value: '80000000'}]
    defaults_version: 1
    hidden_fields: []
    listen: {}
    row: 43
    col: 2
    width: 10
    height: 8
  - title: 種類別イベント
    name: 種類別イベント
    model: sfdc_demo
    explore: daily_user_count
    type: looker_column
    fields: [daily_client_usage.sum_browse_events, daily_client_usage.sum_dashboard_events,
      daily_client_usage.sum_explore_events, daily_client_usage.sum_model_events,
      daily_user_count.event_date]
    fill_fields: [daily_user_count.event_date]
    filters:
      daily_user_count.event_date: this quarter
    sorts: [daily_user_count.event_date]
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
    stacking: percent
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
    series_types: {}
    series_labels:
      daily_client_usage.sum_browse_events: Browse Events
      daily_client_usage.sum_dashboard_events: Dashboard Events
      daily_client_usage.sum_explore_events: Explore Events
      daily_client_usage.sum_model_events: Model Events
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    hidden_fields: []
    y_axes: []
    listen: {}
    row: 43
    col: 12
    width: 10
    height: 8
