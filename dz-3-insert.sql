INSERT INTO "Исполнитель"
VALUES
	('Кипелов', 'Валерий Кипелов'),
	('Ляпис Трубецкой', 'Ляпис Трубецкой'),
	('Scorpions', 'Рудольф Генрих'),
	('Филип Киркоров', 'Филип Киркоров');
INSERT INTO "Жанр" ("Название_жанра")
VALUES ('Рок'), ('Поп'), ('Зарубежный Рок'),('Фолк');
INSERT INTO "Жанры_Исполнителя" 
VALUES
( 
	(SELECT "Жанр_ИД" FROM "Жанр" WHERE "Название_жанра" = 'Рок'),
	(SELECT "Исполнитель_ИД" FROM "Исполнитель" WHERE Исполнитель_ИД = 'Кипелов')
),	
(	
	(SELECT "Жанр_ИД" FROM "Жанр" WHERE "Название_жанра" = 'Поп'),
	(SELECT "Исполнитель_ИД" FROM "Исполнитель" WHERE Исполнитель_ИД = 'Филип Киркоров')	
),
(	
	(SELECT "Жанр_ИД" FROM "Жанр" WHERE "Название_жанра" = 'Зарубежный Рок'),
	(SELECT "Исполнитель_ИД" FROM "Исполнитель" WHERE Исполнитель_ИД = 'Scorpions')	
),
(	
	(SELECT "Жанр_ИД" FROM "Жанр" WHERE "Название_жанра" = 'Рок'),
	(SELECT "Исполнитель_ИД" FROM "Исполнитель" WHERE Исполнитель_ИД = 'Ляпис Трубецкой')	
);
INSERT INTO "Альбом" ("Название альбома", "Год_выпуска")
VALUES
(
	'Путь наверх', '2003-03-20'),
(
	'Небо и земля', '1991-06-18'),
(
	'Красота', '1999-11-01'),
(
	'Капитал', '2007-09-09'),
(	'Crazy World', '1990-08-01');
INSERT INTO "Исполнители_альбома" 
VALUES
( 
	(SELECT "Исполнитель_ИД" FROM "Исполнитель" WHERE "Исполнитель_ИД" = 'Кипелов'),
	(SELECT "Альбом_ИД" FROM "Альбом" WHERE "Название альбома" = 'Путь наверх')
),
( 
	(SELECT "Исполнитель_ИД" FROM "Исполнитель" WHERE "Исполнитель_ИД" = 'Филип Киркоров'),
	(SELECT "Альбом_ИД" FROM "Альбом" WHERE "Название альбома" = 'Небо и земля')
),
( 
	(SELECT "Исполнитель_ИД" FROM "Исполнитель" WHERE "Исполнитель_ИД" = 'Ляпис Трубецкой'),
	(SELECT "Альбом_ИД" FROM "Альбом" WHERE "Название альбома" = 'Красота')
),
( 
	(SELECT "Исполнитель_ИД" FROM "Исполнитель" WHERE "Исполнитель_ИД" = 'Ляпис Трубецкой'),
	(SELECT "Альбом_ИД" FROM "Альбом" WHERE "Название альбома" = 'Капитал')
),
( 
	(SELECT "Исполнитель_ИД" FROM "Исполнитель" WHERE "Исполнитель_ИД" = 'Scorpions'),
	(SELECT "Альбом_ИД" FROM "Альбом" WHERE "Название альбома" = 'Crazy World')
);
INSERT INTO "Трек" ("Название", "Длительность", "Альбом_ИД") 
VALUES
( 
	'Путь наверх', '04:05:06',
	(SELECT "Альбом_ИД" FROM "Альбом" WHERE "Название альбома" = 'Путь наверх')
),
( 
	'Я свободен', '00:05:20',
	(SELECT "Альбом_ИД" FROM "Альбом" WHERE "Название альбома" = 'Путь наверх')
),
( 
	'Моя зайка', '00:02:54',
	(SELECT "Альбом_ИД" FROM "Альбом" WHERE "Название альбома" = 'Небо и земля')
),
( 
	'Капитал', '00:03:44',
	(SELECT "Альбом_ИД" FROM "Альбом" WHERE "Название альбома" = 'Капитал')
),
( 
	'Снеговик', '00:02:30',
	(SELECT "Альбом_ИД" FROM "Альбом" WHERE "Название альбома" = 'Красота')
),
( 
	'Wind Of Change', '00:05:11',
	(SELECT "Альбом_ИД" FROM "Альбом" WHERE "Название альбома" = 'Crazy World')
);
INSERT INTO "Сборник" ("Название_сборника", "Год")
VALUES
(
	'Heavy Metal', '2004-04-22'),
(	
	'Концерт на первом', '2000-12-30'),
(
	'Нашествие', '2006-07-25'),
(
	'Лучший Рок', '2008-02-02'),
(	
	'Олимпийский', '2010-05-04');
INSERT INTO "Трек_Сборник" 
VALUES
( 
	(SELECT "Название" FROM "Трек" WHERE "Название" = 'Я свободен'),
	(SELECT "Сборник_ИД" FROM "Сборник" WHERE "Название_сборника" = 'Концерт на первом')
),
( 
	(SELECT "Название" FROM "Трек" WHERE "Название" = 'Путь наверх'),
	(SELECT "Сборник_ИД" FROM "Сборник" WHERE "Название_сборника" = 'Heavy Metal')
),
( 
	(SELECT "Название" FROM "Трек" WHERE "Название" = 'Путь наверх'),
	(SELECT "Сборник_ИД" FROM "Сборник" WHERE "Название_сборника" = 'Нашествие')
),
( 
	(SELECT "Название" FROM "Трек" WHERE "Название" = 'Моя зайка'),
	(SELECT "Сборник_ИД" FROM "Сборник" WHERE "Название_сборника" = 'Концерт на первом')
),
( 
	(SELECT "Название" FROM "Трек" WHERE "Название" = 'Снеговик'),
	(SELECT "Сборник_ИД" FROM "Сборник" WHERE "Название_сборника" = 'Нашествие')
),
( 
	(SELECT "Название" FROM "Трек" WHERE "Название" = 'Я свободен'),
	(SELECT "Сборник_ИД" FROM "Сборник" WHERE "Название_сборника" = 'Нашествие')
),
( 
	(SELECT "Название" FROM "Трек" WHERE "Название" = 'Wind Of Change'),
	(SELECT "Сборник_ИД" FROM "Сборник" WHERE "Название_сборника" = 'Олимпийский')
),
( 
	(SELECT "Название" FROM "Трек" WHERE "Название" = 'Wind Of Change'),
	(SELECT "Сборник_ИД" FROM "Сборник" WHERE "Название_сборника" = 'Лучший Рок')
),
( 
	(SELECT "Название" FROM "Трек" WHERE "Название" = 'Капитал'),
	(SELECT "Сборник_ИД" FROM "Сборник" WHERE "Название_сборника" = 'Лучший Рок')
),
( 
	(SELECT "Название" FROM "Трек" WHERE "Название" = 'Путь наверх'),
	(SELECT "Сборник_ИД" FROM "Сборник" WHERE "Название_сборника" = 'Лучший Рок')
);




