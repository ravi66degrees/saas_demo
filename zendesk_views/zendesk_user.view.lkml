view: zendesk_user {
  sql_table_name: looker-private-demo.zendesk.users
    ;;
  drill_fields: [id]

  dimension: id {
    label: "ID"
    primary_key: yes
    type: string
    sql: ${TABLE}.ID;;
  }

  parameter: chatter_filter {
    label: "Chatter Filter"
    description: "Use this filter to compare a single chatter with the rest of the support team"
    suggest_dimension: name
  }

  dimension: is_chatter {
    label: "Is Chatter"
    type: yesno
    view_label: "Ticket Assignee"
    description: "Use with the chatter filter to compare one chatter with the rest of the support team"
    sql: {{ chatter_filter._parameter_value }} = ${name} ;;
  }

  dimension: active {
    hidden: yes
    type: yesno
    sql: ${TABLE}.ACTIVE;;
  }

  dimension_group: created {
    hidden: yes
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
    sql: ${TABLE}.CREATED_AT;;
  }

  dimension: email {
    label: "Email"
    type: string
    sql: ${TABLE}.EMAIL;;
  }

  dimension: name {
    label: "Name"
    type: string
    link: {
      label: "Support Dashboard"
      url: "/dashboards/j1bAzAQWwRyGCZt1ZjojT5?Chatter+Name= {{ name._value }}"
    }
    sql: ${TABLE}.NAME;;
  }

  dimension: organization_id {
    type: string
    hidden: yes
    sql: ${TABLE}.ORGANIZATION_ID;;
  }

  dimension: role {
    label: "Role"
    type: string
    sql: ${TABLE}.ROLE;;
  }

  dimension: suspended {
    hidden: yes
    type: yesno
    sql: ${TABLE}.SUSPENDED;;
  }

  dimension: time_zone {
    hidden: yes
    type: string
    sql: ${TABLE}.TIME_ZONE;;
  }

  dimension: verified {
    hidden: yes
    type: yesno
    sql: ${TABLE}.VERIFIED;;
  }

  measure: count {
    label: "Number of Users"
    type: count
    drill_fields: [id, name, organization.id]
  }
}
