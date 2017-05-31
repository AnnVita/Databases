4.1. LEFT JOIN двух таблиц + WHERE по 1 атрибуту

    Получить названия фирм и имена их руководителей, которые производят товары универсального типа
    SELECT manufacturer.name, manufacturer.director_name
        FROM good LEFT JOIN manufacturer ON good.id_good = manufacturer.id_manufacturer WHERE good.type = 'универсальный';
    
    SQL-запрос успешно выполнен.

    EXPLAIN SELECT manufacturer.name, manufacturer.director_name
        FROM good LEFT JOIN manufacturer ON good.id_good = manufacturer.id_manufacturer WHERE good.type = 'универсальный'

    1	SIMPLE	good	ALL					14950	Using where	
    1	SIMPLE	manufacturer	eq_ref	PRIMARY	PRIMARY	4	warehouses_and_goods.good.id_good	1		

4.2. RIGHT JOIN двух таблиц, получить те же записи как в 4.1.

    Получить названия фирм и имена их руководителей, которые производят товары универсального типа
    SELECT manufacturer.name, manufacturer.director_name
        FROM manufacturer RIGHT JOIN good ON manufacturer.id_manufacturer = good.id_good WHERE good.type = 'универсальный';

    SQL-запрос успешно выполнен.

    EXPLAIN SELECT manufacturer.name, manufacturer.director_name
        FROM manufacturer RIGHT JOIN good ON manufacturer.id_manufacturer = good.id_good WHERE good.type = 'универсальный'

    1	SIMPLE	good	ALL					15078	Using where	
    1	SIMPLE	manufacturer	eq_ref	PRIMARY	PRIMARY	4	warehouses_and_goods.good.id_good	1		

4.3. LEFT JOIN двух таблиц + WHERE по 2 атрибутам из 1 таблицы 
    
    Получить названия фирм и имена их руководителей, у которых среди товаров есть карамель универсального типа
    SELECT manufacturer.name, manufacturer.director_name
        FROM good LEFT JOIN manufacturer ON good.id_good = manufacturer.id_manufacturer WHERE good.type = 'универсальный' AND good.name LIKE '%карамель%';
    
    SQL-запрос успешно выполнен.

    EXPLAIN SELECT manufacturer.name, manufacturer.director_name
        FROM good LEFT JOIN manufacturer ON good.id_good = manufacturer.id_manufacturer WHERE good.type = 'универсальный' AND good.name LIKE '%карамель%'

    1	SIMPLE	good	ALL					15021	Using where	
    1	SIMPLE	manufacturer	eq_ref	PRIMARY	PRIMARY	4	warehouses_and_goods.good.id_good	1		

4.4. LEFT JOIN двух таблиц + WHERE по 1 атрибуту из каждой таблицы 

    Получить названия фирм и имена их руководителей, где в названии есть 'Гейзенберг', и товар - синяя карамель
    SELECT manufacturer.name, manufacturer.director_name
        FROM good LEFT JOIN manufacturer ON good.id_good = manufacturer.id_manufacturer 
        WHERE manufacturer.name LIKE '%Гейзенберг%' AND good.name LIKE '%синяя карамель%';
    
    SQL-запрос успешно выполнен.

    EXPLAIN SELECT manufacturer.name, manufacturer.director_name
        FROM good LEFT JOIN manufacturer ON good.id_good = manufacturer.id_manufacturer 
        WHERE manufacturer.name LIKE '%Гейзенберг%' AND good.name LIKE '%синяя карамель%'

    1	SIMPLE	good	ALL	PRIMARY				15050	Using where	
    1	SIMPLE	manufacturer	eq_ref	PRIMARY	PRIMARY	4	warehouses_and_goods.good.id_good	1	Using where	

