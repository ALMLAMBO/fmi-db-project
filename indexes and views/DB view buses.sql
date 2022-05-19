use bus_station

create view bus_for_schedule(bus_number, bus_agency, scheduled_date, station_location)
as
    select b.BUS_NUMBER, b.AGENCY, s.date, s.STATION_LOCATION
        from BUS_STATION bs
        join SCHEDULE s on bs.CITY = s.STATION_LOCATION
        join BUSES b on bs.CITY = b.ARRIVAL_LOCATION

select * from bus_for_schedule