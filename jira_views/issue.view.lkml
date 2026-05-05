view: issue {
  sql_table_name: looker-private-demo.jira.issue ;;
  drill_fields: [jira_issue_key, department, priority.name, jira_user.name, created_date, due_date, _remaining_estimate]

  dimension: id {
    hidden: yes
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: is_assigned {
    label: "Is Assigned (y/n)"
    type: yesno
    sql: ${assignee} is not null ;;
  }

  dimension: jira_issue_key {
    type: string
    sql: ${TABLE}.key ;;
    link: {
      url:"http://looker-demo.atlassian.net/browse/{{ value }}"
      label: "View in Jira"
      icon_url: "https://f0.pngfuel.com/png/335/521/orange-and-white-square-logo-jira-technology-roadmap-computer-software-workflow-bitbucket-others-png-clip-art.png"
    }
    action: {
      url:"https://looker-demo.atlassian.net/browse"
      label: "Update Issue"
      icon_url: "https://f0.pngfuel.com/png/335/521/orange-and-white-square-logo-jira-technology-roadmap-computer-software-workflow-bitbucket-others-png-clip-art.png"
      form_param: {
        name: "Story Points"
        type: select
        required: no
        default: "{{ story_points._value }}"
        option: {
          name: "1"
          label: "1"
        }
        option: {
          name: "2"
          label: "2"
        }
        option: {
          name: "3"
          label: "3"
        }
        option: {
          name: "4"
          label: "4"
        }
        option: {
          name: "5"
          label: "5"
        }
        option: {
          name: "6"
          label: "6"
        }
        option: {
          name: "7"
          label: "7"
        }
        option: {
          name: "8"
          label: "8"
        }
        option: {
          name: "9"
          label: "9"
        }
        option: {
          name: "10"
          label: "10"
        }

      }
      form_param: {
        name: "Assignee"
        type: select
        required: no
        option: {
          name: "Angelo Jones"
          label: "Angelo Jones"
        }
        option: {
          name: "David Lake"
          label: "David Lake"
        }
        option: {
          name: "Geneva Griffin"
          label: "Geneva Griffin"
        }
        option: {
          name: "Jerome Johnson"
          label: "Jerome Johnson"
        }
        option: {
          name: "Kathryn Eldred"
          label: "Kathryn Eldred"
        }
        option: {
          name: "Isabel Richardson"
          label: "Isabel Richardson"
        }
        option: {
          name: "Jerry Cottingham"
          label: "Jerry Cottingham"
        }
        option: {
          name: "Marsha Cook"
          label: "Marsha Cook"
        }
        option: {
          name: "David Castro"
          label: "David Castro"
        }
        option: {
          name: "Richard Crippen"
          label: "Richard Crippen"
        }
        option: {
          name: "Joshua Maples"
          label: "Joshua Maples"
        }
        default: "{{ jira_user.name._value }}"
      }
      form_param: {
        name: "Department"
        label: "Department"
        type: select
        required: no
        default: "{{ department._value }}"
        option: {
          name: "Dashboard Team"
          label: "Dashboard Team"
        }
        option: {
          name: "Explore Team"
          label: "Explore Team"
        }
        option: {
          name: "Model Team"
          label: "Model Team"
        }
      }
      form_param: {
        name: "Issue Type"
        type: select
        option: {
          name: "Bug"
          label: "Bug"
        }
        option: {
          name: "New Request"
          label: "Feature Request"
        }
        option: {
          name: "Design"
          label: "Design"
        }
        option: {
          name: "Emergency"
          label: "Emergency"
        }
        option: {
          name: "Improvement"
          label: "Improvement"
        }
        option: {
          name: "Regular"
          label: "Regular"
        }
        option: {
          name: "Internal Task"
          label: "Internal Task"
        }
        required: no
        default: "{{ issue_type.name._value }}"
      }
      form_param: {
        name: "Status"
        type: select
        option: {
          name: "Done"
          label: "Done"
        }
        option: {
          name: "To Do"
          label: "To Do"
        }
        option: {
          name: "In Progress"
          label: "In Progress"
        }
        required: no
        default: "{{ status_category.name._value }}"
      }
    }
  }

  dimension: department {
    label: "Department"
    type: string
    sql: case when ${project.name} in ('Mad Minister','Stormy Rabbit','Lonely Kitten') then 'Dashboard Team'
              when  ${project.name} in ('Narrow Creature','Stormy Rabbit','Smooth Calculator','Argent Plane') then 'Explore Team'
              else 'Model Team' end;;
  }

  dimension: external_issue_id {
    hidden: yes
    type: string
    sql: ${TABLE}.external_issue_id ;;
  }

  dimension: _original_estimate {
    label: "Original Estimate"
    type: number
    sql: ${TABLE}._original_estimate ;;
  }

  dimension: _remaining_estimate {
    label: "Remaining Estimate"
    type: number
    sql: ${TABLE}._remaining_estimate ;;
  }

  dimension: _time_spent {
    label: "TIme Spent"
    type: number
    sql: ${TABLE}._time_spent ;;
  }

  dimension: assignee {
    hidden: yes
    type: string
    sql: ${TABLE}.assignee ;;
  }

  dimension_group: created {
    group_label: "Dates"
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
    sql: ${TABLE}.created ;;
  }

  dimension: description {
    label: "Desscription"
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension_group: due {
    group_label: "Dates"
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.due_date ;;
  }

  dimension: environment {
    hidden: yes
    type: string
    sql: ${TABLE}.environment ;;
  }

  dimension: epic_name {
    label: "Epic Name"
    type: string
    sql: ${TABLE}.epic_name ;;
  }

  dimension: issue_type {
    hidden: yes
    type: number
    sql: ${TABLE}.issue_type ;;
  }

  dimension: priority {
    type: number
    hidden: yes
    sql: ${TABLE}.priority ;;
  }

  dimension: project {
    label: "Current Project"
    hidden: yes
    type: number
    sql: ${TABLE}.project ;;
  }

  dimension: resolution {
    group_label: "Resolution"
    hidden: yes
    type: number
    sql: ${TABLE}.resolution ;;
  }

  dimension_group: resolved {
    group_label: "Resolution"
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
    sql: ${TABLE}.resolved ;;
  }

  dimension: is_issue_resolved {
    group_label: "Resolution"
    type: yesno
    sql: ${resolved_date} IS NOT NULL ;;
  }

  dimension: hours_to_resolve_issue {
    group_label: "Resolution"
    label: "Time to Resolve (Hours)"
    type: number
    sql: timestamp_diff(${resolved_raw}, ${created_raw}, hour) ;;
    value_format_name: decimal_0
  }

  dimension: minutes_to_resolve_issue {
    group_label: "Resolution"
    label: "Time to Resolve (Minutes)"
    type: number
    sql: timestamp_diff(${resolved_raw}, ${created_raw}, minute) ;;
    value_format_name: decimal_0
  }

  dimension: days_to_resolve_issue {
    group_label: "Resolution"
    label: "Time to Resolve (Days)"
    type: number
    sql: timestamp_diff(${resolved_raw}, ${created_raw}, day) ;;
    value_format_name: decimal_0
  }

  dimension: days_between_resolved_and_due {
    hidden: yes
    type: duration_day
    sql_start: ${resolved_raw} ;;
    sql_end: ${due_raw};;
  }

  dimension: status {
    hidden: yes
    type: number
    sql: ${TABLE}.status ;;
  }

  dimension: story_points {
    type: number
    sql: case when ${_original_estimate} < 10000 then 1
              when ${_original_estimate} < 20000 then 2
              when ${_original_estimate} < 40000 then 3
              when ${_original_estimate} < 70000 then 4
              when ${_original_estimate} < 100000 then 5
              when ${_original_estimate} < 150000 then 6
              when ${_original_estimate} < 200000 then 7
              when ${_original_estimate} < 300000 then 8
              when ${_original_estimate} < 500000 then 9
              when ${_original_estimate} is null then null
              else 10 end
              ;;
  }

  dimension: summary {
    label: "Summary"
    type: string
    sql: ${TABLE}.summary ;;
  }

  dimension_group: updated {
    hidden: yes
    group_label: "Dates"
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
    sql: ${TABLE}.updated ;;
  }

  measure: total_days_to_resolve_issues_hours {
    group_label: "Resolution"
    label: "Total Days to Resolve Issues"
    description: "The total hours required to resolve issues"
    type: sum
    sql: ${days_to_resolve_issue} ;;
    value_format_name: decimal_0
  }

  measure: avg_days_to_resolve_issues_hours {
    group_label: "Resolution"
    label: "Avg Number of Days to Resolve Issues"
    description: "The average days required to resolve issues"
    type: average
    sql: ${days_to_resolve_issue} ;;
    value_format_name: decimal_0
  }

  measure: total_time_estimated {
    group_label: "Time Spent"
    type: sum
    sql: ${_original_estimate} ;;
  }

  measure: total_time_spent {
    group_label: "Time Spent"
    type: sum
    sql: ${_time_spent} ;;
  }

  measure: avg_days_left_delivered {
    group_label: "Time Spent"
    type: average
    label: "Avg Number of Days Left When Delivered"
    description: "The average number of days between when the issue was set to be delivered and when it actually was, negative indicates past due"
    sql: ${days_between_resolved_and_due} ;;
  }

  measure: total_story_points {
    label: "Total Story Points"
    type: sum
    sql: ${story_points} ;;
  }

  measure: count {
    type: count
    label: "Number of Issues"
  }

  measure: number_of_open_issues {
    label: "Number of Open Issues"
    type: count
    filters: {
      field: status_category.name
      value: "-Done"
    }
  }

  measure: number_of_open_issues_this_month {
    label: "Number of Open Issues This Month"
    type: count

    filters: {
      field: status_category.name
      value: "-Done"
    }
    filters: {
      field: issue.created_date
      value: "this month"
    }
  }

  measure: number_of_resolved_issues {
    label: "Number of Resolved Issues"
    type: count
    filters: {
      field: issue.resolved_date
      value: "-NULL"
    }
  }

  measure: number_of_issues_resolved_this_month {
    label: "Number of Issues Resolved This Month"
    type: count

    filters: {
      field: issue.resolved_date
      value: "this month"
    }
  }

  measure: number_of_issues_resolved_last_month {
    label: "Number of Issues Resolved Last Month"
    type: count
    filters: {
      field: issue.resolved_date
      value: "last month"
    }
  }

  measure: first_issue_created {
    label: "First Issue Created"
    description: "The date that the first issue was created"
    type: date_date
    sql: min(${created_raw}) ;;
  }

  measure: last_issue_due {
    label: "Last Issue Due"
    description: "The date that the last issue is due"
    type: date_date
    sql: max(${due_raw}) ;;
  }

}
