include: "../account.view"

view: covid {
  sql_table_name: `bigquery-public-data.covid19_nyt.us_states` ;;

  dimension: pk {
    primary_key: yes
    hidden: yes
    sql: ${date_raw} || ${state_fips_code} ;;
  }

  dimension: confirmed_cases {
    type: number
    sql: ${TABLE}.confirmed_cases ;;
  }

  dimension_group: date {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.date ;;
  }

  dimension: deaths {
    type: number
    sql: ${TABLE}.deaths ;;
  }

  dimension: state_fips_code {
    type: string
    sql: ${TABLE}.state_fips_code ;;
  }

  dimension: state_name {
    type: string
    sql: ${TABLE}.state_name ;;
    map_layer_name: us_states
  }

  measure: total_confirmed {
    type: sum
    sql: ${confirmed_cases} ;;
  }

  measure: total_deaths {
    type: sum
    sql: ${deaths} ;;
  }
}


explore: covid {
  hidden: yes
}

explore: account_covid {
  from: account
  hidden: yes
  join: covid {
    relationship: many_to_one
    sql_on: ${covid.date_date} = ${account_covid.end_date} ;;
  }
}
