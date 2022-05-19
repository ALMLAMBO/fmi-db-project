-- 1. Заявка, която извежда името на пътници, които потеглят от 'Пловдив'
select passenger.NAME
from PASSENGERS passenger, TICKETS ticket

where passenger.PHONE = ticket.PASSENGER_PHONE
	and ticket.DEPARTURE_LOCATION = 'Пловдив'

-- 2. Заявка, която извежда информация за пътник, който пътува с фирмата 'Юнион - Ивкони ООД' и потегля от 'Омуртаг'
select passenger.*
from PASSENGERS passenger, TICKETS ticket

where passenger.PHONE = ticket.PASSENGER_PHONE
	and ticket.AGENCY = 'Юнион - Ивкони ООД'

intersect 

select passenger.*
from PASSENGERS passenger, TICKETS ticket

where passenger.PHONE = ticket.PASSENGER_PHONE
	and ticket.DEPARTURE_LOCATION = 'Омуртаг'

-- 3. Заявка, която извежда град и адрес на автогарата, която е към фирма 'Юнион - Ивкони ООД', 
-- и има каса за плащане по-голяма или ранвна на 5
select bs.*
from BUS_STATION bs, PAY_DESKS pd
where pd.STATION_LOCATION = bs.CITY
	and pd.AGENCY = 'Юнион - Ивкони ООД'
	and pd.PAY_DESK_NUMBER >= 5

-- 4. Заявка, която извежда номер на билет, който е с нечетно място, от тип 'Т' и е към фирма за пътуване 'Експрес Снежанка ООД'
select ticket.TICKET_NUMBER
from TICKETS ticket
where ticket.AGENCY = 'Експрес Снежанка ООД'
	and ticket.SEAT % 2 = 1
	and ticket.TYPE = 'T'

-- 5. Заявка, която извежда информация за разписанието на автобуси, които потеглят след датата '2022-05-10'
select bus.BUS_NUMBER, bus.DEPARTURE_LOCATION, bus.ARRIVAL_LOCATION,
	bus.DEPARTURE_DATE_AND_HOUR, bus.AGENCY
from BUSES bus
where bus.CURRENT_FREE_SEATS >= 30
and bus.DEPARTURE_DATE_AND_HOUR >= CONVERT(datetime,'2022-05-10')


-- 1.1 Заявка, която извежда информация за шофьорите, които карат повече от 1 автобус
select distinct driver.*
from DRIVE drive1, DRIVERS driver
where driver.DRIVER_NUMBER = drive1.DRIVER_NUMBER
	and drive1.DRIVER_NUMBER in (select drive2.DRIVER_NUMBER
									from DRIVE drive2
										where drive1.BUS_NUMBER != drive2.BUS_NUMBER)

-- 1.2 Заявка, която извежда информация за билет, който не е тип 'О' и не е вид 'N'
select ticket1.TICKET_NUMBER,ticket1.BUS_NUMBER,ticket1.PASSENGER_PHONE,
	ticket1.DEPARTURE_LOCATION,ticket1.SEAT,ticket1.AGENCY
from TICKETS ticket1, (select t.SORT, t.TYPE
						from TICKETS t
						where t.SORT = 'N'
							and t.TYPE = 'O') ticket2
where ticket1.SORT != ticket2.SORT
	and ticket1.TYPE != ticket2.TYPE

-- 1.3 Заявка, която извежда име и телефон на служител, който не работи към фирма съдържаща думата 'Експрес' в името си
select cashier.NAME, cashier.PHONE
from CASHIERS cashier, TICKETS ticket1
where ticket1.CASHIER_NUMBER = cashier.WORK_NUMBER
and ticket1.AGENCY not in (select ticket2.AGENCY
							from TICKETS ticket2
							where upper (ticket2.AGENCY) like upper ('%Експрес%'))

-- 1.4 Заявка, която извежда най-рано пристигащите автобуси
select ticket.*
from TICKETS ticket
where ticket.DEPARTURE_DATE_AND_HOUR <= all(select ticket2.DEPARTURE_DATE_AND_HOUR
												from TICKETS ticket2)

-- 1.5 Заяква, която извежда телефонните номера на касиерите, които не съдржат '2'
select cashier.NAME, cashier.PHONE
from CASHIERS cashier
where cashier.PHONE not in (select c.PHONE
								from CASHIERS c
								where UPPER(c.PHONE) LIKE UPPER('%2%'))
