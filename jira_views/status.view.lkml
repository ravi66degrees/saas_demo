view: status {
  sql_table_name: looker-private-demo.jira.status ;;

  dimension: id {
    hidden: yes
    primary_key: yes
    type: number
    sql: ${TABLE}.ID ;;
  }

  dimension: description {
    hidden: yes
    type: string
    sql: ${TABLE}.DESCRIPTION ;;
  }

  dimension: name {
    hidden: yes
    type: string
    sql: ${TABLE}.NAME ;;
  }

  dimension: status_category_id {
    type: number
    hidden: yes
    sql: ${TABLE}.STATUS_CATEGORY_ID ;;
  }
}
