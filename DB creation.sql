USE master
GO
if exists (select * from sysdatabases where name='bus_station')
	DROP DATABASE bus_station
GO

CREATE DATABASE bus_station
GO
USE bus_station
GO

CREATE TABLE юбрнцюпю(
    леярнонкнфемхе CHAR(50) NOT NULL PRIMARY KEY
);
CREATE TABLE йюяхепх(
    мнлеп CHAR(10) NOT NULL PRIMARY KEY ,
    рекетнм CHAR(10), CHECK ( рекетнм LIKE '[0][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]' ),
    хле CHAR(50)
);
CREATE TABLE йюях(
    мнлеп_мю_йюяхеп CHAR(10) NOT NULL REFERENCES йюяхепх(мнлеп),
    леярнонкнфемхе_мю_юбрнцюпю CHAR(50) NOT NULL REFERENCES юбрнцюпю(леярнонкнфемхе),
    мнлеп_мю_йюяю INTEGER NOT NULL,
	юцемжхъ CHAR(10) NOT NULL,
    PRIMARY KEY (мнлеп_мю_йюяхеп, леярнонкнфемхе_мю_юбрнцюпю, мнлеп_мю_йюяю )
);

CREATE TABLE юбрнасях(
    юбрнасяем_мнлеп CHAR(10) UNIQUE NOT NULL ,
    леярнонкнфемхе_мю_юбрнцюпю_рпзцбюме CHAR(50) NOT NULL REFERENCES юбрнцюпю(леярнонкнфемхе),
    леярнонкнфемхе_мю_юбрнцюпю_опхярхцюме CHAR(50) NOT NULL REFERENCES юбрнцюпю(леярнонкнфемхе),
    леярю INTEGER CHECK (леярю < 60),
    дюрю_рпзцбюме DATE ,
    дюрю_опхярхцюме DATE,
    вюя_рпзцбюме TIME,
    вюя_опхярхцюме TIME,
	юцемжхъ CHAR(10) NOT NULL,
    PRIMARY KEY(юбрнасяем_мнлеп, леярнонкнфемхе_мю_юбрнцюпю_рпзцбюме, леярнонкнфемхе_мю_юбрнцюпю_опхярхцюме)
);

CREATE TABLE ьнтэнпх(
    мнлеп CHAR(10) NOT NULL PRIMARY KEY ,
    рекетнм CHAR(10) CHECK ( рекетнм LIKE '0[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]' ),
    хле CHAR(50)
);
CREATE  TABLE сопюбкъбю(
    мнлеп_мю_ьнтэнп CHAR(10) NOT NULL REFERENCES ьнтэнпх(мнлеп),
    мнлеп_мю_юбрнася CHAR(10) NOT NULL REFERENCES юбрнасях(юбрнасяем_мнлеп),
    PRIMARY KEY(мнлеп_мю_ьнтэнп,мнлеп_мю_юбрнася)
);
CREATE TABLE озрмхжх(
    рекетнм CHAR(50) NOT NULL PRIMARY KEY,
	хле CHAR(50) NOT NULL
);

CREATE TABLE ахкерх(
	мнлеп_мю_ахкер CHAR(10) NOT NULL,
    мнлеп_мю_юбрнася CHAR(10) NOT NULL REFERENCES юбрнасях(юбрнасяем_мнлеп),
    мнлеп_мю_йюяхеп CHAR(10) NOT NULL REFERENCES йюяхепх(мнлеп),
    рекетнм_мю_озрмхй CHAR(50) NOT NULL REFERENCES озрмхжх(рекетнм),
    лъярн INTEGER,
    дюрю_рпзцбюме DATE,
    вюя_рпзцбюме TIME,
    бхд CHAR(1) DEFAULT 'м' CHECK ( бхд in ('м', 'л')),
	рхо CHAR(1) DEFAULT 'е' CHECK ( рхо in ('е', 'д')),
	юцемжхъ CHAR(10) NOT NULL,
    PRIMARY KEY(мнлеп_мю_ахкер,мнлеп_мю_юбрнася,мнлеп_мю_йюяхеп,рекетнм_мю_озрмхй)
);
CREATE TABLE пюгохяюмхъ(
    дюрю DATE PRIMARY KEY,
	леярнонкнфемхе_мю_юбрнцюпю CHAR(50) NOT NULL REFERENCES юбрнцюпю(леярнонкнфемхе),
    яохязй_гюлхмюбюых CHAR(4) CHECK ( яохязй_гюлхмюбюых in ('ХЛЮ', 'МЪЛЮ')),
    яохязй_опхярхцюых CHAR(4) CHECK ( яохязй_опхярхцюых  in ('ХЛЮ', 'МЪЛЮ'))
);


