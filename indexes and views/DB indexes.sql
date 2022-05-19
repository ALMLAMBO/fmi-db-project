use bus_station;

create unique index idx_tickets
    on TICKETS(DEPARTURE_LOCATION, ARRIVAL_LOCATION, SEAT);

create unique index idx_buses
    on BUSES(DEPARTURE_LOCATION, ARRIVAL_LOCATION, SEATS);

create unique index idx_drivers
     on DRIVERS(PHONE, NAME);