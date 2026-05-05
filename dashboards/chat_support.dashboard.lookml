- dashboard: chat_support
  title: Chat Support
  layout: newspaper
  elements:
  - name: Chatter KPIs
    title: Chatter KPIs
    type: text
    title_text: Chatter KPIs
    row: 0
    col: 0
    width: 24
    height: 2
  - title: "[Team] Average Tickets / Week"
    name: "[Team] Average Tickets / Week"
    model: sfdc_demo
    explore: ticket
    type: single_value
    fields: [ticket.average_tickets_per_week, assignee.count]
    filters:
      ticket.created_date: 1 years
    limit: 500
    column_limit: 50
    dynamic_fields: [{table_calculation: average_number_of_tickets_per_chatter, label: Average
          Number of Tickets per Chatter, expression: "${ticket.average_tickets_per_week}/${assignee.count}",
        value_format: !!null '', value_format_name: decimal_1, _kind_hint: measure,
        _type_hint: number}]
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#f8fffc"
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#2196F3",
        font_color: !!null '', color_application: {collection_id: f14810d2-98d7-42df-82d0-bc185a074e42,
          palette_id: 493e0f89-1e28-4f9b-9f49-9cb1e77a0331}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
    series_types: {}
    defaults_version: 1
    hidden_fields: [ticket.average_tickets_per_week, assignee.count]
    note_state: collapsed
    note_display: hover
    note_text: The average number of tickets, per chatter, across the whole team this
      year
    listen: {}
    row: 6
    col: 6
    width: 6
    height: 2
  - title: Average Tickets per Week
    name: Average Tickets per Week
    model: sfdc_demo
    explore: ticket
    type: single_value
    fields: [ticket.count, ticket.average_tickets_per_week, tickets_last_7_days]
    limit: 500
    column_limit: 50
    dynamic_fields: [{measure: tickets_last_7_days, based_on: ticket.count, type: count_distinct,
        label: Tickets Last 7 Days, value_format: !!null '', value_format_name: !!null '',
        _kind_hint: measure, _type_hint: number, filter_expression: 'diff_days(${ticket.created_date},now())
          <= 7 '}]
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    comparison_label: Tickets, Last 7 Days
    defaults_version: 1
    series_types: {}
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
    hidden_fields: [ticket.count]
    listen:
      Chatter Name: assignee.name
    row: 2
    col: 6
    width: 6
    height: 4
  - title: Average CSAT
    name: Average CSAT
    model: sfdc_demo
    explore: ticket
    type: single_value
    fields: [satisfaction_ratings.average_csat, satisfaction_ratings.percent_tickets_with_rating]
    limit: 500
    column_limit: 50
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
    listen:
      Chatter Name: assignee.name
    row: 2
    col: 12
    width: 6
    height: 4
  - title: FCR Rate
    name: FCR Rate
    model: sfdc_demo
    explore: ticket
    type: single_value
    fields: [ticket.first_contact_resolution, fcr_goal]
    sorts: [ticket.first_contact_resolution desc]
    limit: 500
    column_limit: 50
    dynamic_fields: [{dimension: fcr_goal, label: FCR Goal, expression: 95/100, value_format: !!null '',
        value_format_name: !!null '', _kind_hint: dimension, _type_hint: number}]
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: progress
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    comparison_label: 95% FCR Goal
    defaults_version: 1
    note_state: collapsed
    note_display: hover
    note_text: First Contract Resolution Rate - was the issue resolved on the first
      contact with a customer
    listen:
      Chatter Name: assignee.name
    row: 2
    col: 18
    width: 6
    height: 4
  - title: "[Team] Average CSAT"
    name: "[Team] Average CSAT"
    model: sfdc_demo
    explore: ticket
    type: single_value
    fields: [satisfaction_ratings.average_csat]
    limit: 500
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
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#2196F3",
        font_color: !!null '', color_application: {collection_id: f14810d2-98d7-42df-82d0-bc185a074e42,
          palette_id: 493e0f89-1e28-4f9b-9f49-9cb1e77a0331}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
    defaults_version: 1
    listen: {}
    row: 6
    col: 12
    width: 6
    height: 2
  - title: "[Team] FCR Rate"
    name: "[Team] FCR Rate"
    model: sfdc_demo
    explore: ticket
    type: single_value
    fields: [ticket.first_contact_resolution]
    limit: 500
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
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#2196F3",
        font_color: !!null '', color_application: {collection_id: f14810d2-98d7-42df-82d0-bc185a074e42,
          palette_id: 493e0f89-1e28-4f9b-9f49-9cb1e77a0331}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
    defaults_version: 1
    listen: {}
    row: 6
    col: 18
    width: 6
    height: 2
  - name: Tickets
    title: Tickets
    type: text
    title_text: Tickets
    row: 8
    col: 0
    width: 24
    height: 3
  - title: Unresolved Tickets
    name: Unresolved Tickets
    model: sfdc_demo
    explore: ticket
    type: single_value
    fields: [ticket.count, ticket.urgent_tickets]
    filters:
      ticket.status: open,pending,new
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#E57947"
    series_types: {}
    defaults_version: 1
    listen:
      Chatter Name: assignee.name
    row: 2
    col: 0
    width: 6
    height: 6
  - name: Quality
    title: Quality
    type: text
    title_text: Quality
    row: 25
    col: 0
    width: 24
    height: 3
  - name: Recent Bugs / Feature Requests
    title: Recent Bugs / Feature Requests
    type: text
    title_text: Recent Bugs / Feature Requests
    row: 36
    col: 0
    width: 24
    height: 3
  - title: Tickets by Topic Category
    name: Tickets by Topic Category
    model: sfdc_demo
    explore: ticket
    type: looker_column
    fields: [ticket.count, tags.topic_category, ticket.created_week]
    pivots: [tags.topic_category]
    fill_fields: [ticket.created_week]
    filters:
      ticket.created_week: 8 weeks
    sorts: [ticket.count desc 0, tags.topic_category]
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
    y_axes: [{label: '', orientation: left, series: [{axisId: admin - ticket.count,
            id: admin - ticket.count, name: admin}, {axisId: authentication - ticket.count,
            id: authentication - ticket.count, name: authentication}, {axisId: dev
              - ticket.count, id: dev - ticket.count, name: dev}, {axisId: front-end
              - ticket.count, id: front-end - ticket.count, name: front-end}, {axisId: sharing
              - ticket.count, id: sharing - ticket.count, name: sharing}, {axisId: system
              - ticket.count, id: system - ticket.count, name: system}, {axisId: unknown
              - ticket.count, id: unknown - ticket.count, name: unknown}], showLabels: false,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    hidden_series: [unknown - ticket.count]
    series_colors:
      unknown - ticket.count: "#9E9E9E"
      system - ticket.count: "#FBB555"
    defaults_version: 1
    listen:
      Chatter Name: assignee.name
    row: 18
    col: 0
    width: 9
    height: 7
  - title: Ticket Request Reason
    name: Ticket Request Reason
    model: sfdc_demo
    explore: ticket
    type: looker_donut_multiples
    fields: [ticket.reason, ticket.count]
    pivots: [ticket.reason]
    filters:
      ticket.created_week: 8 weeks
      ticket.reason: "-Not a Support Request,-Unknown,-Other"
    sorts: [ticket.count desc 0, ticket.reason]
    limit: 500
    column_limit: 50
    show_value_labels: false
    font_size: 9
    color_application:
      collection_id: f14810d2-98d7-42df-82d0-bc185a074e42
      palette_id: 89f8fd99-5003-4efd-ae1a-ae0aa28825ca
      options:
        steps: 5
    series_colors:
      Bug - ticket.count: "#E57947"
      Why isn't this working? - ticket.count: "#FBB555"
      Feature Request - ticket.count: "#2196F3"
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
      Chatter Name: assignee.name
    row: 18
    col: 9
    width: 6
    height: 7
  - title: FCR and Chat Duration by Complexity Type
    name: FCR and Chat Duration by Complexity Type
    model: sfdc_demo
    explore: ticket
    type: looker_bar
    fields: [ticket.first_contact_resolution, ticket.issue_complexity, ticket.average_chat_duration]
    filters:
      ticket.created_date: 8 weeks
      ticket.issue_complexity: "-NULL"
    sorts: [ticket.issue_complexity, ticket.first_contact_resolution desc]
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
    y_axes: [{label: '', orientation: top, series: [{axisId: ticket.first_contact_resolution,
            id: ticket.first_contact_resolution, name: FCR Rate}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}, {label: !!null '', orientation: bottom, series: [{axisId: ticket.average_chat_duration,
            id: ticket.average_chat_duration, name: Average Chat Duration}], showLabels: false,
        showValues: false, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    size_by_field: ticket.average_chat_duration
    hidden_series: [ticket.issue_complexity___null - ticket.issue_complexity_sort___null
        - ticket.first_contact_resolution]
    series_types:
      ticket.average_chat_duration: scatter
    series_labels: {}
    show_null_points: true
    defaults_version: 1
    hidden_fields: []
    hidden_points_if_no: []
    listen:
      Chatter Name: assignee.name
    row: 18
    col: 15
    width: 9
    height: 7
  - title: Number of Tickets for Each Chatter
    name: Number of Tickets for Each Chatter
    model: sfdc_demo
    explore: ticket
    type: looker_column
    fields: [assignee.name, ticket.count, assignee.is_chatter]
    pivots: [assignee.is_chatter]
    fill_fields: [assignee.is_chatter]
    filters:
      ticket.created_week: 8 weeks
      assignee.name: "-NULL"
    sorts: [ticket.count desc 2, assignee.is_chatter 0]
    limit: 500
    column_limit: 50
    row_total: right
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
    y_axes: [{label: '', orientation: left, series: [{axisId: No - ticket.count, id: No
              - ticket.count, name: 'No'}, {axisId: Yes - ticket.count, id: Yes -
              ticket.count, name: 'Yes'}], showLabels: false, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    hide_legend: true
    series_colors:
      Yes - ticket.count: "#2196F3"
      No - ticket.count: "#b6cbf0"
    defaults_version: 1
    listen:
      Chatter Name: assignee.chatter_filter
    row: 11
    col: 0
    width: 12
    height: 7
  - title: Average Duration for Each Chatter
    name: Average Duration for Each Chatter
    model: sfdc_demo
    explore: ticket
    type: looker_column
    fields: [assignee.name, assignee.is_chatter, ticket.average_chat_duration]
    pivots: [assignee.is_chatter]
    fill_fields: [assignee.is_chatter]
    filters:
      ticket.created_week: 8 weeks
      assignee.name: "-NULL"
    sorts: [assignee.is_chatter 0, ticket.average_chat_duration desc 2]
    limit: 500
    column_limit: 50
    row_total: right
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
    y_axes: [{label: '', orientation: left, series: [{axisId: No - ticket.count, id: No
              - ticket.count, name: 'No'}, {axisId: Yes - ticket.count, id: Yes -
              ticket.count, name: 'Yes'}], showLabels: false, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    hide_legend: true
    series_colors:
      Yes - ticket.count: "#2196F3"
      No - ticket.count: "#b6cbf0"
      Yes - ticket.average_chat_duration: "#2196F3"
      No - ticket.average_chat_duration: "#b6cbf0"
    defaults_version: 1
    listen:
      Chatter Name: assignee.chatter_filter
    row: 11
    col: 12
    width: 12
    height: 7
  - title: Satisfaction Rating & Response Rate
    name: Satisfaction Rating & Response Rate
    model: sfdc_demo
    explore: ticket
    type: looker_column
    fields: [satisfaction_ratings.average_csat, satisfaction_ratings.percent_tickets_with_rating,
      ticket.created_week]
    fill_fields: [ticket.created_week]
    filters:
      ticket.created_week: 8 weeks
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
    y_axes: [{label: '', orientation: left, series: [{axisId: satisfaction_ratings.average_csat,
            id: satisfaction_ratings.average_csat, name: Average CSAT}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}, {label: !!null '', orientation: right, series: [{axisId: satisfaction_ratings.percent_tickets_with_rating,
            id: satisfaction_ratings.percent_tickets_with_rating, name: Percent Tickets
              with Rating}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    series_types:
      satisfaction_ratings.percent_tickets_with_rating: line
    series_colors:
      satisfaction_ratings.percent_tickets_with_rating: "#b6cbf0"
    series_labels:
      satisfaction_ratings.percent_tickets_with_rating: Response Rate
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
    listen:
      Chatter Name: assignee.name
    row: 28
    col: 0
    width: 9
    height: 8
  - title: Rent Satisfaction Ratings
    name: Rent Satisfaction Ratings
    model: sfdc_demo
    explore: ticket
    type: looker_grid
    fields: [ticket.id, ticket.created_date, account.account_name, submitter.email,
      satisfaction_ratings.score, satisfaction_ratings.comment]
    filters:
      ticket.created_week: 8 weeks
      satisfaction_ratings.score: "-NULL"
    sorts: [ticket.created_date desc]
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
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
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
      Chatter Name: assignee.name
    row: 28
    col: 9
    width: 15
    height: 8
  - title: JIRA Issues
    name: JIRA Issues
    model: sfdc_demo
    explore: ticket
    type: looker_grid
    fields: [issue.key, issue.description, ticket.count, issue.is_issue_resolved,
      issue.created_date, jira_user.name]
    filters:
      ticket.action: feature request submitted,bug submitted
      ticket.created_date: this year
      issue.key: "-NULL"
    sorts: [ticket.count desc]
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
    series_labels:
      user.name: Assignee Name
      issue.key: Issue Key
      issue.description: Description
      ticket.count: Number Support Tickets Submitted
    series_column_widths:
      issue.description: 514
      issue.key: 140
      issue.is_issue_resolved: 87
      issue.created_date: 154
    series_cell_visualizations:
      ticket.count:
        is_active: true
        palette:
          palette_id: 85de97da-2ded-4dec-9dbd-e6a7d36d5825
          collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
    x_axis_gridlines: false
    y_axis_gridlines: false
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
    series_types: {}
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
    title_hidden: true
    listen: {}
    row: 39
    col: 0
    width: 24
    height: 11
  filters:
  - name: Chatter Name
    title: Chatter Name
    type: field_filter
    default_value: Tonya Koop
    allow_multiple_values: true
    required: false
    ui_config:
      type: dropdown_menu
      display: inline
    model: sfdc_demo
    explore: ticket
    listens_to_filters: []
    field: assignee.name
