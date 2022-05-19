use bus_station;

create unique index idx_tickets
    on TICKETS(DEPARTURE_LOCATION, ARRIVAL_LOCATION, SEAT);

create unique index idx_buses
    on BUSES(DEPARTURE_LOCATION, ARRIVAL_LOCATION, SEATS);

create unique index idx_drivers
     on DRIVERS(PHONE, NAME);

create view cashier_works_where (cashier_name, town_name)
as
    select c.name, b.city
        from PAY_DESKS p
        join CASHIERS c on c.WORK_NUMBER = p.CASHIER_NUMBER
        join BUS_STATION b on b.CITY = p.STATION_LOCATION

select * from cashier_works_where

create view passenger_for_bus(passenger_name, bus_number, bus_agency)
as
    select p.name, b.BUS_NUMBER, b.AGENCY
        from TICKETS t
        join BUSES b on b.BUS_NUMBER = t.BUS_NUMBER
        join PASSENGERS p on t.PASSENGER_PHONE = p.PHONE

select * from passenger_for_bus

create view bus_for_schedule(bus_number, bus_agency, scheduled_date, station_location)
as
    select b.BUS_NUMBER, b.AGENCY, s.date, s.STATION_LOCATION
        from BUS_STATION bs
        join SCHEDULE s on bs.CITY = s.STATION_LOCATION
        join BUSES b on bs.CITY = b.ARRIVAL_LOCATION

select * from bus_for_schedule