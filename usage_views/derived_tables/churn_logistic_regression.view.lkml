datagroup: ml_trigger {
  # trigger each day
  sql_trigger: select current_date();;
}

view: churn_model_training {
    derived_table: {
      datagroup_trigger: ml_trigger
      explore_source: daily_user_count {
        column: average_usage_score {}
        column: is_churn { field: account.is_churn }
        column: average_30_day_usage {}
        column: id { field: account.id }
        filters: {
          field: account.id
          value: "-NULL"
        }
        filters: {
          field: account.type
          value: "-Prospect,-NULL"
        }
        filters: {
          field: daily_user_count.event_date
          value: "before yesterday"
        }
      }
}
}


view: churn_model {
  derived_table: {
    datagroup_trigger: ml_trigger
    sql_create:
      CREATE OR REPLACE MODEL ${SQL_TABLE_NAME}
      OPTIONS(model_type='logistic_reg'
        , labels=['is_churn']
        ) AS
      SELECT
         * EXCEPT(id)
      FROM ${churn_model_training.SQL_TABLE_NAME};;
  }
}

######################## TRAINING INFORMATION #############################


# VIEWS:
view: churn_model_evaluation {
  derived_table: {
    # no trigger because want to be able to show the ML.EVALUATE function
    # datagroup_trigger: ml_trigger
    sql: SELECT * FROM ml.EVALUATE(
          MODEL ${churn_model.SQL_TABLE_NAME}
          );;
  }
  dimension: recall {type: number value_format_name:percent_2}
  dimension: accuracy {type: number value_format_name:percent_2}
  dimension: f1_score {type: number value_format_name:percent_3}
  dimension: log_loss {type: number}
  dimension: roc_auc {type: number}
}

view: current_input {
  derived_table: {
      datagroup_trigger: ml_trigger
      explore_source: daily_user_count {
        column: average_usage_score {}
        column: is_churn { field: account.is_churn }
        column: average_30_day_usage {}
        column: id { field: account.id }
        filters: {
          field: account.id
          value: "-NULL"
        }
        filters: {
          field: account.type
          value: "Customer"
        }
      }
}
}

view: current_churn_prediction {
  derived_table: {
    # no trigger because want to be able to show the ML.PREDICT function
    # datagroup_trigger: ml_trigger
    sql: SELECT * FROM ml.PREDICT(
          MODEL ${churn_model.SQL_TABLE_NAME},
          (SELECT * FROM ${current_input.SQL_TABLE_NAME}));;
  }

  dimension: predicted_churn {
    type: yesno
    description: "Is this account predicted to be churn within 30 days, from ML model"
    group_label: "Churn Indicators"
    #sql: ${TABLE}.predicted_is_churn;;
    sql: ${predicted_churn_probability}>.1 ;;
  }

  dimension: predicted_churn_probability {
    description: "Is this account predicted to be churn within 30 days, from ML model"
    group_label: "Churn Indicators"
    type: number
    sql: ${TABLE}.predicted_is_churn_probs[OFFSET(0)].prob;;
  }

  dimension: account_id {
    primary_key: yes
    sql: ${TABLE}.id ;;
  }

  measure: max_predicted_score {
    group_label: "Churn Predictions"
    type: max
    value_format_name: percent_2
    sql: ${predicted_churn_probability} ;;
  }

  measure: average_predicted_score {
    group_label: "Churn Predictions"
    type: average
    value_format_name: percent_2
    sql: ${predicted_churn_probability} ;;
  }
}


view: roc_curve {
  derived_table: {
    sql: SELECT * FROM ml.ROC_CURVE(
        MODEL ${churn_model.SQL_TABLE_NAME});;
  }
  dimension: threshold {type: number}
  dimension: recall {type: number value_format_name: percent_2}
  dimension: false_positive_rate {type: number}
  dimension: true_positives {type: number }
  dimension: false_positives {type: number}
  dimension: true_negatives {type: number}
  dimension: false_negatives {type: number }
  dimension: precision {
    type:  number
    value_format_name: percent_2
    sql:  ${true_positives} / NULLIF((${true_positives} + ${false_positives}),0);;
  }
  measure: total_false_positives {
    type: sum
    sql: ${false_positives} ;;
  }
  measure: total_true_positives {
    type: sum
    sql: ${true_positives} ;;
  }

  measure: total_false_negatives {
    type: sum
    sql: ${false_negatives} ;;
  }
  measure: total_true_negatives {
    type: sum
    sql: ${true_negatives} ;;
  }
  dimension: threshold_accuracy {
    type: number
    value_format_name: percent_2
    sql:  1.0*(${true_positives} + ${true_negatives}) / NULLIF((${true_positives} + ${true_negatives} + ${false_positives} + ${false_negatives}),0);;
  }
  dimension: threshold_f1 {
    type: number
    value_format_name: percent_3
    sql: 2.0*${recall}*${precision} / NULLIF((${recall}+${precision}),0);;
  }
}
