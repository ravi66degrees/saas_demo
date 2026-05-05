- dashboard: account_lookup
  title: Account Lookup
  layout: newspaper
  preferred_viewer: dashboards
  embed_style:
    background_color: "#f6f8fa"
    show_title: false
    title_color: "#3a4245"
    show_filters_bar: false
    tile_text_color: "#3a4245"
    text_tile_text_color: ''
  elements:
  - title: Account Details
    name: Account Details
    model: sfdc_demo
    explore: opportunity_line_item
    type: looker_single_record
    fields: [account.account_name, account.industry, account.number_of_employees,
      account.start_date, csm.name, sales_rep.name, account.billing_email, account.next_contract_renewal_date]
    sorts: [account.start_date desc]
    limit: 500
    column_limit: 50
    show_view_names: false
    series_types: {}
    defaults_version: 1
    listen:
      Account Name: account.account_name
    row: 3
    col: 0
    width: 5
    height: 6
  - title: Events by Type Past 90 Days
    name: Events by Type Past 90 Days
    model: sfdc_demo
    explore: daily_user_count
    type: looker_area
    fields: [daily_client_usage.sum_model_events, daily_client_usage.sum_explore_events,
      daily_client_usage.sum_dashboard_events, daily_user_count.event_date]
    fill_fields: [daily_user_count.event_date]
    filters:
      daily_user_count.event_date: 90 days
    sorts: [daily_user_count.event_date desc]
    limit: 500
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
    stacking: normal
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
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
    series_types: {}
    series_labels:
      daily_client_usage.sum_model_events: Model Events
      daily_client_usage.sum_explore_events: Explore Events
      daily_client_usage.sum_dashboard_events: Dashboard Events
    ordering: none
    show_null_labels: false
    defaults_version: 1
    listen:
      Account Name: account.account_name
    row: 42
    col: 0
    width: 12
    height: 6
  - title: DailyUsers by Type Past 90 Days
    name: DailyUsers by Type Past 90 Days
    model: sfdc_demo
    explore: daily_user_count
    type: looker_area
    fields: [daily_user_count.event_date, daily_client_usage.average_dashboard_users,
      daily_client_usage.average_explore_users, daily_client_usage.average_model_users]
    fill_fields: [daily_user_count.event_date]
    filters:
      daily_user_count.event_date: 90 days
    sorts: [daily_user_count.event_date desc]
    limit: 500
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
    stacking: normal
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
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
    series_types: {}
    series_labels:
      daily_client_usage.sum_model_events: Model Events
      daily_client_usage.sum_explore_events: Explore Events
      daily_client_usage.sum_dashboard_events: Dashboard Events
      daily_client_usage.average_dashboard_users: Dashboard Users
      daily_client_usage.average_explore_users: Explore Users
      daily_client_usage.average_model_users: Model Users
    ordering: none
    show_null_labels: false
    defaults_version: 1
    listen:
      Account Name: account.account_name
    row: 36
    col: 0
    width: 12
    height: 6
  - name: Account Overview
    title: Account Overview
    type: text
    title_text: Account Overview
    row: 0
    col: 0
    width: 24
    height: 3
  - name: Product Usage
    title: Product Usage
    type: text
    title_text: Product Usage
    row: 20
    col: 0
    width: 24
    height: 4
  - title: Daily Sessions (Past 30 Days)
    name: Daily Sessions (Past 30 Days)
    model: sfdc_demo
    explore: daily_user_count
    type: looker_column
    fields: [daily_user_count.event_date, daily_client_sessions.total_sessions, daily_client_sessions.median_session_duration]
    fill_fields: [daily_user_count.event_date]
    filters:
      daily_user_count.event_date: 30 days
    sorts: [daily_user_count.event_date desc]
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
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: '', orientation: left, series: [{axisId: daily_client_sessions.total_sessions,
            id: daily_client_sessions.total_sessions, name: Total Sessions}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}, {label: !!null '', orientation: right, series: [{axisId: daily_client_sessions.median_session_duration,
            id: daily_client_sessions.median_session_duration, name: Median Session
              Duration}], showLabels: true, showValues: true, minValue: 0, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    size_by_field: daily_client_sessions.median_session_duration
    series_types:
      daily_client_sessions.median_session_duration: scatter
    series_colors:
      daily_client_sessions.median_session_duration: "#75E2E2"
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    listen:
      Account Name: account.account_name
    row: 36
    col: 12
    width: 12
    height: 12
  - title: "% of Named Users Active"
    name: "% of Named Users Active"
    model: sfdc_demo
    explore: daily_user_count
    type: looker_line
    fields: [daily_client_usage.average_percent_active_users, daily_user_count.event_date]
    fill_fields: [daily_user_count.event_date]
    filters:
      daily_user_count.event_date: 6 months
    sorts: [daily_client_usage.average_percent_active_users desc]
    limit: 500
    column_limit: 50
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
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: monotone
    color_application:
      collection_id: f14810d2-98d7-42df-82d0-bc185a074e42
      palette_id: 89f8fd99-5003-4efd-ae1a-ae0aa28825ca
      options:
        steps: 5
    hidden_series: []
    series_types: {}
    series_point_styles:
      daily_client_usage.average_percent_active_users: auto
    reference_lines: [{reference_type: range, line_value: mean, margin_top: deviation,
        margin_value: mean, margin_bottom: deviation, label_position: left, color: "#72D16D",
        range_start: '1', range_end: ".7", label: Good Usage}]
    defaults_version: 1
    listen:
      Account Name: account.account_name
    row: 24
    col: 0
    width: 24
    height: 12
  - title: Average NPS Score
    name: Average NPS Score
    model: sfdc_demo
    explore: daily_user_count
    type: single_value
    fields: [account.nps_score]
    filters:
      daily_user_count.event_date: 30 days
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
      Account Name: account.account_name
    row: 17
    col: 0
    width: 5
    height: 3
  - title: Current ACV
    name: Current ACV
    model: sfdc_demo
    explore: opportunity_line_item
    type: single_value
    fields: [opportunity.total_amount]
    filters:
      opportunity.is_active_contract: 'Yes'
    limit: 500
    query_timezone: America/Los_Angeles
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    comparison_label: Won Opportunities
    show_view_names: false
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    limit_displayed_rows: false
    defaults_version: 1
    series_types: {}
    listen:
      Account Name: account.account_name
    row: 3
    col: 5
    width: 5
    height: 4
  - title: NRR
    name: NRR
    model: sfdc_demo
    explore: opportunity_line_item
    type: single_value
    fields: [opportunity_line_item.closed_won_nrr, opportunity_line_item.number_ps_engagements]
    limit: 500
    query_timezone: America/Los_Angeles
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    comparison_label: PS Engagements
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
      Account Name: account.account_name
    row: 13
    col: 0
    width: 5
    height: 4
  - title: Open Opportunities
    name: Open Opportunities
    model: sfdc_demo
    explore: opportunity_line_item
    type: single_value
    fields: [opportunity.count]
    filters:
      opportunity.stage_name: "-Closed Won,-Closed Lost"
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
    show_view_names: false
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    limit_displayed_rows: false
    defaults_version: 1
    series_types: {}
    listen:
      Account Name: account.account_name
    row: 7
    col: 5
    width: 5
    height: 2
  - title: ARR Growth
    name: ARR Growth
    model: sfdc_demo
    explore: daily_active_accounts
    type: looker_area
    fields: [daily_active_accounts.calendar_date, daily_active_accounts.total_active_arr]
    fill_fields: [daily_active_accounts.calendar_date]
    sorts: [daily_active_accounts.calendar_date desc]
    limit: 500
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
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: false
    interpolation: linear
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: '', orientation: left, series: [{axisId: daily_active_accounts.total_active_arr,
            id: daily_active_accounts.total_active_arr, name: Total ARR Active Today}],
        showLabels: false, showValues: true, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    series_types: {}
    trend_lines: []
    defaults_version: 1
    ordering: none
    show_null_labels: false
    listen:
      Account Name: account.account_name
    row: 3
    col: 10
    width: 14
    height: 6
  - name: Account Activity
    title: Account Activity
    type: text
    title_text: Account Activity
    row: 9
    col: 0
    width: 24
    height: 4
  - title: Overall Health Score
    name: Overall Health Score
    model: sfdc_demo
    explore: daily_user_count
    type: looker_line
    fields: [daily_user_count.average_health_score, daily_user_count.event_week]
    fill_fields: [daily_user_count.event_week]
    filters:
      daily_user_count.event_date: 6 months
    sorts: [daily_user_count.event_week desc]
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
    point_style: circle_outline
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: false
    interpolation: monotone
    color_application:
      collection_id: f14810d2-98d7-42df-82d0-bc185a074e42
      palette_id: 89f8fd99-5003-4efd-ae1a-ae0aa28825ca
      options:
        steps: 5
    y_axes: [{label: '', orientation: left, series: [{axisId: daily_user_count.average_health_score,
            id: daily_user_count.average_health_score, name: Average Health Score}],
        showLabels: false, showValues: false, unpinAxis: true, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    series_types: {}
    reference_lines: [{reference_type: range, line_value: mean, margin_top: deviation,
        margin_value: mean, margin_bottom: deviation, label_position: right, color: "#E57947",
        range_start: '0', label: At Risk, range_end: '3'}, {reference_type: range,
        line_value: mean, margin_top: deviation, margin_value: mean, margin_bottom: deviation,
        label_position: right, color: "#FFD95F", range_start: '3', range_end: '4',
        label: Fair}, {reference_type: range, margin_top: deviation, margin_value: mean,
        margin_bottom: deviation, label_position: right, color: "#72D16D", line_value: '4',
        label: Good, range_end: '4', range_start: '5'}]
    defaults_version: 1
    listen:
      Account Name: account.account_name
    row: 13
    col: 10
    width: 14
    height: 7
  - title: Chats Past 30 Days
    name: Chats Past 30 Days
    model: sfdc_demo
    explore: ticket
    type: single_value
    fields: [ticket.count, ticket.urgent_tickets]
    filters:
      ticket.created_date: 30 days
    limit: 500
    query_timezone: America/Los_Angeles
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: true
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    comparison_label: Urgent Tickets
    defaults_version: 1
    listen:
      Account Name: account.account_name
    row: 13
    col: 5
    width: 5
    height: 4
  - title: Average CSAT
    name: Average CSAT
    model: sfdc_demo
    explore: ticket
    type: single_value
    fields: [satisfaction_ratings.average_csat]
    filters:
      ticket.created_date: 30 days
    limit: 500
    query_timezone: America/Los_Angeles
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    conditional_formatting: [{type: greater than, value: 3.4, background_color: '',
        font_color: "#72D16D", color_application: {collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7,
          palette_id: 85de97da-2ded-4dec-9dbd-e6a7d36d5825}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}, {type: less than, value: 3.1, background_color: '',
        font_color: "#E57947", color_application: {collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7,
          palette_id: 85de97da-2ded-4dec-9dbd-e6a7d36d5825}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
    defaults_version: 1
    listen:
      Account Name: account.account_name
    row: 17
    col: 5
    width: 5
    height: 3
  filters:
  - name: Account Name
    title: Account Name
    type: field_filter
    default_value: Schonfeld Financial Services
    allow_multiple_values: false
    required: false
    model: sfdc_demo
    explore: daily_user_count
    listens_to_filters: []
    field: account.account_name
