select c.customer_id, c.first_name, c.last_name, c.email,
       ca.address_id, ca.status_id,
	   a.street_number, a.street_name, a.city, a.country_id,
	   co.country_name, ds.address_status
from customer c left join customer_address ca
on c.customer_id = ca.customer_id
left join address_status ds
on ds.status_id = ca.status_id
left join address a
on a.address_id = ca.address_id
left join country co
on co.country_id = a.country_id

------------------------------------------------------------------------------------
select b.book_id, b.title, b.isbn13, b.num_pages, b.publication_date,
b.language_id, l.language_code, l.language_name,
b.publisher_id, p.publisher_name,
a.author_id, a.author_name
from book b left join book_language l
on b.language_id = l.language_id
left join publisher p
on p.publisher_id = b.publisher_id
left join book_author ba
on b.book_id = ba.book_id
left join author a
on ba.author_id = a.author_id


-------------------------------------------------------------
select co.order_id, co.order_date, co.shipping_method_id, s.method_name,
       s.cost, oh.history_id, oh.status_id, oh.status_date, os.status_value
from cust_order co left join shipping_method s
on co.shipping_method_id = s.method_id
left join order_history oh
on oh.order_id = co.order_id
left join order_status os
on os.status_id = oh.status_id