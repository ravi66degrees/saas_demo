# User Clustering - BQML KMeans

##Step 1: Create input table containing User ID and feature data #####################

##Part 1a:
view: user_session_clustering_training {
  derived_table: {
    #datagroup_trigger: event_trigger
    explore_source: event_logs {
      column: user_id { field: event_logs.user_id}
      column: session_sequence { field: event_sessions.session_sequence }
      column: event_type { field: event_labels.event_type }
      column: page_type { field: event_labels.page_type }
      column: count_of_events {field: event_logs.count}
      column: average_time_taken { field: event_logs__log.average_time_taken }
      derived_column: max_event {
        sql: MAX(session_sequence) OVER(PARTITION BY user_id);;}
    }
  }

  dimension: user_id {
    label: "User ID"
  }

  dimension: session_sequence {
    label: "Session Sequence"
    value_format: "0"
    type: number
  }

  dimension: event_type {
    #hidden: yes
    label: "Event Type"
  }

  dimension: page_type {
    hidden: yes
    label: "Page Type"
  }

  dimension: count_of_events {
    hidden: yes
    label: "Number of Events"
    type: number
  }

  dimension: average_time_taken {
    label: "Average Event Duration"
    type: number
  }

  ## Filter Each Count By Event Type

  measure: events_per_type_click  {
    type: sum
    sql: ${count_of_events} ;;
    filters: [event_type: "Click"]
  }

  measure: events_per_type_create  {
    type: sum
    sql: ${count_of_events} ;;
    filters: [event_type: "Create"]
  }

  measure: events_per_type_delete  {
    type: sum
    sql: ${count_of_events} ;;
    filters: [event_type: "Delete"]
  }

  measure: events_per_type_deliver  {
    type: sum
    sql: ${count_of_events} ;;
    filters: [event_type: "Deliver"]
  }

  measure: events_per_type_download  {
    type: sum
    sql: ${count_of_events} ;;
    filters: [event_type: "Download"]
  }

  measure: events_per_type_drill  {
    type: sum
    sql: ${count_of_events} ;;
    filters: [event_type: "Drill"]
  }

  measure: events_per_type_edit  {
    type: sum
    sql: ${count_of_events} ;;
    filters: [event_type: "Edit"]
  }

  measure: events_per_type_error  {
    type: sum
    sql: ${count_of_events} ;;
    filters: [event_type: "Error"]
  }

  measure: events_per_type_login  {
    type: sum
    sql: ${count_of_events} ;;
    filters: [event_type: "Login"]
  }

  measure: events_per_type_ops  {
    type: sum
    sql: ${count_of_events} ;;
    filters: [event_type: "Ops"]
  }

  measure: events_per_type_render  {
    type: sum
    sql: ${count_of_events} ;;
    filters: [event_type: "Render"]
  }

  measure: events_per_type_run  {
    type: sum
    sql: ${count_of_events} ;;
    filters: [event_type: "Run"]
  }

  measure: events_per_type_save  {
    type: sum
    sql: ${count_of_events} ;;
    filters: [event_type: "Save"]
  }

  measure: events_per_type_search  {
    type: sum
    sql: ${count_of_events} ;;
    filters: [event_type: "Search"]
  }

  measure: events_per_type_validate  {
    type: sum
    sql: ${count_of_events} ;;
    filters: [event_type: "Validate"]
  }

  measure: events_per_type_view  {
    type: sum
    sql: ${count_of_events} ;;
    filters: [event_type: "View"]
  }

## Filter Each Count By Page Type

  measure: events_per_page_admin  {
    type: sum
    sql: ${count_of_events} ;;
    filters: [page_type: "Admin"]
  }

  measure: events_per_page_dashboard  {
    type: sum
    sql: ${count_of_events} ;;
    filters: [page_type: "Dashboard"]
  }

  measure: events_per_page_explore  {
    type: sum
    sql: ${count_of_events} ;;
    filters: [page_type: "Explore"]
  }

  measure: events_per_page_folders  {
    type: sum
    sql: ${count_of_events} ;;
    filters: [page_type: "Folders"]
  }

  measure: events_per_page_homepage  {
    type: sum
    sql: ${count_of_events} ;;
    filters: [page_type: "Homepage"]
  }

  measure: events_per_page_login  {
    type: sum
    sql: ${count_of_events} ;;
    filters: [page_type: "Login"]
  }

  measure: events_per_page_model  {
    type: sum
    sql: ${count_of_events} ;;
    filters: [page_type: "Model"]
  }

  measure: events_per_page_ops  {
    type: sum
    sql: ${count_of_events} ;;
    filters: [page_type: "Ops"]
  }

  measure: events_per_page_scheduler  {
    type: sum
    sql: ${count_of_events} ;;
    filters: [page_type: "Scheduler"]
  }

  dimension: first_event {
    type: number
    value_format_name: decimal_0
    sql: CASE WHEN ${session_sequence}=1 THEN 1 ELSE 0 END ;;
  }

  dimension: max_event {
    hidden: yes
    label: "Last Event Rank"
  }

  dimension: last_event {
    type: number
    value_format_name: decimal_0
    sql: CASE WHEN ${max_event}=${session_sequence} THEN 1 ELSE 0 END ;;
  }

}

