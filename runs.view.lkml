view: runs {
  sql_table_name: crunchbase.runs ;;

  dimension_group: run {
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
    sql: ${TABLE}.run_at ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
