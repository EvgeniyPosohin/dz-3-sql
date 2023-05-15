CREATE TABLE IF NOT EXISTS "Исполнитель"(
	 "Исполнитель_ИД" VARCHAR(80) PRIMARY KEY,
	 "Имя" VARCHAR(80) NOT NULL);
CREATE TABLE IF NOT EXISTS "Жанр"(
	"Жанр_ИД" SERIAL PRIMARY KEY,
	"Название_жанра" VARCHAR(80) NOT NULL UNIQUE);
CREATE TABLE IF NOT EXISTS "Жанры_Исполнителя"(
	"Жанр_ИД" SERIAL REFERENCES "Жанр"("Жанр_ИД"),
	"Исполнитель_ИД" VARCHAR(80) REFERENCES "Исполнитель"("Исполнитель_ИД"),
	CONSTRAINT pk PRIMARY KEY("Жанр_ИД", "Исполнитель_ИД"));
CREATE  TABLE IF NOT EXISTS "Альбом"(
	"Альбом_ИД" SERIAL PRIMARY KEY,
	"Название альбома" VARCHAR(80) NOT NULL,
	"Год_выпуска" date  NOT NULL );
CREATE TABLE IF NOT EXISTS "Исполнители_альбома"(	
	"Исполнитель_ИД" VARCHAR(80) REFERENCES "Исполнитель"("Исполнитель_ИД"),
	"Альбом_ИД" SERIAL REFERENCES "Альбом"("Альбом_ИД"),
	CONSTRAINT pk2 PRIMARY KEY("Исполнитель_ИД", "Альбом_ИД"));
CREATE TABLE IF NOT EXISTS "Трек"(	
	"Название" VARCHAR(80) NOT NULL PRIMARY KEY,
	"Длительность" time   NOT NULL ,
	"Альбом_ИД" SERIAL REFERENCES "Альбом"("Альбом_ИД")
	);
CREATE TABLE IF NOT EXISTS "Сборник"(
	"Сборник_ИД" SERIAL PRIMARY KEY,
	"Название_сборника" VARCHAR(80) NOT NULL,
	"Год" date NOT NULL);
CREATE TABLE IF NOT EXISTS "Трек_Сборник"(	
	"Название"  VARCHAR(80) REFERENCES "Трек"("Название"),
	"Сборник_ИД" SERIAL REFERENCES "Сборник"("Сборник_ИД"),
	PRIMARY KEY ("Название", "Сборник_ИД") );