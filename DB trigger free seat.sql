use bus_station

create trigger tgr_free_seat
on TICKETS
after delete
as
begin
    declare free_bus_seats integer
    select free_bus_seats = (select b.CURRENT_FREE_SEATS
                             from buses b
                             join TICKETS t on t.BUS_NUMBER = b.BUS_NUMBER
                             where b.BUS_NUMBER = deleted.BUS_NUMBER)

    declare seats integer
    select seats = (select b.SEATS
                             from buses b
                             join TICKETS t on t.BUS_NUMBER = b.BUS_NUMBER
                             where b.BUS_NUMBER = deleted.BUS_NUMBER)

    if(free_bus_seats < seats)
        update BUSES set CURRENT_FREE_SEATS = CURRENT_FREE_SEATS + 1 where BUS_NUMBER = deleted.BUS_NUMBER
end