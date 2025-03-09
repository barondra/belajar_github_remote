#!python config

#user:password@ip:port/database
oltp_conn_string = "postgresql://ftde04:ftde04!@#@34.124.197.110:5432/ftde04"
warehouse_conn_string = "postgresql://ftde04:ftde04!@#@34.124.197.110:5432/ftde04_rahmat"

oltp_tables = {
    "users": "tb_users",
    "payments": "tb_payments",
    "shippers": "tb_shippers",
    "ratings": "tb_ratings",
    "vouchers": "tb_vouchers",
    "orders": "tb_orders"
}

warehouse_tables = {
    "users": "dim_user",
    "payments": "dim_payment",
    "shippers": "dim_shipper",
    "ratings": "dim_rating",
    "vouchers": "dim_voucher",
    "orders": "fact_orders"
}

warehouse_tables_columns = {
    "dim_user": ["user_id", "user_first_name", "user_last_name", "user_gender", "user_address", "user_birthday", "user_join"],
    "dim_payment": ["payment_id", "payment_name", "payment_status"],
    "dim_shipper": ["shipper_id", "shipper_name"],
    "dim_rating": ["rating_id", "rating_level", "rating_status"],
    "dim_voucher": ["voucher_id", "voucher_name", "voucher_price", "voucher_created","user_id"], 
    "fact_orders": ['order_id', 'order_date', 'user_id', 'payment_id', 'shipper_id', 'order_price','order_discount', 'voucher_id', 'order_total', 'rating_id']
}



