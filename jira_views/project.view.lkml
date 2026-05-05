view: project {
  sql_table_name: looker-private-demo.jira.project ;;

  dimension: id {
    hidden: yes
    primary_key: yes
    type: number
    sql: ${TABLE}.ID ;;
  }

  dimension: description {
    group_label: "Project"
    label: "Project Description"
    type: string
    sql: ${TABLE}.DESCRIPTION ;;
  }

  dimension: name {
    group_label: "Project"
    label: "Project Name"
    type: string
    sql: ${TABLE}.NAME ;;
  }

  dimension: project_category_id {
    hidden: yes
    type: number
    sql: ${TABLE}.PROJECT_CATEGORY_ID ;;
  }

}
