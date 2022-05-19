use bus_station

create view cashier_works_where (cashier_name, town_name)
as
    select c.name, b.city
        from PAY_DESKS p
        join CASHIERS c on c.WORK_NUMBER = p.CASHIER_NUMBER
        join BUS_STATION b on b.CITY = p.STATION_LOCATION

select * from cashier_works_where