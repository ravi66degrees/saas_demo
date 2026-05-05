view: epic {
  sql_table_name: looker-private-demo.jira.epic ;;

  dimension: id {
    label: "ID"
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension_group: _fivetran_synced {
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
    sql: ${TABLE}._fivetran_synced ;;
  }

  dimension: done {
    label: "Is Done (y/n)"
    type: yesno
    sql: ${TABLE}.done ;;
  }

  dimension: key {
    label: "Key"
    type: string
    sql: ${TABLE}.key ;;
  }

  dimension: name {
    label: "Name"
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: summary {
    label: "Summary"
    type: string
    sql: ${TABLE}.summary ;;
  }

  measure: count {
    label: "Count"
    type: count
    drill_fields: [id, name, issue_epic_link_history.count]
  }
}
