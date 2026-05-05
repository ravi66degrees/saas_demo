view: jira_user {
  sql_table_name: looker-private-demo.jira.user ;;

  dimension: id {
    label: "ID"
    primary_key: yes
    type: string
    sql: ${TABLE}.ID ;;
  }


  dimension: email {
    label: "Email"
    type: string
    sql: ${TABLE}.EMAIL ;;
  }

  dimension: locale {
    label: "Locale"
    type: string
    sql: ${TABLE}.LOCALE ;;
  }

  dimension: name {
    label: "Assignee Name"
    type: string
    sql: ${TABLE}.NAME ;;
    action: {
      label: "Follow up with assignee"
      icon_url: "https://gsuitetips.com/assets/images/thumbs/1IFeBjkSYvlWtRPkKcl2NGkpLlG5kFzfb.png"
      url: "https://google.com"
      form_param: {
        name: "Message"
        default: "Hi {{ value }} - just wanted to see how things are trending with bug you're working on?"
        type: textarea
      }
    }
  }

  dimension: time_zone {
    label: "Time Zone"
    type: string
    sql: ${TABLE}.TIME_ZONE ;;
  }

  dimension: username {
    label: "Username"
    type: string
    sql: ${TABLE}.USERNAME ;;
  }


  measure: count {
    label: "Count"
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      id,
      name,
      issue_assignee_history.count,
      issue_custom_multi_user.count,
      issue_custom_multi_user_history.count,
      issue_custom_single_user_history.count,
      issue_reporter_history.count,
      user_group.count
    ]
  }
}
