create table Ecommerce_data(
	InvoiceNo varchar(10),
	StockCode varchar(25),
	Description	varchar(100),
	Quantity int,
	InvoiceDate	timestamp,
	UnitPrice decimal,
	CustomerID	varchar(10),
	Country varchar(25)
)

select distinct customerid from Ecommerce_data;

delete from Ecommerce_data
where customerid is null;