select invoicelineid, invoiceid, unitprice, quantity, name, composer from chinook_sqlite.InvoiceLine, chinook_sqlite.Track where chinook_sqlite.InvoiceLine.trackid=chinook_sqlite.Track.trackid;
