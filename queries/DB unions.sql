Select drs.NAME, bs.BUS_NUMBER
	From BUSES bs 
	JOIN DRIVE dr on bs.BUS_NUMBER = dr.BUS_NUMBER
	JOIN DRIVERS drs on drs.DRIVER_NUMBER = dr.DRIVER_NUMBER
order by 2
	

Select psgs.NAME, bs.BUS_NUMBER
	From PASSENGERS psgs
	JOIN TICKETS tcts on psgs.PHONE = tcts.PASSENGER_PHONE
	JOIN BUSES bs on bs.BUS_NUMBER = tcts.BUS_NUMBER
order by 2


Select csh.NAME, bs.CITY
	From CASHIERS csh 
	JOIN PAY_DESKS pds on csh.WORK_NUMBER = pds.CASHIER_NUMBER
	JOIN BUS_STATION bs on bs.CITY = pds.STATION_LOCATION


Select psg.NAME, drs.NAME
	From PASSENGERS psg
	JOIN TICKETS tc on psg.PHONE = tc.PASSENGER_PHONE
	JOIN BUSES bs on tc.BUS_NUMBER = bs.BUS_NUMBER
	JOIN DRIVE dr on dr.BUS_NUMBER = bs.BUS_NUMBER
	JOIN DRIVERS drs on drs.DRIVER_NUMBER = dr.DRIVER_NUMBER


Select psg.NAME, tc.TICKET_NUMBER
	From PASSENGERS psg
	JOIN TICKETS tc on psg.PHONE = tc.PASSENGER_PHONE