##Part 1b:
view: user_session_clustering_input {
  derived_table: {
    explore_source: user_session_clustering_training {
      column: user_id {}
      #column: session_sequence {}
      column: average_time_taken {}
      column: first_event {}
      column: last_event {}
      column: events_per_page_admin {}
      column: events_per_page_dashboard {}
      column: events_per_page_explore {}
      column: events_per_page_folders {}
      column: events_per_page_homepage {}
      column: events_per_page_login {}
      column: events_per_page_model {}
      column: events_per_page_ops {}
      column: events_per_page_scheduler {}
      column: events_per_type_click {}
      column: events_per_type_create {}
      column: events_per_type_delete {}
      column: events_per_type_deliver {}
      column: events_per_type_download {}
      column: events_per_type_drill {}
      column: events_per_type_edit {}
      column: events_per_type_error {}
      column: events_per_type_login {}
      column: events_per_type_ops {}
      column: events_per_type_render {}
      column: events_per_type_run {}
      column: events_per_type_save {}
      column: events_per_type_search {}
      column: events_per_type_validate {}
      column: events_per_type_view {}
    }
  }
  dimension: user_id {}

#     dimension: session_sequence {
#       value_format: "0"
#       type: number
#     }

  dimension: average_time_taken {
    label: "User Session Clustering Input Average Event Duration"
    type: number
  }
  dimension: first_event {
    value_format: "#,##0"
    type: number
  }
  dimension: last_event {
    value_format: "#,##0"
    type: number
  }
  dimension: events_per_page_admin {
    type: number
  }
  dimension: events_per_page_dashboard {
    type: number
  }
  dimension: events_per_page_explore {
    type: number
  }
  dimension: events_per_page_folders {
    type: number
  }
  dimension: events_per_page_homepage {
    type: number
  }
  dimension: events_per_page_login {
    type: number
  }
  dimension: events_per_page_model {
    type: number
  }
  dimension: events_per_page_ops {
    type: number
  }
  dimension: events_per_page_scheduler {
    type: number
  }
  dimension: events_per_type_click {
    type: number
  }
  dimension: events_per_type_create {
    type: number
  }
  dimension: events_per_type_delete {
    type: number
  }
  dimension: events_per_type_deliver {
    type: number
  }
  dimension: events_per_type_download {
    type: number
  }
  dimension: events_per_type_drill {
    type: number
  }
  dimension: events_per_type_edit {
    type: number
  }
  dimension: events_per_type_error {
    type: number
  }
  dimension: events_per_type_login {
    type: number
  }
  dimension: events_per_type_ops {
    type: number
  }
  dimension: events_per_type_render {
    type: number
  }
  dimension: events_per_type_run {
    type: number
  }
  dimension: events_per_type_save {
    type: number
  }
  dimension: events_per_type_search {
    type: number
  }
  dimension: events_per_type_validate {
    type: number
  }
  dimension: events_per_type_view {
    type: number
  }
}

##Step 2: Build KMEANS model #########################################################

view: user_session_clustering_model {
  derived_table: {
    datagroup_trigger: event_trigger

    sql_create:
        CREATE OR REPLACE MODEL ${SQL_TABLE_NAME}
        OPTIONS(model_type='kmeans',
          num_clusters=5) AS
        SELECT
           * EXCEPT(user_id)
        FROM ${user_session_clustering_input.SQL_TABLE_NAME};;
  }

  #Dummy field
  dimension: test_cluster {
    sql: 5 ;;
  }
}

