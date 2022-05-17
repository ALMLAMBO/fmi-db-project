USE master
GO
if exists (select * from sysdatabases where name='bus_station')
	DROP DATABASE bus_station
GO

CREATE DATABASE bus_station
GO
USE bus_station
GO

CREATE TABLE ��������(
    �������������� CHAR(50) NOT NULL PRIMARY KEY
);
CREATE TABLE �������(
    ����� CHAR(10) NOT NULL PRIMARY KEY ,
    ������� CHAR(10), CHECK ( ������� LIKE '[0][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]' ),
    ��� CHAR(50)
);
CREATE TABLE ����(
    �����_��_������ CHAR(10) NOT NULL REFERENCES �������(�����),
    ��������������_��_�������� CHAR(50) NOT NULL REFERENCES ��������(��������������),
    �����_��_���� INTEGER NOT NULL,
	������� CHAR(10) NOT NULL,
    PRIMARY KEY (�����_��_������, ��������������_��_��������, �����_��_���� )
);

CREATE TABLE ��������(
    ���������_����� CHAR(10) UNIQUE NOT NULL ,
    ��������������_��_��������_�������� CHAR(50) NOT NULL REFERENCES ��������(��������������),
    ��������������_��_��������_���������� CHAR(50) NOT NULL REFERENCES ��������(��������������),
    ����� INTEGER CHECK (����� < 60),
    ����_�������� DATE ,
    ����_���������� DATE,
    ���_�������� TIME,
    ���_���������� TIME,
	������� CHAR(10) NOT NULL,
    PRIMARY KEY(���������_�����, ��������������_��_��������_��������, ��������������_��_��������_����������)
);

CREATE TABLE �������(
    ����� CHAR(10) NOT NULL PRIMARY KEY ,
    ������� CHAR(10) CHECK ( ������� LIKE '0[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]' ),
    ��� CHAR(50)
);
CREATE  TABLE ���������(
    �����_��_������ CHAR(10) NOT NULL REFERENCES �������(�����),
    �����_��_������� CHAR(10) NOT NULL REFERENCES ��������(���������_�����),
    PRIMARY KEY(�����_��_������,�����_��_�������)
);
CREATE TABLE �������(
    ������� CHAR(50) NOT NULL PRIMARY KEY,
	��� CHAR(50) NOT NULL
);

CREATE TABLE ������(
	�����_��_����� CHAR(10) NOT NULL,
    �����_��_������� CHAR(10) NOT NULL REFERENCES ��������(���������_�����),
    �����_��_������ CHAR(10) NOT NULL REFERENCES �������(�����),
    �������_��_������ CHAR(50) NOT NULL REFERENCES �������(�������),
    ����� INTEGER,
    ����_�������� DATE,
    ���_�������� TIME,
    ��� CHAR(1) DEFAULT '�' CHECK ( ��� in ('�', '�')),
	��� CHAR(1) DEFAULT '�' CHECK ( ��� in ('�', '�')),
	������� CHAR(10) NOT NULL,
    PRIMARY KEY(�����_��_�����,�����_��_�������,�����_��_������,�������_��_������)
);
CREATE TABLE ����������(
    ���� DATE PRIMARY KEY,
	��������������_��_�������� CHAR(50) NOT NULL REFERENCES ��������(��������������),
    ������_���������� CHAR(4) CHECK ( ������_���������� in ('���', '����')),
    ������_���������� CHAR(4) CHECK ( ������_����������  in ('���', '����'))
);


