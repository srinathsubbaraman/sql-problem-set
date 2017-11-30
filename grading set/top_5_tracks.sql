select Track.name,count(InvoiceLine.trackid)  from Track , InvoiceLine  where InvoiceLine.trackid = Track.trackid group by Track.name order by InvoiceLine.trackid desc limit 5;
