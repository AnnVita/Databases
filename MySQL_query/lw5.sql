1.1 SELECT LIMIT/TOP
    //вернуть 3 проката
    SELECT TOP 3 * FROM rent;
    //вернуть 3 недавно открытых проката
    SELECT * FROM rent ORDER BY rent.date_of_rent LIMIT 3;

2. WHERE
    2.1 NULL
        //вернуть все записи прокатов, в которых нет даты возврата
        SELECT * FROM rent WHERE return_date IS NULL;
    2.2 NOT NULL
        //вернуть все записи клиентов, у которых указаны номера телефона
        SELECT customer.surname, customer.phone_number FROM customer WHERE phone_number NOT NULL;
    2.3 условный оператор BETWEEN
        //вернуть все записи инвентаря, где цена проката больше 10000 и меньше 20000
        SELECT inventory.title, inventory.rental_price FROM inventory WHERE inventory.rental_price BETWEEN 10000 AND 20000;
    2.4 условный оператор IN
        //вернуть все записи инвентаря с названием "Лыжи" и "Коньки"
        SELECT * FROM inventory WHERE inventory.title IN ('Лыжи', 'Коньки');
    2.5 =
        //вернуть информацию о клиенте с фамилией "Иванов"
        SELECT * FROM customer WHERE customer.surname = 'Иванов' LIMIT 1;
    2.6 !=
        //вернуть информацию о всем инвентаре, кроме лыж
        SELECT * FROM inventory WHERE title <> 'Лыжи';

3. ORDER
    3.1 ASC
        //вернуть полные имена клиентов c телефонами в алфавитном порядке
        SELECT CONCAT(customer.surname,' ',customer.name) AS full_name, customer.phone_number FROM customer ORDER BY full_name;
    3.2 DESC
        //вернуть все записи инвентаря от самых новых к старым
        SELECT firm_inventory.id_invetory_to_rent, firm_inventory.date_of_purchase FROM firm_inventory ORDER BY firm_inventory.date_of_purchase DESC;
    3.3 по двум аттрибутам
        //вернуть все записи прокатов, сортируя сначала по due_date а потом по дате начала проката
        SELECT * FROM rent ORDER BY due_date DESC, date_of_rent DESC;
    3.4 по первому аттрибуту, из списка извлекаемых
        //получить список инвентаря от нового к старым
        SELECT firm_inventory.id_invetory_to_rent, firm_inventory.date_of_purchase FROM firm_inventory ORDER BY 2 DESC;

4. Функции агрегации
    4.1 MIN
        //минимальная цена проката инвентаря
        SELECT MIN(inventory.rental_price) FROM inventory;
    4.2 MAX
        //максимальная цена проката инвентаря
        SELECT MAX(inventory.rental_price) FROM inventory;
    4.3 AVG
        //средняя цена проката инвентаря
        SELECT AVG(inventory.rental_price) FROM inventory;
    4.4 SUM
        //посчитать сумму всех штрафов
        SELECT SUM(rent.fine) FROM rent;

5.1 DISTINCT
    //вывести все типы инвентаря
    SELECT DISTINCT type FROM inventory;

5.2 COUNT(DISTINCT X)
    //посчитать количество типов инвентаря
    SELECT COUNT(DISTINCT type) FROM inventory;

6 GROUP BY
    6.1 SUM GROUP BY
        //посчитать общую стоимость прокатов по типу инвентаря
        SELECT type, SUM(rental_price) FROM inventory GROUP BY type;
    6.2 SUM WHERE GROUP BY
        //посчитать общую стоимость прокатов по типу инвентаря где цена проката больше 1000
        SELECT type, SUM(rental_price) FROM inventory WHERE rental_price > 1000 GROUP BY type;
    6.3 SUM GROUP BY HAVING
        //посчитать общую стоимость прокатов по типу инвентаря и вывести только те записи, в которых сумма меньше 80000
        SELECT type, SUM(rental_price) FROM inventory GROUP BY type HAVING SUM(rental_price) < 80000;