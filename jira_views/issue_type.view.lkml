view: issue_type{
  sql_table_name: looker-private-demo.jira.issue_type ;;

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
    group_label: "Issue Type"
    label: "Issue Type"
    type: string
    sql: ${TABLE}.NAME ;;
  }

  dimension: subtask {
    group_label: "Issue Type"
    type: yesno
    sql: ${TABLE}.SUBTASK ;;
  }

  dimension: is_bug {
    group_label: "Issue Type"
    type: yesno
    sql: ${name} = 'Bug' ;;
  }

}
