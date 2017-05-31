1. INSERT
    1. Без указания списка полей
        INSERT INTO owner VALUES (1, 'Андрей', 'Петров', '12 34', 123456);
        INSERT INTO owner VALUES (2, 'Андрей', 'Васильев', '56 78', 654321);

    2. С указанием списка полей
        INSERT INTO communal_service (title, agency, tariff, unit) VALUES ('Электроснабжение', 'Мосэнергосбыт', 3.15 ,'руб./кВт ч');
        INSERT INTO real_estate (locality, address) VALUES ('г. Йошкар-Ола', 'переулок Авиации, 6');
        INSERT INTO real_estate (locality, address) VALUES ('г. Москва', 'улица Заводская, 6a, 21');

    3. С чтением значения из другой таблицы
        INSERT INTO sertificate_of_ownership (id_owner, id_real_estate, agency) 
        SELECT id_owner, id_real_estate, "МФЦ" FROM owner, real_estate WHERE name = 'Андрей' AND locality LIKE '%Москва%';

2. DELETE
    1. Всех записей
        DELETE FROM bill;

    2. По условию
        DELETE FROM payment WHERE date_of_payment < NOW();
        DELETE FROM sertificate_of_ownership WHERE agency IS NULL;

    3. Очистить таблицу
        TRUNCATE TABLE bill;

3. UPDATE
    1. Всех записей
        UPDATE bill SET due_date = NOW();

    2. По условию обновляя один атрибут
        UPDATE communal_service SET agency = 'Мосэнергосбыт' WHERE title = 'Электроснабжение';

    3. По условию обновляя несколько атрибутов
        UPDATE bill SET due_date = NOW(), id_communal_service = 1 WHERE id_sertificate_of_ownership = 1;

4. SELECT в рамках одной таблицы
    1. С определенным набором извлекаемых атрибутов (SELECT atr1, atr2 FROM...)
        SELECT title, agency FROM communal_service;

    2. Со всеми атрибутами (SELECT * FROM...)
        SELECT * FROM real_estate;

    3. С условием по атрибуту (SELECT * FROM ... WHERE atr1 = '')
        SELECT * FROM real_estate WHERE locality LIKE 'г%';
        SELECT * FROM real_estate WHERE address LIKE '%переулок Авиации%';
