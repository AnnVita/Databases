<?php
	
	$mysqli = new mysqli('localhost', 'root', '', 'university');
	if ($mysqli->connect_error) {
		die('Connect Error (' . $mysqli->connect_errno . ') ' . $mysqli->connect_error);
	}
	$surnames = ['Петров', 'Иванов', 'Скворцов', 'Васильев', 
		'Колобродов', 'Хоббитов', 'Кольцов', 'Лелеков',
		'Кудрявцев', 'Прохоров', 'Кублицкий', 'Красильников', 
		'Геворкян', 'Маркарян', 'Степанов', 'Старовойтов', 
		'Максимов', 'Инеев', 'Фрост', 'Уотсон', 'Гейзенберг',
		'Пинкман', 'Уайт', 'Блэк', 'Грин', 'Малов'];
	$groups = ['ПС', 'ИВТ', 'БИ', 'ВМ'];
	$subjects = ['базы данных', 'алгоритмы и структуры данных', 'объектно ориентированное программирование', 'комбинаторная матаематика',
				 'информатика и программирование', 'параллельное программирование', 'WEB-разработка', 'Frontend-разработка', 'Backend-разработка', 'матанализ',
				  'низкоуровневое программирование', 'разработка игр', 'компьютерная графика', 'функциональное программирование', 'криптология'];
	$names = ['Андрей', 'Илья', 'Петр', 'Василий', 
		'Иван', 'Антон', 'Максим', 'Владимир', 'Денис',
		'Алексей', 'Борис', 'Виктор', 'Олег', 'Том', 
		'Джек', 'Захар', 'Юрий', 'Александр', 
		'Федор', 'Николай', 'Мирон', 'Виталий',
		'Феликс', 'Ян', 'Сергей', 'Уолтер', 'Джесси',
		'Альберт', 'Артем', 'Павел'];
	$positions = ['директор', 'разработчик', 'ведущий разработчик', 'разработчик', 'разработчик'];

	for ($i = 0; $i < 200000; $i++)
	{
		$query = "INSERT INTO `mark` (`id_student`, `id_lesson`, `mark`, `date`) VALUES ('"
			. rand(1, 250000) . "', '"
			. rand(1, 20000) . "', '" 
			. rand(1, 5) . "', '" 
			. date("Y-m-d H:i:s", rand(959894217, 1591046217)) ."');";
		$result = $mysqli->query($query, MYSQLI_USE_RESULT);
	}

/*	
	for ($i = 0; $i < 20000; $i++)
	{
		$query = "INSERT INTO `lesson` (`id_teacher`, `id_subject`, `id_group`) VALUES ('"
			. rand(1, 20000) . "', '"
			. rand(1, 15000) . "', '" 
			. rand(1, 15000) ."');";
		$result = $mysqli->query($query, MYSQLI_USE_RESULT);
	}

	for ($i = 0; $i < 20000; $i++)
	{
		$query = "INSERT INTO `teacher` (`name`, `position`) VALUES ('"
			. $names[array_rand($names, 1)] . " " . $surnames[array_rand($surnames, 1)] . "', '" 
			. $positions[array_rand($positions, 1)] ."');";
		$result = $mysqli->query($query, MYSQLI_USE_RESULT);
	}


	for ($i = 0; $i < 15000; $i++)
	{
		$group = $groups[array_rand($groups, 1)];
		$query = "INSERT INTO `subject` (`title`, `hours`) VALUES ('"
			. $subjects[array_rand($subjects, 1)] . "', '" 
			. rand(10, 20) * 10 ."');";
		$result = $mysqli->query($query, MYSQLI_USE_RESULT);
	}

	for ($i = 0; $i < 250000; $i++)
	{
		$group = $groups[array_rand($groups, 1)];
		$query = "INSERT INTO `student` (`name`, `id_group`, `year_of_birth`) VALUES ('"
			. $names[array_rand($names, 1)] . " " . $surnames[array_rand($surnames, 1)] . "', '" 
			. rand(1, 15000) . "', '"
			. date("Y", rand(328742217, 1054502217)) . "');";
		$result = $mysqli->query($query, MYSQLI_USE_RESULT);
		echo $query;
	}
	for ($i = 0; $i < 15000; $i++)
	{
		$group = $groups[array_rand($groups, 1)];
		$query = "INSERT INTO `group` (`title`, `captain`, `number`, `speciality`) VALUES ('"
			. $group . "-" . rand(1, 5) . rand(1, 20) . "', '" 
			. $surnames[array_rand($surnames, 1)] . "', '"
			. rand(1, 50) . "', '"
			. $group . "');";
		$result = $mysqli->query($query, MYSQLI_USE_RESULT);
		echo $query;
	}
	*/

	echo 'Done';