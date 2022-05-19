-- 1. ������, ����� ������� ��� � ��������� ����� �� ������ ������� 
select driver.NAME, driver.PHONE
from DRIVERS driver

-- 2. ������, ����� ������� ��������� �����, �� ������, ����� ��� ������� '�'
select driver.PHONE
from DRIVERS driver
where UPPER (driver.NAME) like UPPER ('%�%')

-- 3.������, ����� ������� �������� �� ����������, ����� ���� ������ �� 10 �����
select bus.BUS_NUMBER
from BUSES bus
where bus.SEATS >= 10

-- 4. ������, ����� ������� ����� �� �����, ����� � � ������� �����, �� ��� '�' � � ��� ����� �� �������� '������� �������� ���'
select ticket.TICKET_NUMBER
from TICKETS ticket
where ticket.AGENCY = '������� �������� ���'
	and ticket.SEAT % 2 = 1
	and ticket.TYPE = 'T'

-- 5. ������, ����� ������� ��� �� ������, ����� ��������� ����� ������� '5'
select cashier.NAME
from CASHIERS cashier
where UPPER (cashier.PHONE) like UPPER ('%5%')