##Step 3: Build ml.PREDICT function ##################################################

view: user_session_clustering_prediction_base {
  label: "User-Session Clusters"
  derived_table: {
    datagroup_trigger: event_trigger
    sql: SELECT * EXCEPT (nearest_centroids_distance) FROM ml.PREDICT(
        MODEL ${user_session_clustering_model.SQL_TABLE_NAME},
        (SELECT * FROM ${user_session_clustering_input.SQL_TABLE_NAME}));;
  }

  #Dummy field
  dimension: test {
    sql: 1 ;;
  }

  #User ID - Independent Variable

  dimension: user_id  {
    sql:  ${TABLE}.user_id ;;
  }

  #Session Sequence - Dependent Variable

#     dimension: session_sequence  {
#       sql:  ${TABLE}.session_sequence ;;
#     }

  #Average Time Taken - Dependent Variable

  dimension: average_time_taken  {
    sql:  ${TABLE}.average_time_taken ;;
  }

  #Event Features - Dependent Variables

  dimension: events_per_type_click  {
    sql:  ${TABLE}.events_per_type_click;;
  }

  dimension: events_per_type_create  {
    sql:  ${TABLE}.events_per_type_create;;
  }

  dimension: events_per_type_delete  {
    sql:  ${TABLE}.events_per_type_delete;;
  }

  dimension: events_per_type_deliver  {
    sql:  ${TABLE}.events_per_type_deliver;;
  }

  dimension: events_per_type_download  {
    sql:  ${TABLE}.events_per_type_download;;
  }

  dimension: events_per_type_drill  {
    sql:  ${TABLE}.events_per_type_drill;;
  }

  dimension: events_per_type_edit  {
    sql:  ${TABLE}.events_per_type_edit;;
  }

  dimension: events_per_type_error  {
    sql:  ${TABLE}.events_per_type_error ;;
  }

  dimension: events_per_type_login  {
    sql:  ${TABLE}.events_per_type_login;;
  }

  dimension: events_per_type_ops  {
    sql:  ${TABLE}.events_per_type_ops;;
  }

  dimension: events_per_type_render  {
    sql:  ${TABLE}.events_per_type_render;;
  }

  dimension: events_per_type_run  {
    sql:  ${TABLE}.events_per_type_run;;
  }

  dimension: events_per_type_save  {
    sql:  ${TABLE}.events_per_type_save;;
  }

  dimension: events_per_type_search  {
    sql:  ${TABLE}.events_per_type_search;;
  }

  dimension: events_per_type_validate  {
    sql:  ${TABLE}.events_per_type_validate;;
  }

  dimension: events_per_type_view  {
    sql:  ${TABLE}.events_per_type_view;;
  }

  #Page Features - Dependent Variables

  dimension: events_per_page_admin  {
    sql:  ${TABLE}.events_per_page_admin;;
  }

  dimension: events_per_page_dashboard  {
    sql:  ${TABLE}.events_per_page_dashboard;;
  }

  dimension: events_per_page_explore  {
    sql:  ${TABLE}.events_per_page_explore;;
  }

  dimension: events_per_page_folders  {
    sql:  ${TABLE}.events_per_page_folders;;
  }

  dimension: events_per_page_homepage  {
    sql:  ${TABLE}.events_per_page_homepage;;
  }

  dimension: events_per_page_login  {
    sql:  ${TABLE}.events_per_page_login;;
  }

  dimension: events_per_page_model  {
    sql:  ${TABLE}.events_per_page_model;;
  }

  dimension: events_per_page_ops  {
    sql:  ${TABLE}.events_per_page_ops;;
  }

  dimension: events_per_page_scheduler  {
    sql:  ${TABLE}.events_per_page_scheduler;;
  }

  #Binary Feature (1 or 0) First Event - Dependent Variable

  dimension: first_event {
    sql:  ${TABLE}.events_per_type_view;;
  }

  #Binary Feature (1 or 0) Last Event - Dependent Variable

  dimension: last_event {
    sql:  ${TABLE}.events_per_type_view;;
  }

  dimension: centroid_id  {
    sql:  ${TABLE}.centroid_id ;;
  }
}

##Step 4: Build ml.PREDICT function ##################################################

