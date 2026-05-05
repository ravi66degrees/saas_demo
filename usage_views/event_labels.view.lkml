view: event_labels {
  sql_table_name: `looker-private-demo.customer_usage.event_labels`
    ;;

  dimension: event_name {
    label: "Event Name"
    type: string
    sql: ${TABLE}.event_name ;;
  }

  dimension: event_type {
    label: "Event Type"
    type: string
    sql: ${TABLE}.event_type ;;
  }

  dimension: old_event_name {
    hidden: yes
    type: string
    sql: ${TABLE}.old_event_name ;;
  }

  dimension: old_uri {
    hidden: yes
    type: string
    sql: ${TABLE}.old_uri ;;
  }

  dimension: page_type {
    label: "Page Type"
    type: string
    sql: ${TABLE}.page_type ;;
  }

  dimension: uri {
    type: string
    sql: ${TABLE}.uri ;;
  }

#   measure: count {
#     type: count
#     drill_fields: [old_event_name, event_name]
#   }
}
