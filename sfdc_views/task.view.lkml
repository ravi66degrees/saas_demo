view: task {
  sql_table_name: `looker-private-demo.salesforce.task`  ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.ID;;
  }

  dimension: account_id {
    label: "Account ID"
    type: string
    # hidden: yes
    sql: ${TABLE}.ACCOUNT_ID;;
  }

  dimension_group: activity {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: timestamp(${TABLE}.ACTIVITY_DATE);;
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

  dimension: is_archived {
    label: "Is Archived (y/n)"
    type: string
    sql: ${TABLE}.IS_ARCHIVED;;
  }

  dimension: is_closed {
    label: "Is Closed (y/n)"
    type: yesno
    sql: ${TABLE}.IS_CLOSED;;
  }

  dimension: is_deleted {
    label: "Is Deleted (y/n)"
    type: yesno
    sql: ${TABLE}.IS_DELETED;;
  }

  dimension: owner_id {
    label: "Owner ID"
    type: string
    sql: ${TABLE}.OWNER_ID;;
  }

  dimension: status {
    label: "Status"
    type: string
    sql: ${TABLE}.STATUS;;
  }

  dimension: type {
    label: "Type"
    type: string
    sql: ${TABLE}.TYPE;;
  }

  dimension: who_id {
    type: string
    sql: ${TABLE}.WHO_ID;;
  }

  measure: count {
    label: "Count of Tasks"
    type: count
    drill_fields: [id, account.name, account.id]
  }
}
