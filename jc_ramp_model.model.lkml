connection: "thelook"

include: "*.view.lkml"         # include all views in this project
include: "*.dashboard.lookml"  # include all dashboards in this project

# # Select the views that should be a part of this model,
# # and define the joins that connect them together.
#
# explore: order_items {
#   join: orders {
#     relationship: many_to_one
#     sql_on: ${orders.id} = ${order_items.order_id} ;;
#   }
#
#   join: users {
#     relationship: many_to_one
#     sql_on: ${users.id} = ${orders.user_id} ;;
#   }
# }


explore: orders {
  sql_always_where: ${created_date} >= '2016-01-01'  AND ${status} <> 'complete';;
}

explore: inventory_items {}

explore: order_items {
  fields: [order_items*, orders*]
  join: orders {
    type: left_outer
    sql_on: ${orders.id} = ${order_items.order_id} ;;
    relationship: many_to_one
#fields used here can only limit on the JOINED Table
  }
  }


explore: users {

  always_filter: {
    filters: {
      field: id
      value: ">=100"
    }
  }


  join: user_data {
    type: inner
    sql_on:  ${users.id} = ${user_data.user_id} ;;
    relationship: many_to_one
  }
}

explore: user_data {}
