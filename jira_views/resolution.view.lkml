view: resolution {
  sql_table_name: `looker-private-demo.jira.resolution`
    ;;
  drill_fields: [id]

  dimension: id {
    hidden: yes
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: description {
    hidden: yes
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension: name {
    label: "Resolution"
    type: string
    sql: ${TABLE}.name ;;
  }

}
