view: status_category {
  sql_table_name: looker-private-demo.jira.status_category ;;

  dimension: id {
    hidden: yes
    primary_key: yes
    type: number
    sql: ${TABLE}.ID ;;
  }

  dimension: name {
    label: "Status Name"
    type: string
    sql: ${TABLE}.NAME ;;
  }
}
