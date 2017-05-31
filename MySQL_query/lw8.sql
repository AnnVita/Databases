1. Успешную транзакция (COMMIT)

    добавить товар во все партии где количество больше 10000 и на 100 увеличить партии печенек
    START TRANSACTION; 
      UPDATE good_in_stock SET quantity = quantity + 1 WHERE quantity > 10000;
      UPDATE good_in_stock INNER JOIN good ON good_in_stock.id_good_in_stock = good.id_good SET quantity = quantity + 100 WHERE good.name LIKE '%печеньки%';
    COMMIT;
2. Транзакцию с откатом (ROLLBACK)

    START TRANSACTION;
      INSERT INTO good (name, type, retail_price, id_manufacturer) VALUES ('пирожки', 'пищевой', 300, 5);
      INSERT INTO good (name, type, retail_price, id_manufacturer) VALUES ('пирожки', 'пищевой', 400, 5);
    ROLLBACK;
      INSERT INTO good (name, type, retail_price, id_manufacturer) VALUES ('пирожки', 'пищевой', 100, 5);
    COMMIT;
3. Создать хранимую процедуру с параметрами и вызвать ее

   высчитать среднюю цену аренды склада
    
    DELIMITER //
    CREATE PROCEDURE GetAverageRentPrice (OUT price INT)
    BEGIN
        SELECT AVG(stock.rent_price) INTO price FROM stock;
    END;
    //
    DELIMITER ;
    
    
    SET @res=0;
    CALL GetAverageRentPrice(@res);
    SELECT @res;
    
4. Создать триггер и вызвать его

    логгирование удаления товаров на складе
    
    DELIMITER //
    CREATE TRIGGER delete_good_in_stock BEFORE DELETE ON good_in_stock
    FOR EACH ROW BEGIN
      INSERT INTO good_in_stock_deleting_log SET good_in_stock_deleting_log.id_good = OLD.id_good, good_in_stock_deleting_log.last_quantity = OLD.quantity, good_in_stock_deleting_log.id_stock = OLD.id_stock;
    END;
    //
    DELIMITER ;