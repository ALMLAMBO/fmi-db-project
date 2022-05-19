use bus_station

create view passenger_for_bus(passenger_name, bus_number, bus_agency)
as
    select p.name, b.BUS_NUMBER, b.AGENCY
        from TICKETS t
        join BUSES b on b.BUS_NUMBER = t.BUS_NUMBER
        join PASSENGERS p on t.PASSENGER_PHONE = p.PHONE

select * from passenger_for_bus