select sum(total) from Invoice where invoicedate like "%2011%"
union
select sum(total) from Invoice where invoicedate like "%2009%"