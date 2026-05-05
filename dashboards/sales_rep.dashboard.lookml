- dashboard: sales_rep
  title: Sales Rep
  layout: newspaper
  elements:
  - title: License Attainment
    name: License Attainment
    model: sfdc_demo
    explore: opportunity_line_item
    type: single_value
    fields: [opportunity_line_item.total_arr, sales_rep.annual_arr_quota]
    filters:
      opportunity.close_date: this year
      opportunity.stage_name: Closed Won
    sorts: [opportunity_line_item.total_arr desc]
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
    series_types: {}
    defaults_version: 1
    hidden_fields: [sales_rep.quarterly_quota]
    listen:
      Sales Rep Name: sales_rep.name
    row: 3
    col: 0
    width: 8
    height: 4
  - name: Annual Quota Attainment
    title: Annual Quota Attainment
    type: text
    title_text: Annual Quota Attainment
    subtitle_text: How am I tracking towards my number?
    row: 0
    col: 0
    width: 24
    height: 3
  - title: Services Attainment
    name: Services Attainment
    model: sfdc_demo
    explore: opportunity_line_item
    type: single_value
    fields: [sales_rep.annual_services_quota, opportunity_line_item.total_nrr]
    filters:
      opportunity.close_date: this year
      opportunity.stage_name: Closed Won
    sorts: [opportunity_line_item.total_nrr desc]
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
    series_types: {}
    defaults_version: 1
    hidden_fields: [sales_rep.quarterly_quota]
    listen:
      Sales Rep Name: sales_rep.name
    row: 3
    col: 8
    width: 8
    height: 4
  - title: Projected Attainment
    name: Projected Attainment
    model: sfdc_demo
    explore: opportunity_line_item
    type: single_value
    fields: [sales_rep.annual_arr_quota, days_into_year, opportunity_line_item.total_arr]
    filters:
      opportunity.close_date: this year
      opportunity.stage_name: Closed Won
    sorts: [opportunity_line_item.total_arr desc]
    limit: 500
    column_limit: 50
    dynamic_fields: [{table_calculation: projected_quota_attainment, label: Projected
          Quota Attainment, expression: "${projected_closed_won}/${sales_rep.annual_arr_quota}",
        value_format: !!null '', value_format_name: percent_0, _kind_hint: measure,
        _type_hint: number}, {table_calculation: projected_closed_won, label: Projected
          Closed Won, expression: "(${opportunity_line_item.total_arr}/${days_into_year})*365",
        value_format: !!null '', value_format_name: usd_0, _kind_hint: measure, _type_hint: number},
      {dimension: days_into_year, label: Days into Year, expression: "diff_days(\n\
          \    date(extract_years(now()),01,01), \n    now())", value_format: !!null '',
        value_format_name: !!null '', _kind_hint: dimension, _type_hint: number}]
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    conditional_formatting: [{type: greater than, value: 1, background_color: '',
        font_color: "#4CAF50", color_application: {collection_id: f14810d2-98d7-42df-82d0-bc185a074e42,
          palette_id: 493e0f89-1e28-4f9b-9f49-9cb1e77a0331}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}, {type: equal to, value: !!null '',
        background_color: "#2196F3", font_color: !!null '', color_application: {collection_id: f14810d2-98d7-42df-82d0-bc185a074e42,
          palette_id: 493e0f89-1e28-4f9b-9f49-9cb1e77a0331}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
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
    series_types: {}
    defaults_version: 1
    hidden_fields: [sales_rep.quarterly_quota, sales_rep.annual_arr_quota, days_into_year,
      opportunity_line_item.total_arr]
    note_state: collapsed
    note_display: hover
    note_text: This is simply a linear projection and does not consider things like
      forecast category or opportunity stage
    listen:
      Sales Rep Name: sales_rep.name
    row: 3
    col: 16
    width: 8
    height: 4
  - title: Annual License Quota Attainment
    name: Annual License Quota Attainment
    model: sfdc_demo
    explore: opportunity_line_item
    type: looker_bar
    fields: [opportunity_line_item.closed_won_arr, opportunity_line_item.upside_arr,
      opportunity_line_item.forecast_arr, opportunity_line_item.pipeline_arr, sales_rep.annual_arr_quota]
    filters:
      opportunity.close_date: this year
      opportunity.stage_name: "-Closed Lost"
    sorts: [opportunity_line_item.closed_won_arr desc]
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
    hidden_series: [forecast, pipeline]
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
    hidden_fields: [sales_rep.quarterly_quota, sales_rep.annual_arr_quota, opportunity_line_item.closed_won_arr,
      opportunity_line_item.upside_arr, opportunity_line_item.forecast_arr, opportunity_line_item.pipeline_arr]
    listen:
      Sales Rep Name: sales_rep.name
    row: 7
    col: 0
    width: 24
    height: 5
  - title: Active Opps with Close Date this Quarter
    name: Active Opps with Close Date this Quarter
    model: sfdc_demo
    explore: opportunity_line_item
    type: looker_grid
    fields: [account.account_name, opportunity.forecast_category, opportunity.stage_name,
      opportunity.close_date, opportunity.amount, opportunity_line_item.total_arr,
      opportunity_line_item.total_nrr]
    filters:
      opportunity.type: New Business,Addon/Upsell
      opportunity.stage_name: "-Closed Lost,-Closed Won"
      opportunity.forecast_category: "-Omitted"
      opportunity.close_date: this quarter
    sorts: [opportunity.close_date desc]
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
    enable_conditional_formatting: true
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    series_labels:
      opportunity.total_amount: ACV
      opportunity_line_item.total_nrr: NRR
      opportunity_line_item.total_arr: ARR
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
      Sales Rep Name: sales_rep.name
    row: 15
    col: 12
    width: 12
    height: 7
  - name: Opportunity Priority
    title: Opportunity Priority
    type: text
    title_text: Opportunity Priority
    subtitle_text: Which opportunities should I be paying attention to?
    body_text: ''
    row: 12
    col: 0
    width: 24
    height: 3
  - name: Current Pipeline
    title: Current Pipeline
    type: text
    title_text: Current Pipeline
    subtitle_text: Where do I need to improve my pipeline?
    row: 22
    col: 0
    width: 24
    height: 3
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
      Sales Rep Name: sales_rep.name
    row: 25
    col: 0
    width: 4
    height: 4
  - title: 'Active Opps: Upsell'
    name: 'Active Opps: Upsell'
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
      Sales Rep Name: sales_rep.name
    row: 25
    col: 4
    width: 5
    height: 4
  - title: ACV by Stage Name
    name: ACV by Stage Name
    model: sfdc_demo
    explore: opportunity_line_item
    type: looker_bar
    fields: [opportunity.total_amount, opportunity.stage_name, opportunity.count]
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
      Sales Rep Name: sales_rep.name
    row: 25
    col: 13
    width: 11
    height: 11
  - title: ACV by Forecast Category
    name: ACV by Forecast Category
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
      Sales Rep Name: sales_rep.name
    row: 29
    col: 0
    width: 13
    height: 7
  - title: Self Sourced Opps
    name: Self Sourced Opps
    model: sfdc_demo
    explore: opportunity_line_item
    type: single_value
    fields: [opportunity.count_self_sources, sales_rep.self_generated_ops_goals]
    filters:
      opportunity.created_date: this quarter
    sorts: [opportunity.count_self_sources desc]
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
    comparison_label: Quarter Goal
    conditional_formatting: [{type: less than, value: 3, background_color: '', font_color: "#E57947",
        color_application: {collection_id: f14810d2-98d7-42df-82d0-bc185a074e42, palette_id: 493e0f89-1e28-4f9b-9f49-9cb1e77a0331},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    defaults_version: 1
    listen:
      Sales Rep Name: sales_rep.name
    row: 25
    col: 9
    width: 4
    height: 4
  - title: Opportunities by Close Date
    name: Opportunities by Close Date
    model: sfdc_demo
    explore: opportunity_line_item
    type: looker_column
    fields: [opportunity.stage_name, opportunity.close_date, opportunity_line_item.total_arr]
    pivots: [opportunity.stage_name]
    filters:
      opportunity.type: New Business,Addon/Upsell
      opportunity.stage_name: "-Closed Lost,-Closed Won"
      opportunity.forecast_category: "-Omitted"
      opportunity.close_date: this quarter
    sorts: [opportunity.close_date, opportunity.stage_name 0]
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
    show_value_labels: true
    label_density: 25
    x_axis_scale: ordinal
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
    y_axes: [{label: '', orientation: left, series: [{axisId: Active Lead - 1 - opportunity_line_item.total_arr,
            id: Active Lead - 1 - opportunity_line_item.total_arr, name: Active Lead},
          {axisId: Qualified - 2 - opportunity_line_item.total_arr, id: Qualified
              - 2 - opportunity_line_item.total_arr, name: Qualified}, {axisId: In
              Trial - 3 - opportunity_line_item.total_arr, id: In Trial - 3 - opportunity_line_item.total_arr,
            name: In Trial}], showLabels: false, showValues: false, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    label_value_format: $#,##0,"K"
    series_types: {}
    series_labels:
      opportunity.total_amount: ACV
      opportunity_line_item.total_nrr: NRR
      opportunity_line_item.total_arr: ARR
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
      Sales Rep Name: sales_rep.name
    row: 15
    col: 6
    width: 6
    height: 7
  - title: Number of Opps by Days in Current Stage
    name: Number of Opps by Days in Current Stage
    model: sfdc_demo
    explore: opportunity_line_item
    type: looker_column
    fields: [opportunity.count, opportunity.days_in_current_stage_tier, opportunity.is_stale_opportunity]
    pivots: [opportunity.is_stale_opportunity]
    fill_fields: [opportunity.days_in_current_stage_tier, opportunity.is_stale_opportunity]
    filters:
      opportunity.type: New Business,Addon/Upsell
      opportunity.stage_name: "-Closed Lost,-Closed Won"
      opportunity.forecast_category: "-Omitted"
      opportunity.close_date: this quarter
    sorts: [opportunity.days_in_current_stage_tier, opportunity.is_stale_opportunity]
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
    show_value_labels: true
    label_density: 25
    x_axis_scale: ordinal
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
    y_axes: [{label: '', orientation: left, series: [{axisId: Active Lead - 1 - opportunity_line_item.total_arr,
            id: Active Lead - 1 - opportunity_line_item.total_arr, name: Active Lead},
          {axisId: Qualified - 2 - opportunity_line_item.total_arr, id: Qualified
              - 2 - opportunity_line_item.total_arr, name: Qualified}, {axisId: In
              Trial - 3 - opportunity_line_item.total_arr, id: In Trial - 3 - opportunity_line_item.total_arr,
            name: In Trial}], showLabels: false, showValues: false, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    hide_legend: true
    label_value_format: ''
    series_types: {}
    series_colors:
      Yes - opportunity.count: "#E57947"
    series_labels:
      opportunity.total_amount: ACV
      opportunity_line_item.total_nrr: NRR
      opportunity_line_item.total_arr: ARR
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
      Sales Rep Name: sales_rep.name
    row: 15
    col: 0
    width: 6
    height: 7
  filters:
  - name: Sales Rep Name
    title: Sales Rep Name
    type: field_filter
    default_value: Donna Pepper
    allow_multiple_values: true
    required: false
    model: sfdc_demo
    explore: opportunity_line_item
    listens_to_filters: []
    field: sales_rep.name
