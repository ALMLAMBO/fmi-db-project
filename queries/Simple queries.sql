-- 1. Заявка, която извежда име и телефонен номер на всички шофьори 
select driver.NAME, driver.PHONE
from DRIVERS driver

-- 2. Заявка, която извежда телефонен номер, на шофьор, чийто име съдържа 'б'
select driver.PHONE
from DRIVERS driver
where UPPER (driver.NAME) like UPPER ('%б%')

-- 3.Заявка, която извежда номерата на автобусите, които имат повече от 10 места
select bus.BUS_NUMBER
from BUSES bus
where bus.SEATS >= 10

-- 4. Заявка, която извежда номер на билет, който е с нечетно място, от тип 'Т' и е към фирма за пътуване 'Експрес Снежанка ООД'
select ticket.TICKET_NUMBER
from TICKETS ticket
where ticket.AGENCY = 'Експрес Снежанка ООД'
	and ticket.SEAT % 2 = 1
	and ticket.TYPE = 'T'

-- 5. Заявка, която извежда име на касиер, чийто телефонен номер съдържа '5'
select cashier.NAME
from CASHIERS cashier
where UPPER (cashier.PHONE) like UPPER ('%5%')