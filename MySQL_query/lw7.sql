1)	Перенести описание БД в СУБД с проставлением индексов и внешних ключей

2)	Выдать все полученные оценки группы ИВТ-11 по математике.//заменила на матанализ

    SELECT mark.mark, mark.date, `group`.title, subject.title FROM mark
    LEFT JOIN student ON mark.id_student = student.id_student
    LEFT JOIN `group` ON student.id_group = `group`.id_group
    LEFT JOIN lesson ON mark.id_lesson = lesson.id_lesson
    LEFT JOIN subject ON lesson.id_subject = subject.id_subject
    WHERE `group`.title = 'ИВТ-11' AND subject.title = 'матанализ';

3)	Дать информацию о должниках группы ПС-41 с указанием фамилии студента и названия предмета. 
    Должниками считаются студенты, не имеющие оценки по предмету, который ведется в группе.
    
    SELECT student.name, subject.title, `group`.title FROM student
    LEFT JOIN `group` ON student.id_group = `group`.id_group
    RIGHT JOIN lesson ON lesson.id_group = `group`.id_group
    LEFT JOIN subject ON lesson.id_subject = subject.id_subject
    WHERE `group`.title = 'ПС-42' AND student.id_student NOT IN (SELECT mark.id_student FROM mark);

4)	Дать среднюю оценку студентов по каждому предмету для тех предметов, по которым занимается не менее 10 студентов.

    SELECT subject.title, AVG(mark.mark) FROM mark 
    LEFT JOIN lesson ON mark.id_lesson = lesson.id_lesson
    LEFT JOIN subject ON lesson.id_subject = subject.id_subject
    GROUP BY subject.title HAVING COUNT(mark.id_student) > 10

5)	Дать оценки студентов специальности ВМ по всем проводимым предметам с указанием группы, фамилии, предмета, даты. 
    При отсутствии оценки заполнить значениями NULL поля оценки и даты.

    SELECT `group`.title, student.name, subject.title, mark.mark, mark.date FROM mark
    LEFT JOIN student ON mark.id_student = student.id_student
    LEFT JOIN `group` ON student.id_group = `group`.id_group
    LEFT JOIN lesson ON mark.id_lesson = lesson.id_lesson
    LEFT JOIN subject ON lesson.id_subject = subject.id_subject
    WHERE `group`.speciality = 'ВМ' ORDER BY student.name;

6)	Всем студентам специальности ИВТ, получившим оценки меньшие 5 по предмету БД до 12.05, повысить эти оценки на 1 балл.

    UPDATE mark
    LEFT JOIN student ON mark.id_student = student.id_student
    LEFT JOIN `group` ON student.id_group = `group`.id_group
    LEFT JOIN lesson ON mark.id_lesson = lesson.id_lesson
    LEFT JOIN subject ON lesson.id_subject = subject.id_subject
    SET mark.mark = mark.mark + 1
    WHERE `group`.speciality = 'ИВТ' AND subject.title = 'базы данных' AND mark.mark < 5 AND mark.date < '2017-05-12';
    