4.3. LEFT JOIN трех таблиц + WHERE по 1 атрибуту из каждой таблицы 

    Получить склады, на которых лежит больше 1000 единиц товаров синей карамели и мэнеджер с именем Джесси
    SELECT stock.name, stock.sity FROM stock 
        LEFT JOIN good_in_stock ON good_in_stock.id_stock = stock.id_stock
        LEFT JOIN good ON good_in_stock.id_good = good.id_good
        WHERE stock.manager_name LIKE '%Джесси%' AND good_in_stock.quantity > 1000 AND good.name LIKE '%синяя карамель%';
        
    SQL-запрос успешно выполнен.
    EXPLAIN SELECT stock.name, stock.sity FROM stock 
    LEFT JOIN good_in_stock ON good_in_stock.id_stock = stock.id_stock
    LEFT JOIN good ON good_in_stock.id_good = good.id_good
    WHERE stock.manager_name LIKE '%Джесси%' AND good_in_stock.quantity > 1000 AND good.name LIKE '%синяя карамель%'

    1	SIMPLE	good	ALL	PRIMARY				14323	Using where	
    1	SIMPLE	good_in_stock	ref	id_good,id_stock	id_good	4	warehouses_and_goods.good.id_good	1	Using where	
    1	SIMPLE	stock	eq_ref	PRIMARY	PRIMARY	4	warehouses_and_goods.good_in_stock.id_stock	1	Using where	
    
4.4. Подзапрос с IN

    получить товары, у которых производитель был основан раньше 2015 года
    SELECT good.name FROM good WHERE good.id_manufacturer IN (SELECT id_manufacturer FROM manufacturer WHERE date_of_foundation < '2015');
    
    SQL-запрос успешно выполнен.

    EXPLAIN SELECT good.name FROM good WHERE good.id_manufacturer IN (SELECT id_manufacturer FROM manufacturer WHERE date_of_foundation < '2015')

    1	PRIMARY	good	ALL					15107	Using where	
    2	DEPENDENT SUBQUERY	manufacturer	unique_subquery	PRIMARY	PRIMARY	4	func	1	Using where	

4.5. Подзапрос с одним из операторов (= > < >= <= <> != <=> LIKE)
    
    

4.6. ORDER BY 1 атрибут

    Получить названия фирм и имена их руководителей, где в названии есть 'Гейзенберг', и товар - синяя карамель,
        результат отсортировать по дате основария компаний
    SELECT manufacturer.name, manufacturer.director_name
        FROM good LEFT JOIN manufacturer ON good.id_good = manufacturer.id_manufacturer 
        WHERE manufacturer.name LIKE '%Гейзенберг%' AND good.name LIKE '%синяя карамель%' ORDER BY manufacturer.date_of_foundation ASC;

    SQL-запрос успешно выполнен.

    EXPLAIN SELECT manufacturer.name, manufacturer.director_name
        FROM good LEFT JOIN manufacturer ON good.id_good = manufacturer.id_manufacturer 
        WHERE manufacturer.name LIKE '%Гейзенберг%' AND good.name LIKE '%синяя карамель%' ORDER BY manufacturer.date_of_foundation ASC

    1	SIMPLE	good	ALL	PRIMARY				12114	Using where; Using temporary; Using filesort	
    1	SIMPLE	manufacturer	eq_ref	PRIMARY	PRIMARY	4	warehouses_and_goods.good.id_good	1	Using where	

4.7. ORDER BY 2 атрибутам

    Получить склады, на которых лежит больше 1000 единиц товаров и дата производства - позже 2016 года, 
        сортировка сначала по дате произвоства, потом по наименованию товара
    SELECT stock.name, stock.sity FROM stock 
        LEFT JOIN good_in_stock ON good_in_stock.id_stock = stock.id_stock
        LEFT JOIN good ON good_in_stock.id_good = good.id_good
        WHERE good_in_stock.quantity > 1000 AND good_in_stock.date_of_manufacture > '2016'
        ORDER BY good_in_stock.date_of_manufacture DESC, good.name ASC;