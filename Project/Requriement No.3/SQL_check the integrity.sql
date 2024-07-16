select *
from Fact_sales_order f
left join Dim_book b on f.book_id_fk = b.book_id_sk
left join Dim_customer c on f.customer_id_fk = c.customer_id_sk
left join Dim_orders o on f.order_id_fk = o.order_id_sk
left join DimDate d on f.date_fk = d.DateSK
where b.book_id_sk is null or c.customer_id_sk is null or o.order_id_sk is null or d.DateSK is null


