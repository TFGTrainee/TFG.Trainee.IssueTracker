-- select client and his address
select c.Name, a.City from Clients c
inner join Addresses a on a.ClientId = c.Id