##Part 4a: Build predicted clusters
#   view: user_session_clustering_prediction {
#     derived_table: {
#       datagroup_trigger: event_trigger
#
#       sql:
#
#       --WITH user_session_clustering_prediction_aggregates AS (SELECT
#         SELECT
#         centroid_id,
#         user_id,
#         COUNT(first_event) AS first_event_count,
#         COUNT(last_event) AS last_event_count,
#         COUNT(DISTINCT user_id) AS user_count
#         COUNT(session_sequence) AS count_of_sessions,
#         AVG(average_time_taken) AS average_time_taken,
#         AVG(events_per_type_click) AS average_events_per_type_click,
#         AVG(events_per_type_create) AS average_events_per_type_create,
#         AVG(events_per_type_delete) AS average_events_per_type_delete,
#         AVG(events_per_type_deliver) AS average_events_per_type_deliver,
#         AVG(events_per_type_download) AS average_events_per_type_download,
#         AVG(events_per_type_drill) AS average_events_per_type_drill,
#         AVG(events_per_type_edit) AS average_events_per_type_edit,
#         AVG(events_per_type_error) AS average_events_per_type_error,
#         AVG(events_per_type_login) AS average_events_per_type_login,
#         AVG(events_per_type_ops) AS average_events_per_type_ops,
#         AVG(events_per_type_render) AS average_events_per_type_render,
#         AVG(events_per_type_run) AS average_events_per_type_run,
#         AVG(events_per_type_save) AS average_events_per_type_save,
#         AVG(events_per_type_search) AS average_events_per_type_search,
#         AVG(events_per_type_validate) AS average_events_per_type_validate,
#         AVG(events_per_type_view) AS average_events_per_type_view,
#         AVG(events_per_page_admin) AS average_vents_per_page_admin,
#         AVG(events_per_page_dashboard) AS average_vents_per_page_dashboard,
#         AVG(events_per_page_explore) AS average_vents_per_page_explore,
#         AVG(events_per_page_folders) AS average_vents_per_page_folders,
#         AVG(events_per_page_homepage) AS average_vents_per_page_homepage,
#         AVG(events_per_page_login) AS average_vents_per_page_login,
#         AVG(events_per_page_model) AS average_vents_per_page_model,
#         AVG(events_per_page_ops) AS average_vents_per_page_ops,
#         AVG(events_per_page_scheduler) AS average_vents_per_page_scheduler
#         FROM ${user_session_clustering_prediction_base.SQL_TABLE_NAME}
#         GROUP BY 1;;
#   }
#
#     dimension: centroid_id {
#       type: number
#       sql: ${TABLE}.centroid_id;;
#     }
#
#     dimension: user_id {
#       sql: ${TABLE}.user_id ;;
#     }
#
#     dimension: user_count {}
#     dimension: first_event_count {}
#     dimension: last_event_count {}
#     dimension: count_of_sessions {}
#     dimension: average_time_taken {}
#     dimension: average_events_per_type_click {}
#     dimension: average_events_per_type_create {}
#     dimension: average_events_per_type_delete {}
#     dimension: average_events_per_type_deliver {}
#     dimension: average_events_per_type_download {}
#     dimension: average_events_per_type_drill {}
#     dimension: average_events_per_type_edit {}
#     dimension: average_events_per_type_error {}
#     dimension: average_events_per_type_login {}
#     dimension: average_events_per_type_ops {}
#     dimension: average_events_per_type_render {}
#     dimension: average_events_per_type_run {}
#     dimension: average_events_per_type_save {}
#     dimension: average_events_per_type_search {}
#     dimension: average_events_per_type_validate {}
#     dimension: average_events_per_type_view {}
#     dimension: average_vents_per_page_admin {}
#     dimension: average_vents_per_page_dashboard {}
#     dimension: average_vents_per_page_explore {}
#     dimension: average_vents_per_page_folders {}
#     dimension: average_vents_per_page_homepage {}
#     dimension: average_vents_per_page_login {}
#     dimension: average_vents_per_page_model {}
#     dimension: average_vents_per_page_ops {}
#     dimension: average_vents_per_page_scheduler {}
#   }


### DO NOT DELETE OR COMMENT OUT
explore: user_session_clustering_training {}
explore: user_session_clustering_input{}
explore: user_session_clustering_model {}
explore: user_session_clustering_prediction_base {}
#explore: user_session_clustering_prediction {}
