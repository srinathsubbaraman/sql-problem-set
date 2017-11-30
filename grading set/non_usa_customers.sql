select firstname || " "||lastname as NAME, Customerid, country from chinook_sqlite.Customer where country != "USA";
