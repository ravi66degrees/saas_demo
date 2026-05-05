view: campaign_member {
  sql_table_name: `looker-private-demo.salesforce.campaign_member`
    ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.ID;;
  }

  dimension: campaign_id {
    type: string
    hidden: yes
    sql: ${TABLE}.CAMPAIGN_ID;;
  }

  dimension: contact_id {
    type: string
    hidden: yes
    sql: ${TABLE}.CONTACT_ID;;
  }

  dimension_group: created {
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
    sql: timestamp(${TABLE}.CREATED_DATE);;
  }

  dimension_group: first_responded {
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
    sql: timestamp(${TABLE}.FIRST_RESPONDED_DATE);;
  }

  dimension: has_responded {
    label: "Has Responded (y/n)"
    type: yesno
    sql: ${TABLE}.HAS_RESPONDED;;
  }

  dimension: is_deleted {
    hidden: yes
    type: yesno
    sql: ${TABLE}.IS_DELETED;;
  }

  dimension: lead_id {
    hidden: yes
    type: string
    sql: ${TABLE}.LEAD_ID;;
  }

  dimension: status {
    label: "Status"
    type: string
    sql: ${TABLE}.STATUS;;
  }

  dimension: type {
    label: "Type"
    type: string
    sql: ${TABLE}.TYPE;;
  }

  measure: count {
    label: "Campaign Member Count"
    type: count
    drill_fields: [id, contact.last_name, contact.id, contact.first_name, campaign.id]
  }
}
