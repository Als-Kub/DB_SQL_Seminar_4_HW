CREATE DATABASE hw_4;
USE hw_4;

CREATE TABLE AUTO 
(       
	REGNUM VARCHAR(10) PRIMARY KEY, 
	MARK VARCHAR(10), 
	COLOR VARCHAR(15),
	RELEASEDT DATE, 
	PHONENUM VARCHAR(15)
);

INSERT INTO AUTO (REGNUM, MARK,	COLOR, RELEASEDT, PHONENUM )
VALUES(111114,'LADA', 'КРАСНЫЙ', date'2008-01-01', '9152222221');


INSERT INTO AUTO (REGNUM, MARK,	COLOR, RELEASEDT, PHONENUM )
VALUES(111115,'VOLVO', 'КРАСНЫЙ', date'2013-01-01', '9173333334');


INSERT INTO AUTO (REGNUM, MARK,	COLOR, RELEASEDT, PHONENUM )
VALUES(111116,'BMW', 'СИНИЙ', date'2015-01-01', '9173333334');


INSERT INTO AUTO (REGNUM, MARK,	COLOR, RELEASEDT, PHONENUM )
VALUES(111121,'AUDI', 'СИНИЙ', date'2009-01-01', '9173333332');


INSERT INTO AUTO (REGNUM, MARK,	COLOR, RELEASEDT, PHONENUM )
VALUES(111122,'AUDI', 'СИНИЙ', date'2011-01-01', '9213333336');


INSERT INTO AUTO (REGNUM, MARK,	COLOR, RELEASEDT, PHONENUM )
VALUES(111113,'BMW', 'ЗЕЛЕНЫЙ', date'2007-01-01', '9214444444');


INSERT INTO AUTO (REGNUM, MARK,	COLOR, RELEASEDT, PHONENUM )
VALUES(111126,'LADA', 'ЗЕЛЕНЫЙ', date'2005-01-01', null);


INSERT INTO AUTO (REGNUM, MARK,	COLOR, RELEASEDT, PHONENUM )
VALUES(111117,'BMW', 'СИНИЙ', date'2005-01-01', null);


INSERT INTO AUTO (REGNUM, MARK,	COLOR, RELEASEDT, PHONENUM )
VALUES(111119,'LADA', 'СИНИЙ', date'2017-01-01', 9213333331);


/* 1. Вывести на экран сколько машин каждого цвета для машин марок BMW и LADA */

SELECT MARK, COLOR, COUNT(COLOR) AS "Quantity of colors" FROM AUTO WHERE MARK = "BMW" GROUP BY COLOR 
UNION SELECT MARK, COLOR, COUNT(COLOR) AS "Quantity of colors" FROM AUTO WHERE MARK = "LADA" GROUP BY COLOR;


/* 2. Вывести на экран марку авто и количество AUTO не этой марки */

SELECT a1.MARK, count(a2.REGNUM) AS "Quantity of cars"
FROM (SELECT DISTINCT MARK FROM auto) a1
LEFT JOIN auto a2 ON a1.MARK != a2.MARK GROUP BY a1.MARK;



/* 3. Даны 2 таблицы, созданные следующим образом:
create table test_a (id number, data varchar2(1));
create table test_b (id number);
insert into test_a(id, data) values
(10, 'A'),
(20, 'A'),
(30, 'F'),
(40, 'D'),
(50, 'C');
insert into test_b(id) values
(10),
(30),
(50);
Напишите запрос, который вернет строки из таблицы test_a, id которых нет в таблице test_b, НЕ используя ключевого слова NOT.*/

CREATE TABLE test_a (id_number INT, data VARCHAR(1));

INSERT INTO test_a (id_number, DATA) VALUES
(10, 'A'),
(20, 'A'),
(30, 'F'),
(40, 'D'),
(50, 'C');

CREATE TABLE test_b  (id_number INT);

INSERT INTO test_b(id_number) VALUES
(10),
(30),
(50);

SELECT test_a.* FROM test_a
LEFT JOIN test_b
ON test_a.id_number = test_b.id_number
WHERE test_b.id_number IS NUll;





