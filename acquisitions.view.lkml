view: acquisitions {
  sql_table_name: crunchbase.acquisitions ;;

  dimension_group: acquired {
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
    sql: ${TABLE}.acquired_at ;;
  }

  dimension: acquired_by_permalink {
    type: string
    sql: ${TABLE}.acquired_by_permalink ;;
  }

  dimension: acquired_permalink {
    type: string
    sql: ${TABLE}.acquired_permalink ;;
  }

  dimension: currency {
    type: string
    sql: ${TABLE}.currency ;;
  }

  dimension: price_amount {
    type: number
    sql: ${TABLE}.price_amount ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
