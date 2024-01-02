--CDC

USE CaterDB
go

Exec sp_cdc_enable_db
go

Exec sp_cdc_enable_table
@source_schema = 'dbo',
@source_name = 'Item',
@capture_instance = 'itemhistory',
@role_name = 'cdc_admin'
go

--CDC load Table

Create table cdcload
(
id INT identity (1,1) primary key,
TableName varchar (50) not null,
startlsn nvarchar (42),
Endlsn nvarchar (42),
Loadstatus bit default(0)
)
go


