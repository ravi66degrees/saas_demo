view: opportunity_stage {
  sql_table_name: `looker-private-demo.salesforce.opportunity_stage` ;;
  drill_fields: [id]

  dimension: id {
    label: "ID"
    primary_key: yes
    type: string
    sql: ${TABLE}.ID;;
  }

  dimension_group: created {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: timestamp(${TABLE}.CREATED_DATE);;
  }

  dimension: default_probability {
    label: "Default Probability"
    type: number
    sql: ${TABLE}.DEFAULT_PROBABILITY;;
  }

  dimension: description {
    label: "Description"
    type: string
    sql: ${TABLE}.DESCRIPTION;;
  }

  dimension: forecast_category {
    label: "Forecast Category"
    type: string
    sql: ${TABLE}.FORECAST_CATEGORY;;
  }

  dimension: forecast_category_name {
    label: "Forecast Category Name"
    type: string
    sql: ${TABLE}.FORECAST_CATEGORY_NAME;;
  }

  dimension: is_active {
    label: "Is Active (y/n)"
    type: yesno
    sql: ${TABLE}.IS_ACTIVE;;
  }

  dimension: is_closed {
    label: "Is Closed (y/n)"
    type: yesno
    sql: ${TABLE}.IS_CLOSED;;
  }

  dimension: is_won {
    label: "Is Won (y/n)"
    type: yesno
    sql: ${TABLE}.IS_WON;;
  }

  dimension: master_label {
    label: "Master Label"
    type: string
    sql: ${TABLE}.MASTER_LABEL;;
  }

  dimension: sort_order {
    label: "Sort Order"
    type: number
    sql: ${TABLE}.SORT_ORDER;;
  }

  measure: count {
    type: count
    drill_fields: [id, forecast_category_name]
  }
}
