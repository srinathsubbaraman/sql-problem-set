select x, Track.name from(select count(Track.trackid) as x, Track.name from Invoice join InvoiceLine on Invoice.invoiceid=InvoiceLine.invoiceid join Track on InvoiceLine.trackid=Track.trackid where invoicedate like '%2013%' group by Track.name)where x=2;