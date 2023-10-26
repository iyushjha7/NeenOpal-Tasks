create table n_data1 as 
SELECT CONCAT(OrderID,' + ',ProductID) as Order_Product,OrderID,ProductID,Qty from data1;

create table n_data2 as 
(SELECT CONCAT(OrderID,' + ',ProductID) as Order_Product,OrderID,ProductID,Qty from data2);

-- (1) How to identify the Records (Order ID + Product ID combination) present in data1 but missing in data2 (Specify the number of records missing in your answer)

select n_data1.OrderID, n_data1.ProductID, n_data1.Qty from n_data1
left join n_data2
on n_data1.Order_Product = n_data2.Order_Product
where n_data2.Order_Product is null;

select count(*) from n_data1
left join n_data2
on n_data1.Order_Product = n_data2.Order_Product
where n_data2.Order_Product is null;

--  (2) How to identify the Records (Order ID + Product ID combination) missing in data1 but present in data2 (Specify the number of records missing in your answer)

select n_data2.OrderID, n_data2.ProductID, n_data2.Qty from n_data2
left join n_data1
on n_data2.Order_Product = n_data1.Order_Product
where n_data1.Order_Product is null;

select count(*) from n_data2
left join n_data1
on n_data2.Order_Product = n_data1.Order_Product
where n_data1.Order_Product is null;

-- (3) Find the Sum of the total Qty of Records missing in data1 but present in data2

select sum(n_data2.Qty) from n_data2
left join n_data1
on n_data2.Order_Product = n_data1.Order_Product
where n_data1.Order_Product is null;

-- (4) Find the total number of unique records (Order ID + Product ID combination) present in the combined dataset of data1 and data2

select COUNT(*) from n_data1
join n_data2
on n_data1.Order_Product = n_data2.Order_Product;

select count(*) from n_data2
left join n_data1
on n_data2.Order_Product = n_data1.Order_Product
where n_data1.Order_Product is null;

select count(*) from n_data1
left join n_data2
on n_data1.Order_Product = n_data2.Order_Product
where n_data2.Order_Product is null;


