view: ipo {
  sql_table_name: crunchbase.ipo ;;

  dimension: company_permalink {
    type: string
    sql: ${TABLE}.company_permalink ;;
  }

  dimension_group: public {
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
    sql: ${TABLE}.public_date ;;
  }

  dimension: stock_symbol {
    type: string
    sql: ${TABLE}.stock_symbol ;;
  }

  dimension: valuation_amount {
    type: number
    sql: ${TABLE}.valuation_amount ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
