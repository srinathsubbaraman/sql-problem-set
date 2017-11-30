select Employee.firstname,max(sales) from(select sum(total) as sales, Employee.FirstName
  from Customer ,Invoice ,Employee  where Employee.employeeid=Customer.supportrepid and Customer.customerid=Invoice.customerid
 group by employeeid);