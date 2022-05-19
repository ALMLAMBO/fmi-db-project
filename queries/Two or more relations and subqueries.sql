-- 1. ������, ����� ������� ����� �� �������, ����� �������� �� '�������'
select passenger.NAME
from PASSENGERS passenger, TICKETS ticket

where passenger.PHONE = ticket.PASSENGER_PHONE
	and ticket.DEPARTURE_LOCATION = '�������'

-- 2. ������, ����� ������� ���������� �� ������, ����� ������ � ������� '����� - ������ ���' � ������� �� '�������'
select passenger.*
from PASSENGERS passenger, TICKETS ticket

where passenger.PHONE = ticket.PASSENGER_PHONE
	and ticket.AGENCY = '����� - ������ ���'

intersect 

select passenger.*
from PASSENGERS passenger, TICKETS ticket

where passenger.PHONE = ticket.PASSENGER_PHONE
	and ticket.DEPARTURE_LOCATION = '�������'

-- 3. ������, ����� ������� ���� � ����� �� ����������, ����� � ��� ����� '����� - ������ ���', 
-- � ��� ���� �� ������� ��-������ ��� ������ �� 5
select bs.*
from BUS_STATION bs, PAY_DESKS pd
where pd.STATION_LOCATION = bs.CITY
	and pd.AGENCY = '����� - ������ ���'
	and pd.PAY_DESK_NUMBER >= 5

-- 4. ������, ����� ������� ����� �� �����, ����� � � ������� �����, �� ��� '�' � � ��� ����� �� �������� '������� �������� ���'
select ticket.TICKET_NUMBER
from TICKETS ticket
where ticket.AGENCY = '������� �������� ���'
	and ticket.SEAT % 2 = 1
	and ticket.TYPE = 'T'

-- 5. ������, ����� ������� ���������� �� ������������ �� ��������, ����� �������� ���� ������ '2022-05-10'
select bus.BUS_NUMBER, bus.DEPARTURE_LOCATION, bus.ARRIVAL_LOCATION,
	bus.DEPARTURE_DATE_AND_HOUR, bus.AGENCY
from BUSES bus
where bus.CURRENT_FREE_SEATS >= 30
and bus.DEPARTURE_DATE_AND_HOUR >= CONVERT(datetime,'2022-05-10')


-- 1.1 ������, ����� ������� ���������� �� ���������, ����� ����� ������ �� 1 �������
select distinct driver.*
from DRIVE drive1, DRIVERS driver
where driver.DRIVER_NUMBER = drive1.DRIVER_NUMBER
	and drive1.DRIVER_NUMBER in (select drive2.DRIVER_NUMBER
									from DRIVE drive2
										where drive1.BUS_NUMBER != drive2.BUS_NUMBER)

-- 1.2 ������, ����� ������� ���������� �� �����, ����� �� � ��� '�' � �� � ��� 'N'
select ticket1.TICKET_NUMBER,ticket1.BUS_NUMBER,ticket1.PASSENGER_PHONE,
	ticket1.DEPARTURE_LOCATION,ticket1.SEAT,ticket1.AGENCY
from TICKETS ticket1, (select t.SORT, t.TYPE
						from TICKETS t
						where t.SORT = 'N'
							and t.TYPE = 'O') ticket2
where ticket1.SORT != ticket2.SORT
	and ticket1.TYPE != ticket2.TYPE

-- 1.3 ������, ����� ������� ��� � ������� �� ��������, ����� �� ������ ��� ����� ��������� ������ '�������' � ����� ��
select cashier.NAME, cashier.PHONE
from CASHIERS cashier, TICKETS ticket1
where ticket1.CASHIER_NUMBER = cashier.WORK_NUMBER
and ticket1.AGENCY not in (select ticket2.AGENCY
							from TICKETS ticket2
							where upper (ticket2.AGENCY) like upper ('%�������%'))

-- 1.4 ������, ����� ������� ���-���� ������������ ��������
select ticket.*
from TICKETS ticket
where ticket.DEPARTURE_DATE_AND_HOUR <= all(select ticket2.DEPARTURE_DATE_AND_HOUR
												from TICKETS ticket2)

-- 1.5 ������, ����� ������� ����������� ������ �� ���������, ����� �� ������� '2'
select cashier.NAME, cashier.PHONE
from CASHIERS cashier
where cashier.PHONE not in (select c.PHONE
								from CASHIERS c
								where UPPER(c.PHONE) LIKE UPPER('%2%'))
