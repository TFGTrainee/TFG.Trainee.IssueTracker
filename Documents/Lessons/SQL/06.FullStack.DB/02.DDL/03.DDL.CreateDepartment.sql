create table [Domain].[Department] 
(
	Id int identity(1,1) not null primary key,
	Code nvarchar(255) not null unique,
	Name nvarchar(255) not null,

	-- IAuditable 
	CreatedOn datetime2 not null default GETUTCDATE(),
	CreatedById int not null,
	UpdatedOn datetime2 null,
	UpdatedById int null, 
	IsDeleted int not null default '0'
	foreign key (CreatedById)	references [Common].[User] (Id),
	foreign key (UpdatedById)	references [Common].[User] (Id)
)
go
