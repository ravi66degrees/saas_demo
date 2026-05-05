- dashboard: customer_success_overview
  title: Customer Success Overview
  layout: newspaper
  elements:
  - title: Number of Accounts
    name: Number of Accounts
    model: sfdc_demo
    explore: opportunity_line_item
    type: single_value
    fields: [account.count]
    filters:
      account.type: Customer
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
      Customer Success Manager: csm.name
    row: 3
    col: 3
    width: 10
    height: 3
  - title: Active ARR
    name: Active ARR
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
    listen:
      Customer Success Manager: csm.name
    row: 6
    col: 3
    width: 5
    height: 2
  - name: "<b>Accounts Overview</b>"
    title: "<b>Accounts Overview</b>"
    type: text
    title_text: "<b>Accounts Overview</b>"
    subtitle_text: ''
    body_text: ''
    row: 0
    col: 0
    width: 24
    height: 3
  - name: Account Activity
    title: Account Activity
    type: text
    title_text: Account Activity
    row: 21
    col: 0
    width: 24
    height: 3
  - title: Upcoming Renewal Opportunities
    name: Upcoming Renewal Opportunities
    model: sfdc_demo
    explore: opportunity_line_item
    type: looker_grid
    fields: [account.next_contract_renewal_date, account.account_name, opportunity_line_item.total_arr,
      opportunity.renewal_opportunity_id, sales_rep.name]
    filters:
      opportunity.is_active_contract: 'Yes'
      opportunity_line_item.total_arr: ">0"
      account.next_contract_renewal_date: 0 days ago for 1 year
    sorts: [account.next_contract_renewal_date]
    limit: 500
    query_timezone: America/Los_Angeles
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
      opportunity_line_item.total_arr:
        is_active: true
        palette:
          palette_id: 85de97da-2ded-4dec-9dbd-e6a7d36d5825
          collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
    x_axis_gridlines: false
    y_axis_gridlines: true
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
      Customer Success Manager: csm.name
    row: 13
    col: 0
    width: 12
    height: 8
  - title: "$BNR"
    name: "$BNR"
    model: sfdc_demo
    explore: daily_active_accounts
    type: single_value
    fields: [daily_active_accounts.net_retention, daily_active_accounts.calendar_date]
    fill_fields: [daily_active_accounts.calendar_date]
    filters: {}
    sorts: [daily_active_accounts.calendar_date desc]
    limit: 1
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
    color_application:
      collection_id: f14810d2-98d7-42df-82d0-bc185a074e42
      palette_id: 89f8fd99-5003-4efd-ae1a-ae0aa28825ca
    conditional_formatting: [{type: less than, value: 95, background_color: '', font_color: "#E57947",
        color_application: {collection_id: f14810d2-98d7-42df-82d0-bc185a074e42, palette_id: 493e0f89-1e28-4f9b-9f49-9cb1e77a0331},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    hidden_fields: [daily_active_accounts.calendar_date]
    series_types: {}
    defaults_version: 1
    note_state: collapsed
    note_display: hover
    note_text: Dollar base net retention tells how much ARR from accounts active 1
      year ago has been retained, values less than 100 means that you have decreased
      your active ARR, values over 100 means you have increased through upsells
    listen:
      Customer Success Manager: csm.name
    row: 6
    col: 8
    width: 5
    height: 2
  - name: "<b>Active Opportunities</b>"
    title: "<b>Active Opportunities</b>"
    type: text
    title_text: "<b>Active Opportunities</b>"
    row: 10
    col: 0
    width: 24
    height: 3
  - title: Qualified Upsell Opportunities
    name: Qualified Upsell Opportunities
    model: sfdc_demo
    explore: opportunity_line_item
    type: looker_grid
    fields: [account.account_name, opportunity_line_item.total_arr, opportunity.short_id,
      opportunity.stage_name, opportunity.close_date, sales_rep.name]
    filters:
      opportunity.type: Addon/Upsell
      opportunity.stage_name: "-Active Lead,-Closed Lost,-Closed Won"
    sorts: [opportunity.close_date desc]
    limit: 500
    query_timezone: America/Los_Angeles
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
      opportunity_line_item.total_arr:
        is_active: true
        palette:
          palette_id: 85de97da-2ded-4dec-9dbd-e6a7d36d5825
          collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
    x_axis_gridlines: false
    y_axis_gridlines: true
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
      Customer Success Manager: csm.name
    row: 13
    col: 12
    width: 12
    height: 8
  - title: Number of Accounts by Daily Chat Tier
    name: Number of Accounts by Daily Chat Tier
    model: sfdc_demo
    explore: daily_user_count
    type: looker_column
    fields: [daily_user_count.event_date, account.count, daily_account_tickets.number_chats_tier]
    pivots: [daily_account_tickets.number_chats_tier]
    fill_fields: [daily_user_count.event_date]
    filters:
      daily_user_count.event_date: 30 days
      daily_account_tickets.number_chats_tier: "-Undefined"
    sorts: [daily_user_count.event_date desc, daily_account_tickets.number_chats_tier]
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
    hidden_series: [TXX Undefined - account.count]
    series_types: {}
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    comparison_label: Urgent Tickets
    defaults_version: 1
    listen:
      Customer Success Manager: csm.name
    row: 32
    col: 0
    width: 12
    height: 11
  - title: Accounts with Poor Satisfaction Ratings
    name: Accounts with Poor Satisfaction Ratings
    model: sfdc_demo
    explore: daily_user_count
    type: single_value
    fields: [account.count]
    filters:
      daily_user_count.event_date: 30 days
      daily_account_tickets.csat: "<=2"
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
    color_application:
      collection_id: f14810d2-98d7-42df-82d0-bc185a074e42
      palette_id: 89f8fd99-5003-4efd-ae1a-ae0aa28825ca
    custom_color: "#E57947"
    defaults_version: 1
    listen:
      Customer Success Manager: csm.name
    row: 27
    col: 0
    width: 6
    height: 5
  - title: Accounts with Urgent Support Tickets
    name: Accounts with Urgent Support Tickets
    model: sfdc_demo
    explore: daily_user_count
    type: single_value
    fields: [account.count]
    filters:
      daily_user_count.event_date: 30 days
      daily_account_tickets.urgent_tickets: ">=1"
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
    color_application:
      collection_id: f14810d2-98d7-42df-82d0-bc185a074e42
      palette_id: 89f8fd99-5003-4efd-ae1a-ae0aa28825ca
    custom_color: "#FBB555"
    defaults_version: 1
    listen:
      Customer Success Manager: csm.name
    row: 27
    col: 6
    width: 6
    height: 5
  - name: ''
    title: ''
    type: text
    body_text: |-
      <div class='alert alert-info'><font color='#282828' size='5'><center><b>Customer Support</b></center></font></div>
    row: 24
    col: 0
    width: 12
    height: 3
  - name: " (2)"
    title: " (2)"
    type: text
    body_text: |-
      <div class='alert alert-info'><font color='#282828' size='5'><center><b>Product Usage</b></center></font></div>
    row: 24
    col: 12
    width: 12
    height: 3
  - title: Accounts by % Active Users
    name: Accounts by % Active Users
    model: sfdc_demo
    explore: daily_user_count
    type: looker_column
    fields: [daily_client_usage.percent_active_tier, account.count, daily_user_count.event_date]
    pivots: [daily_client_usage.percent_active_tier]
    fill_fields: [daily_user_count.event_date]
    filters:
      daily_user_count.event_date: 30 days
      daily_client_usage.percent_active_tier: "-Undefined"
    sorts: [daily_user_count.event_date desc, daily_client_usage.percent_active_tier]
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
    y_axes: [{label: '', orientation: left, series: [{axisId: Below 25 - 0 - account.count,
            id: Below 25 - 0 - account.count, name: Below 25}, {axisId: 25 to 49 -
              1 - account.count, id: 25 to 49 - 1 - account.count, name: 25 to 49},
          {axisId: 50 to 74 - 2 - account.count, id: 50 to 74 - 2 - account.count,
            name: 50 to 74}, {axisId: 75 to 99 - 3 - account.count, id: 75 to 99 -
              3 - account.count, name: 75 to 99}, {axisId: 100 or Above - 4 - account.count,
            id: 100 or Above - 4 - account.count, name: 100 or Above}, {axisId: Undefined
              - 5 - account.count, id: Undefined - 5 - account.count, name: Undefined}],
        showLabels: false, showValues: true, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    hidden_series: [Undefined - 5 - account.count]
    series_types: {}
    series_colors:
      Below 25 - 0 - account.count: "#E57947"
      25 to 49 - 1 - account.count: "#2196F3"
      50 to 74 - 2 - account.count: "#04b5cc"
      75 to 99 - 3 - account.count: "#4CAF50"
      Undefined - 5 - account.count: "#9E9E9E"
      100 or Above - 4 - account.count: "#FBB555"
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    listen:
      Customer Success Manager: csm.name
    row: 35
    col: 12
    width: 12
    height: 8
  - title: Accounts by Events per User Tier
    name: Accounts by Events per User Tier
    model: sfdc_demo
    explore: daily_user_count
    type: looker_column
    fields: [account.count, daily_user_count.event_date, daily_client_usage.total_event_per_user_tier]
    pivots: [daily_client_usage.total_event_per_user_tier]
    fill_fields: [daily_user_count.event_date, daily_client_usage.total_event_per_user_tier]
    filters:
      daily_user_count.event_date: 30 days
      daily_client_usage.percent_active_tier: "-Undefined"
    sorts: [daily_user_count.event_date desc, daily_client_usage.total_event_per_user_tier]
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
    y_axes: [{label: '', orientation: left, series: [{axisId: Below 25 - 0 - account.count,
            id: Below 25 - 0 - account.count, name: Below 25}, {axisId: 25 to 49 -
              1 - account.count, id: 25 to 49 - 1 - account.count, name: 25 to 49},
          {axisId: 50 to 74 - 2 - account.count, id: 50 to 74 - 2 - account.count,
            name: 50 to 74}, {axisId: 75 to 99 - 3 - account.count, id: 75 to 99 -
              3 - account.count, name: 75 to 99}, {axisId: 100 or Above - 4 - account.count,
            id: 100 or Above - 4 - account.count, name: 100 or Above}, {axisId: Undefined
              - 5 - account.count, id: Undefined - 5 - account.count, name: Undefined}],
        showLabels: false, showValues: true, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    hidden_series: [Undefined - 5 - account.count]
    series_types: {}
    series_colors:
      Below 25 - 0 - account.count: "#E57947"
      25 to 49 - 1 - account.count: "#2196F3"
      50 to 74 - 2 - account.count: "#04b5cc"
      75 to 99 - 3 - account.count: "#4CAF50"
      Undefined - 5 - account.count: "#9E9E9E"
      100 or Above - 4 - account.count: "#FBB555"
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    listen:
      Customer Success Manager: csm.name
    row: 27
    col: 12
    width: 12
    height: 8
  - title: Accounts by Health Score
    name: Accounts by Health Score
    model: sfdc_demo
    explore: daily_user_count
    type: looker_pie
    fields: [account.count, daily_user_count.overall_health]
    filters:
      daily_user_count.event_date: 1 days ago for 1 days
    sorts: [account.count desc]
    limit: 500
    column_limit: 50
    value_labels: legend
    label_type: labPer
    inner_radius: 50
    color_application:
      collection_id: f14810d2-98d7-42df-82d0-bc185a074e42
      palette_id: 89f8fd99-5003-4efd-ae1a-ae0aa28825ca
      options:
        steps: 5
    series_colors:
      At Risk: "#FBB555"
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
    listen:
      Customer Success Manager: csm.name
    row: 3
    col: 13
    width: 8
    height: 7
  - title: Account Overview
    name: Account Overview
    model: sfdc_demo
    explore: daily_user_count
    type: looker_grid
    fields: [account.account_name, daily_user_count.average_health_score, daily_client_sessions.estimated_usage_time,
      daily_client_sessions.total_sessions, daily_client_usage.average_percent_active_users,
      daily_client_usage.average_distinct_users]
    filters:
      daily_user_count.event_date: 30 days
      account.account_name: "-NULL"
      account.type: Customer
    sorts: [daily_client_sessions.estimated_usage_time desc]
    limit: 500
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
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    series_cell_visualizations:
      daily_user_count.support_score:
        is_active: true
      daily_user_count.average_health_score:
        is_active: true
        palette:
          palette_id: 1e4d66b9-f066-4c33-b0b7-cc10b4810688
          collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
    x_axis_gridlines: false
    y_axis_gridlines: true
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
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    series_types: {}
    swap_axes: true
    interpolation: linear
    defaults_version: 1
    hidden_fields:
    listen:
      Customer Success Manager: csm.name
    row: 43
    col: 0
    width: 24
    height: 11
  - title: Average $BNR for Team
    name: Average $BNR for Team
    model: sfdc_demo
    explore: daily_active_accounts
    type: single_value
    fields: [daily_active_accounts.net_retention, daily_active_accounts.calendar_date,
      csm.name]
    filters:
      daily_active_accounts.calendar_date: 1 days
    sorts: [daily_active_accounts.calendar_date desc]
    limit: 500
    dynamic_fields: [{table_calculation: average_net_retention, label: Average Net
          Retention, expression: 'mean(${daily_active_accounts.net_retention})', value_format: !!null '',
        value_format_name: percent_1, _kind_hint: measure, _type_hint: number}]
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
    color_application:
      collection_id: f14810d2-98d7-42df-82d0-bc185a074e42
      palette_id: 89f8fd99-5003-4efd-ae1a-ae0aa28825ca
    custom_color: "#E57947"
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#aed5ff",
        font_color: "#f4fff4", color_application: {collection_id: f14810d2-98d7-42df-82d0-bc185a074e42,
          palette_id: 90a81bec-f33f-43c9-a36a-0ea5f037dfa0}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
    hidden_fields: [daily_active_accounts.calendar_date, daily_active_accounts.net_retention,
      csm.name]
    series_types: {}
    defaults_version: 1
    note_state: collapsed
    note_display: hover
    note_text: Dollar base net retention tells how much ARR from accounts active 1
      year ago has been retained, values less than 100 means that you have decreased
      your active ARR, values over 100 means you have increased through upsells
    listen: {}
    row: 8
    col: 8
    width: 5
    height: 2
  - title: Average ARR for Team
    name: Average ARR for Team
    model: sfdc_demo
    explore: opportunity_line_item
    type: single_value
    fields: [opportunity_line_item.total_arr, csm.name]
    filters:
      opportunity.is_active_contract: 'Yes'
    limit: 500
    column_limit: 50
    dynamic_fields: [{table_calculation: average_arr_for_team, label: Average ARR
          for Team, expression: 'mean(${opportunity_line_item.total_arr})', value_format: !!null '',
        value_format_name: usd_0, _kind_hint: measure, _type_hint: number}]
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    value_format: ''
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#aed5ff",
        font_color: "#f4fff9", color_application: {collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7,
          palette_id: 85de97da-2ded-4dec-9dbd-e6a7d36d5825}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
    defaults_version: 1
    hidden_fields: [opportunity_line_item.total_arr, csm.name]
    listen: {}
    row: 8
    col: 3
    width: 5
    height: 2
  filters:
  - name: Customer Success Manager
    title: Customer Success Manager
    type: field_filter
    default_value: Melissa Glaser
    allow_multiple_values: true
    required: false
    model: sfdc_demo
    explore: daily_user_count
    listens_to_filters: []
    field: csm.name
