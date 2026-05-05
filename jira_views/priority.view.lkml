view: priority {
  sql_table_name: `looker-private-demo.jira.priority`
    ;;
  drill_fields: [id]

  dimension: id {
    hidden: yes
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: description {
    label: "Priority"
    type: string
    sql: ${TABLE}.description ;;
    html:  {% if value == 'P0 - Critical' %}
    <p style="color: red">{{ rendered_value }}</p>
    {% elsif value == 'P1 - Important' %}
    <p style="color: orange">{{ rendered_value }}</p>
    {% elsif value == 'P2 - Normal' %}
    <p style="color: yellow">{{ rendered_value }}</p>
    {% else %}
    <p style="color: blue">{{ rendered_value }}</p>
    {% endif %};;
  }

  dimension: name {
    hidden: yes
    type: string
    sql: ${TABLE}.name ;;
  }

  measure: count {
    type: count
    drill_fields: [id, name]
  }
}
