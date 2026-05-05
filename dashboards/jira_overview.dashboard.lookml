- dashboard: jira_overview
  title: JIRA Overview
  layout: newspaper
  preferred_viewer: dashboards-next
  elements:
  - title: New Issues This Month
    name: New Issues This Month
    model: sfdc_demo
    explore: ticket
    type: looker_grid
    fields: [issue.key, issue.summary, jira_user.name, issue_type.name, issue.story_points,
      ticket.count]
    filters:
      issue.created_date: 5 weeks
      issue.is_issue_resolved: 'No'
      issue_type.name: "-Epic"
    sorts: [ticket.count desc]
    limit: 500
    dynamic_fields: [{measure: tickets_submitted_by_high_value_accounts, based_on: ticket.count,
        type: count_distinct, label: Tickets Submitted by High Value Accounts, value_format: !!null '',
        value_format_name: !!null '', _kind_hint: measure, _type_hint: number, filter_expression: "${account.is_high_value_account}"}]
    query_timezone: America/Los_Angeles
    show_view_names: false
    show_row_numbers: false
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
      ticket.count: Number of Chat Support Tickets
    series_column_widths:
      issue.id: 133
      issue.key: 133
    series_cell_visualizations:
      ticket.count:
        is_active: true
    header_font_color: "#E8EAED"
    header_background_color: "#4285F4"
    defaults_version: 1
    listen: {}
    row: 20
    col: 3
    width: 15
    height: 6
  - name: Current Work
    title: Current Work
    type: text
    title_text: Current Work
    row: 17
    col: 0
    width: 24
    height: 3
  - title: Issues Resolved This Month
    name: Issues Resolved This Month
    model: sfdc_demo
    explore: ticket
    type: single_value
    fields: [issue.number_of_issues_resolved_this_month, issue.number_of_issues_resolved_last_month]
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
    comparison_label: Resolved Last Month
    series_types: {}
    defaults_version: 1
    row: 4
    col: 12
    width: 6
    height: 4
  - title: Average Number of Days to Resolve
    name: Average Number of Days to Resolve
    model: sfdc_demo
    explore: ticket
    type: single_value
    fields: [issue.avg_days_to_resolve_issues_hours]
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
    comparison_label: Resolved Last Month
    series_types: {}
    defaults_version: 1
    listen: {}
    row: 4
    col: 18
    width: 6
    height: 4
  - title: Open Issues
    name: Open Issues
    model: sfdc_demo
    explore: ticket
    type: single_value
    fields: [issue.number_of_open_issues, issue.number_of_open_issues_this_month]
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
    custom_color: ''
    comparison_label: Open Issues This Month
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#FBBC04",
        font_color: "#FFFFFF", color_application: {collection_id: google, palette_id: google-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
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
    listen: {}
    row: 4
    col: 0
    width: 6
    height: 4
  - name: Project Planning Overview
    title: Project Planning Overview
    type: text
    title_text: Project Planning Overview
    subtitle_text: Use this dashboard to prioritize issues and plan sprints
    row: 0
    col: 0
    width: 24
    height: 4
  - title: Total Unresolved Story Points
    name: Total Unresolved Story Points
    model: sfdc_demo
    explore: ticket
    type: single_value
    fields: [issue.total_story_points]
    filters:
      issue.is_issue_resolved: 'No'
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
    comparison_label: Open Issues This Month
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#FBBC04",
        font_color: "#ffffff", color_application: {collection_id: google, palette_id: google-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
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
    listen: {}
    row: 4
    col: 6
    width: 6
    height: 4
  - title: Issues by Project
    name: Issues by Project
    model: sfdc_demo
    explore: ticket
    type: looker_bar
    fields: [issue.total_story_points, project.name, issue.count]
    filters:
      issue.is_issue_resolved: 'No'
      issue.total_story_points: ">0"
      status_category.name: In Progress
    sorts: [issue.total_story_points desc]
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
    y_axes: [{label: '', orientation: bottom, series: [{axisId: issue.total_story_points,
            id: issue.total_story_points, name: Total Story Points}], showLabels: false,
        showValues: false, unpinAxis: false, tickDensity: default, type: linear},
      {label: '', orientation: bottom, series: [{axisId: issue.count, id: issue.count,
            name: Number of Issues}], showLabels: false, showValues: false, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    series_types:
      issue.count: line
    series_colors:
      issue.count: "#BDC1C6"
    series_labels:
      issue.count: Number of Issues
    value_labels: labels
    label_type: labPer
    inner_radius: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    comparison_label: Open Issues This Month
    defaults_version: 1
    listen: {}
    row: 26
    col: 18
    width: 6
    height: 6
  - name: ''
    title: ''
    type: text
    title_text: ''
    subtitle_text: Needs Review
    body_text: ''
    row: 20
    col: 0
    width: 3
    height: 6
  - name: " (2)"
    title: " (2)"
    type: text
    title_text: ''
    subtitle_text: In Progress
    body_text: ''
    row: 26
    col: 0
    width: 3
    height: 6
  - title: Issues by Week Opened
    name: Issues by Week Opened
    model: sfdc_demo
    explore: ticket
    type: looker_column
    fields: [issue_type.name, issue.created_week, issue.number_of_open_issues]
    pivots: [issue_type.name]
    fill_fields: [issue.created_week]
    filters:
      issue_type.name: "-NULL,-Epic"
    sorts: [issue.created_week desc, issue_type.name]
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
    y_axes: [{label: '', orientation: left, series: [{axisId: Bug - issue.number_of_open_issues,
            id: Bug - issue.number_of_open_issues, name: Bug}, {axisId: Design - issue.number_of_open_issues,
            id: Design - issue.number_of_open_issues, name: Design}, {axisId: Emergency
              - issue.number_of_open_issues, id: Emergency - issue.number_of_open_issues,
            name: Emergency}, {axisId: Epic - issue.number_of_open_issues, id: Epic
              - issue.number_of_open_issues, name: Epic}, {axisId: Improvement - issue.number_of_open_issues,
            id: Improvement - issue.number_of_open_issues, name: Improvement}, {axisId: Internal
              Task - issue.number_of_open_issues, id: Internal Task - issue.number_of_open_issues,
            name: Internal Task}, {axisId: New Feature - issue.number_of_open_issues,
            id: New Feature - issue.number_of_open_issues, name: New Feature}, {axisId: Regular
              - issue.number_of_open_issues, id: Regular - issue.number_of_open_issues,
            name: Regular}], showLabels: false, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    hidden_series: [Internal Task - issue.number_of_open_issues, Regular - issue.number_of_open_issues]
    series_types: {}
    series_colors:
      Emergency - issue.number_of_open_issues: "#EA4335"
      Design - issue.number_of_open_issues: "#E8EAED"
      New Feature - issue.number_of_open_issues: "#4285F4"
      Regular - issue.number_of_open_issues: "#EA8600"
      Bug - issue.number_of_open_issues: "#FBBC04"
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    listen: {}
    row: 8
    col: 0
    width: 12
    height: 9
  - title: Current Spring Issues
    name: Current Spring Issues
    model: sfdc_demo
    explore: ticket
    type: looker_grid
    fields: [issue.key, issue.summary, jira_user.name, issue.story_points, issue._remaining_estimate,
      issue.due_date]
    filters:
      issue.due_date: before 2 weeks from now
      status_category.name: In Progress
    sorts: [issue.due_date]
    limit: 500
    dynamic_fields: [{measure: tickets_submitted_by_high_value_accounts, based_on: ticket.count,
        type: count_distinct, label: Tickets Submitted by High Value Accounts, value_format: !!null '',
        value_format_name: !!null '', _kind_hint: measure, _type_hint: number, filter_expression: "${account.is_high_value_account}"}]
    query_timezone: America/Los_Angeles
    show_view_names: false
    show_row_numbers: false
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
    column_order: [issue.key, issue.summary, jira_user.name, issue.story_points, issue._remaining_estimate,
      issue.due_date]
    show_totals: true
    show_row_totals: true
    series_column_widths:
      issue.id: 133
      issue.key: 133
    header_font_color: "#5F6368"
    header_background_color: "#FBBC04"
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: "#4285F4",
        font_color: !!null '', color_application: {collection_id: google, palette_id: google-diverging-0,
          options: {steps: 5}}, bold: false, italic: false, strikethrough: false,
        fields: !!null ''}]
    defaults_version: 1
    listen: {}
    row: 26
    col: 3
    width: 15
    height: 6
  - title: Issues Past Due
    name: Issues Past Due
    model: sfdc_demo
    explore: ticket
    type: single_value
    fields: [issue.count]
    filters:
      issue.due_date: before 0 days ago
      issue.is_issue_resolved: 'No'
    limit: 500
    dynamic_fields: [{measure: tickets_submitted_by_high_value_accounts, based_on: ticket.count,
        type: count_distinct, label: Tickets Submitted by High Value Accounts, value_format: !!null '',
        value_format_name: !!null '', _kind_hint: measure, _type_hint: number, filter_expression: "${account.is_high_value_account}"}]
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
    custom_color: "#EA4335"
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    series_column_widths:
      issue.id: 133
      issue.key: 133
    header_font_color: "#E8EAED"
    header_background_color: "#EA4335"
    defaults_version: 1
    series_types: {}
    listen: {}
    row: 23
    col: 18
    width: 6
    height: 3
  - title: Open Issues from High Value Accounts
    name: Open Issues from High Value Accounts
    model: sfdc_demo
    explore: ticket
    type: single_value
    fields: [issue.count]
    filters:
      account.is_high_value_account: 'Yes'
      status_category.name: "-Done"
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
    custom_color: "#EA4335"
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    y_axes: [{label: '', orientation: left, series: [{axisId: issue.count, id: Yes
              - issue.count, name: 'Yes'}, {axisId: issue.count, id: No - issue.count,
            name: 'No'}], showLabels: false, showValues: false, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
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
    series_types: {}
    point_style: none
    series_colors:
      'Yes': "#4285F4"
      'No': "#EA4335"
    series_labels:
      Yes - issue.count: Already Assigned
      No - issue.count: Not Assigned
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    value_labels: labels
    label_type: labPer
    inner_radius: 50
    defaults_version: 1
    listen: {}
    row: 20
    col: 18
    width: 6
    height: 3
  - name: Completed Work
    title: Completed Work
    type: text
    title_text: Completed Work
    row: 32
    col: 0
    width: 24
    height: 4
  - title: Resolutions by Project
    name: Resolutions by Project
    model: sfdc_demo
    explore: ticket
    type: looker_column
    fields: [project.name, resolution.name, issue.total_story_points]
    pivots: [resolution.name]
    filters:
      resolution.name: "-NULL"
      issue.total_story_points: ">0"
    sorts: [resolution.name 0, issue.total_story_points desc 6]
    limit: 500
    row_total: right
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
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: '', orientation: left, series: [{axisId: Cannot Reproduce - issue.number_of_resolved_issues,
            id: Cannot Reproduce - issue.number_of_resolved_issues, name: Cannot Reproduce},
          {axisId: Duplicate - issue.number_of_resolved_issues, id: Duplicate - issue.number_of_resolved_issues,
            name: Duplicate}, {axisId: Fixed - issue.number_of_resolved_issues, id: Fixed
              - issue.number_of_resolved_issues, name: Fixed}, {axisId: Incomplete
              - issue.number_of_resolved_issues, id: Incomplete - issue.number_of_resolved_issues,
            name: Incomplete}, {axisId: Resolved - issue.number_of_resolved_issues,
            id: Resolved - issue.number_of_resolved_issues, name: Resolved}, {axisId: Won't
              Fix - issue.number_of_resolved_issues, id: Won't Fix - issue.number_of_resolved_issues,
            name: Won't Fix}], showLabels: false, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    series_colors:
      Duplicate - issue.number_of_resolved_issues: "#137333"
      Fixed - issue.number_of_resolved_issues: "#34A853"
      Incomplete - issue.number_of_resolved_issues: "#FBBC04"
      Cannot Reproduce - issue.number_of_resolved_issues: "#4285F4"
      Resolved - issue.number_of_resolved_issues: "#185ABC"
      Won't Fix - issue.number_of_resolved_issues: "#EA4335"
      Duplicate - issue.total_story_points: "#FBBC04"
      Fixed - issue.total_story_points: "#34A853"
      Incomplete - issue.total_story_points: "#E8EAED"
      Resolved - issue.total_story_points: "#185ABC"
      Won't Fix - issue.total_story_points: "#EA4335"
    defaults_version: 1
    listen: {}
    row: 36
    col: 0
    width: 12
    height: 8
  - title: Expected vs Actual Issue Delivery
    name: Expected vs Actual Issue Delivery
    model: sfdc_demo
    explore: ticket
    type: looker_column
    fields: [issue.avg_days_left_delivered, project.name, issue.total_time_estimated,
      issue.total_time_spent]
    filters:
      project.name: "-NULL"
      issue.total_time_estimated: ">0"
    sorts: [issue.total_time_estimated desc]
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
    y_axes: [{label: '', orientation: left, series: [{axisId: issue.total_time_estimated,
            id: issue.total_time_estimated, name: Total Time Estimated}, {axisId: issue.total_time_spent,
            id: issue.total_time_spent, name: Total Time Spent}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}, {label: !!null '', orientation: right, series: [{axisId: issue.avg_days_left_delivered,
            id: issue.avg_days_left_delivered, name: Avg Number of Days Left When
              Delivered}], showLabels: true, showValues: true, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    series_types:
      issue.avg_days_left_delivered: line
    series_colors:
      issue.total_time_estimated: "#34A853"
    show_null_points: true
    defaults_version: 1
    row: 36
    col: 12
    width: 12
    height: 8
  - title: Projects Overview
    name: Projects Overview
    model: sfdc_demo
    explore: ticket
    type: looker_timeline
    fields: [project.name, issue.first_issue_created, issue.last_issue_due, status_category.name]
    filters:
      project.name: "-NULL"
    sorts: [issue.first_issue_created desc]
    limit: 500
    column_limit: 50
    groupBars: true
    labelSize: 10pt
    showLegend: true
    color_application:
      collection_id: google
      custom:
        id: 60644356-16ce-df48-2afa-02b8f2d3a79d
        label: Custom
        type: discrete
        colors:
        - "#4285F4"
        - "#EA4335"
        - "#FBBC04"
        - "#34A853"
        - "#5F6368"
        - "#185ABC"
        - "#9AA0A6"
        - "#B31412"
        - "#BDC1C6"
        - "#EA8600"
        - "#E8EAED"
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
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    series_types: {}
    row: 8
    col: 12
    width: 12
    height: 9
