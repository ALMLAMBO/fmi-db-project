USE bus_station

create trigger tgr_check_available_seats
on TICKETS
instead of insert
as
begin
    declare free_bus_seats integer
    select free_bus_seats = (select b.CURRENT_FREE_SEATS
                             from buses b
                             join TICKETS t on t.BUS_NUMBER = b.BUS_NUMBER
                             where b.BUS_NUMBER = inserted.BUS_NUMBER)

    if(free_bus_seats > 0)
        update BUSES set CURRENT_FREE_SEATS = CURRENT_FREE_SEATS - 1 where BUS_NUMBER = inserted.BUS_NUMBER
    else
        print ('There are no free seats')
end