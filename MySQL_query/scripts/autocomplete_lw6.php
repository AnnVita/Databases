<?php
	
	$mysqli = new mysqli('localhost', 'root', '', 'warehouses_and_goods');
	if ($mysqli->connect_error) {
		die('Connect Error (' . $mysqli->connect_errno . ') ' . $mysqli->connect_error);
	}
	$surnames = ['Петров', 'Иванов', 'Скворцов', 'Васильев', 
		'Колобродов', 'Хоббитов', 'Кольцов', 'Лелеков',
		'Кудрявцев', 'Прохоров', 'Кублицкий', 'Красильников', 
		'Геворкян', 'Маркарян', 'Степанов', 'Старовойтов', 
		'Максимов', 'Инеев', 'Фрост', 'Уотсон', 'Гейзенберг',
		'Пинкман', 'Уайт', 'Блэк', 'Грин'];
	$names = ['Андрей', 'Илья', 'Петр', 'Василий', 
		'Иван', 'Антон', 'Максим', 'Владимир', 'Денис',
		'Алексей', 'Борис', 'Виктор', 'Олег', 'Том', 
		'Джек', 'Захар', 'Юрий', 'Александр', 
		'Федор', 'Николай', 'Мирон', 'Виталий',
		'Феликс', 'Ян', 'Сергей', 'Уолтер', 'Джесси',
		'Альберт', 'Артем', 'Павел'];
	$goodTitles = ['лыжи', 'коньки', 'ватрушка', 'волейбольный мяч',
		 'футбольный мяч', 'удочка', 'сачок', 'надувная лодка',
		 'гантеля', 'ракетки', 'надувной мяч', 'ружье', 'обруч', 
		 'мясные консервы', 'минеральная вода', 'конфеты', 'печеньки',
		 'синяя карамель', 'прозрачная карамель', 'виски', 
		 'кола', 'котлеты', 'макароны', 'меч', 
		 'отвертка', 'сварочный аппарат', 'газовый балон', 'пластиковый контейнер',
		 'стул компьютерный', 'полка', 'доска', 'арматура'];
	$manufacturerTitles = ['Производитель №', 'Гейзенберг Энтерпрайс №'];
	$goodTypes = ['строительный', 'пищевой', 'спортивный', 'универсальный', 'интструменты'];
	$sity = ['Москва', 'Санкт-Петербург', 'Йошкар-Ола', 'Кострома', 'Нижний Новгород', 
			'Минск', 'Самоков', 'Варта', 'Киев', 'Варшава', 'Гданьск', 'Люблин', 'Щецин', 
			'Торунь', 'Белосток', 'Катовице'];
	
	/*
	for ($i = 0; $i < 15000; $i++)
	{
			$query = "INSERT INTO manufacturer (`name`, `director_name`, `date_of_foundation`) VALUES ('"
				. $manufacturerTitles[array_rand($manufacturerTitles, 1)] . $i . "', '" 
				. $names[array_rand($names, 1)] . " " . $surnames[array_rand($surnames, 1)] . "', '"
				. date("Y-m-d H:i:s", rand(1262055681, 1792055681)) . "')";
			$result = $mysqli->query($query, MYSQLI_USE_RESULT);
	}
	
	
	for ($i = 0; $i < 15000; $i++)
	{
			$query = "INSERT INTO firm_owner (`name`, `director_name`, `date_of_foundation`) VALUES ('"
				. 'Фирма №' . $i . "', '" 
				. $names[array_rand($names, 1)] . " " . $surnames[array_rand($surnames, 1)] . "', '"
				. date("Y-m-d H:i:s", rand(1262055681, 1792055681)) . "')";
			$result = $mysqli->query($query, MYSQLI_USE_RESULT);
	}
	

	for ($i = 0; $i < 15000; $i++)
	{
			$query = "INSERT INTO stock (`name`, `sity`, `rent_price`, `manager_name`, `id_firm_owner`) VALUES ('"
				. 'Склад №' . $i . "', '"
				. $sity[array_rand($sity, 1)] . "', '"
				. rand(1000, 200000) . "', '" 
				. $names[array_rand($names, 1)] . " " . $surnames[array_rand($surnames, 1)] . "', '"
				. rand(0, 15000) . "')";
			$result = $mysqli->query($query, MYSQLI_USE_RESULT);
	}

	for ($i = 0; $i < 15000; $i++)
	{
			$query = "INSERT INTO good (`name`, `type`, `retail_price`, `id_manufacturer`) VALUES ('"
				. $goodTitles[array_rand($goodTitles, 1)] . "', '"
				. $goodTypes[array_rand($goodTypes, 1)] . "', '"
				. rand(1000, 200000) . "', '" 
				. rand(0, 15000) . "')";
			$result = $mysqli->query($query, MYSQLI_USE_RESULT);
	}

	for ($i = 0; $i < 15000; $i++)
	{
			$query = "INSERT INTO good_in_stock (`id_good`, `id_stock`, `date_of_manufacture`, `quantity`) VALUES ('"
				. rand(0, 15000) . "', '"
				. rand(0, 15000) . "', '"
				. date("Y-m-d H:i:s", rand(1262055681, 1792055681)) . "', '" 
				. rand(10, 50000) . "')";
			$result = $mysqli->query($query, MYSQLI_USE_RESULT);
	}
	*/

	echo 'Done';