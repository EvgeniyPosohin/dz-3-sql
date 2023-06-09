--1
SELECT "Название", "Длительность" FROM "Трек"
WHERE "Длительность" = 
	(SELECT MAX("Длительность") FROM "Трек");
--2
SELECT "Название" FROM "Трек"
WHERE "Длительность" >= '00:03:30';
--3 изменил запрос под данные
SELECT "Название_сборника"  FROM "Сборник"
WHERE "Год" BETWEEN '2008-01-01' AND  '2010-12-31';
--4 
SELECT "Исполнитель_ИД"  FROM "Исполнитель"
WHERE "Исполнитель_ИД" NOT LIKE '% %';
--5 
SELECT "Название"  FROM "Трек"
WHERE 'моя' = ANY (string_to_array(lower("Название"), ' ')) ;
--задание 3 
 --1
SELECT "Название_жанра"  , count("Исполнитель_ИД") ii FROM "Жанр" j
LEFT JOIN "Жанры_Исполнителя" ji ON j."Жанр_ИД" = ji."Жанр_ИД" 
GROUP BY j."Название_жанра";
--2 указал другой промежуток
SELECT count("Название") FROM "Альбом" i
JOIN "Трек" t ON t."Альбом_ИД" = i."Альбом_ИД" 
WHERE "Год_выпуска" BETWEEN '1990-01-01' AND  '1999-12-31';
 --3
SELECT  AVG("Длительность"), "Название альбома" FROM "Альбом" i
JOIN "Трек" t ON t."Альбом_ИД" = i."Альбом_ИД" 
GROUP BY i."Название альбома";
--4
SELECT "Исполнитель_ИД"  FROM "Исполнители_альбома" ia
JOIN "Альбом" a ON a."Альбом_ИД" = ia."Альбом_ИД" 
WHERE "Исполнитель_ИД" NOT IN (
	SELECT "Исполнитель_ИД"  FROM "Исполнители_альбома" ia
	JOIN "Альбом" a ON a."Альбом_ИД" = ia."Альбом_ИД" 
	WHERE "Год_выпуска" BETWEEN '2007-01-01' AND  '2007-12-31')
GROUP BY ia."Исполнитель_ИД";
--5
SELECT "Название_сборника"  FROM "Исполнители_альбома" ia
JOIN "Альбом" a ON a."Альбом_ИД" = ia."Альбом_ИД" 
JOIN "Трек" t ON a."Альбом_ИД" = t."Альбом_ИД" 
JOIN "Трек_Сборник" ts ON ts."Название" = t."Название"
JOIN "Сборник" sb ON sb."Сборник_ИД" = ts."Сборник_ИД"
WHERE "Исполнитель_ИД"='Ляпис Трубецкой'
GROUP BY sb."Название_сборника";