select sum(total), count(*),employee.firstname || " "||employee.lastname as NAME1 from Invoice, Customer,employee where Invoice.customerid=Customer.customerid
and customer.supportrepid=employee.employeeid
and employee.title like "Sales%Agent"  group by NAME1;