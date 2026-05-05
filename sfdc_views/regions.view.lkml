view: regions {
  sql_table_name: `looker-private-demo.salesforce.regions` ;;

  dimension: geo {
    hidden: yes
    type: string
    sql: ${TABLE}.geo ;;
  }

  dimension: region {
    label: "region"
    type: string
    sql: ${TABLE}.region ;;
  }

}
