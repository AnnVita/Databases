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
	
	
	// for ($i = 0; $i < 30; $i++)
	// {
	// 		$query = "insert into rent (`date_of_rent`, `due_date`, `fine`, `id_collaborator`, `id_customer`) values ('"
	// 			. date("y-m-d h:i:s", rand(1262055681, 1792055681)) . "', '" 
	// 			. date("y-m-d h:i:s", rand(1262055681, 1792055681))  . "', '"
	// 			. rand(0, 50000) . "', '"
	// 			. rand(1, 20) . "', '"  
	// 			. rand(1, 50) . "')";
	// 		$result = $mysqli->query($query, mysqli_use_result);
	// }

	// for ($i = 0; $i < 20; $i++)
	// {
	// 		$query = "INSERT INTO firm_inventory (`id_inventory`, `sustain_comment`, `date_of_purchase`, `id_firm`) VALUES ('"
	// 			. rand(1, 13) . "', '" 
	// 			. $sustainComments[array_rand($sustainComments, 1)]  . "', '"
	// 			. date("Y-m-d H:i:s", rand(1262055681, 1792055681)) . "', '"  
	// 			. rand(10, 17) . "')";
	// 			var_dump($query);
	// 		$result = $mysqli->query($query, MYSQLI_USE_RESULT);
	// }	 

	// for ($i = 0; $i < 20; $i++)
	// {
	// 		$query = "INSERT INTO collaborator (`name`, `surname`, `id_firm`) VALUES ('"
	// 			. $surnames[array_rand($surnames, 1)] . "', '" 
	// 			. $names[array_rand($names, 1)]  . "', '" 
	// 			. rand(10, 17) . "')";
	// 		$result = $mysqli->query($query, MYSQLI_USE_RESULT);
	// }
	
	// for ($i = 0; $i < count($firmTitles); $i++)
	// {
	// 		$query = "INSERT INTO firm (`title`, `date_of_registration`, `owner`) VALUES ('"
	// 			. $firmTitles[$i] . "', '" 
	// 			. date("Y-m-d H:i:s", rand(1262055681, 1792055681)) . "', '" 
	// 			. $surnames[array_rand($surnames, 1)] . "')";
	// 		$result = $mysqli->query($query, MYSQLI_USE_RESULT);
	// }

	// for ($i = 0; $i < count($goodTitles); $i++)
	// {
	// 		$query = "INSERT INTO inventory (`title`, `type`, `rental_price`) VALUES ('"
	// 			. $goodTitles[$i] . "', '" 
	// 			. $inventoryTypes[array_rand($inventoryTypes, 1)] . "', " 
	// 			. rand(1500, 50000) . ")";
	// 		$result = $mysqli->query($query, MYSQLI_USE_RESULT);
	// }

	// for ($i = 0; $i < 50; $i++)
	// {
	// 		$query = "INSERT INTO customer (`name`, `surname`, `phone_number`) VALUES ('"
	// 			. $names[array_rand($names, 1)] . "', '"
	// 			. $surnames[array_rand($surnames, 1)] . "', '"
	// 			. $phoneNumbers[array_rand($phoneNumbers, 1)] . "')";
	// 		$result = $mysqli->query($query, MYSQLI_USE_RESULT);
	// }

	// for ($i = 0; $i < 50; $i++)
	// {
	// 		$query = "INSERT INTO firm (`title`, `date_of_registration`, `owner`) VALUES ('"
	// 			. $firmTitles[1] . "', '" 
	// 			. date("Y-m-d H:i:s", rand(1262055681, 1792055681)) . "', '" 
	// 			. $surnames[array_rand($surnames, 1)] . "')";
	// 		$result = $mysqli->query($query, MYSQLI_USE_RESULT);
	// }

	echo 'Done';