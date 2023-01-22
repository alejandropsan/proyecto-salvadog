CREATE DATABASE IF NOT EXISTS salvadog;
USE salvadog;

CREATE TABLE IF NOT EXISTS users(
    id SERIAL,
    name VARCHAR(50) NOT NULL,
    surname VARCHAR(50),
    nick VARCHAR(30),
    address VARCHAR(100),
    country VARCHAR(30),
    email VARCHAR(30) NOT NULL,
    password VARCHAR(20) NOT NULL,
    image VARCHAR(100),
    id_role INT,
    created_at DATETIME,
    updated_at DATETIME
)ENGINE="InnoDb";

CREATE TABLE IF NOT EXISTS role_users(
    id INT  PRIMARY KEY auto_increment NOT NULL,
    type VARCHAR(30),
    permissions VARCHAR(30)
)ENGINE="InnoDb";

CREATE TABLE IF NOT EXISTS animals(
    id INT PRIMARY KEY auto_increment NOT NULL,
    name VARCHAR(30),
    age TINYINT,
    chip BOOLEAN,
    description VARCHAR(100),
    image VARCHAR(100),
    id_type INT,
    id_users INT,
    created_at DATETIME,
    updated_at DATETIME
)ENGINE="InnoDb";

CREATE TABLE IF NOT EXISTS animals_type(
    id INT PRIMARY KEY auto_increment NOT NULL,
    color VARCHAR(15),
    type VARCHAR(30),
    country VARCHAR(30),
    created_at DATETIME,
    updated_at DATETIME
)ENGINE="InnoDb";

CREATE TABLE IF NOT EXISTS complaints(
    id INT PRIMARY KEY auto_increment NOT NULL,
    date_pub DATE,
    country VARCHAR(30),
    description VARCHAR(100),
    image VARCHAR(100),
    id_animal INT,
    created_at DATETIME,
    updated_at DATETIME
)ENGINE="InnoDb";

CREATE TABLE IF NOT EXISTS donations(
    id INT PRIMARY KEY auto_increment NOT NULL,
    amount NUMERIC(7,2),
    description VARCHAR(100),
    id_animal INT,
    id_user BIGINT unsigned,
    created_at DATETIME,
    updated_at DATETIME
)ENGINE="InnoDb";

CREATE TABLE IF NOT EXISTS blog(
    id INT PRIMARY KEY auto_increment NOT NULL,
    date_pub DATE,
    description VARCHAR(100),
    image VARCHAR(100),
    id_user BIGINT unsigned,
    created_at DATETIME,
    updated_at DATETIME
)ENGINE="InnoDb";




-- CONSTRAINT TABLES
-- USERS
ALTER TABLE ONLY users
ADD CONSTRAINT pk_users PRIMARY KEY(id)
ALTER TABLE ONLY users
    ADD fk_users_role FOREIGN KEY (id_role) REFERENCES role_users(id);

-- ROLE_USERS
ALTER TABLE ONLY role_users
    ADD CONSTRAINT pk_role_users PRIMARY KEY(id)

-- ANIMALS
ALTER TABLE animals
    ADD CONSTRAINT fk_animals_type FOREIGN KEY(id_type) REFERENCES animals_type(id);

-- ANIMALS_TYPE

-- BLOG
ALTER TABLE blog
    ADD CONSTRAINT fk_blog_user FOREIGN KEY(id_user) REFERENCES users(id);

-- DONATIONS
ALTER TABLE donations
    ADD CONSTRAINT fk_donations_animal FOREIGN KEY(id_animal) REFERENCES animals(id);
ALTER TABLE donations
    ADD CONSTRAINT fk_donations_user FOREIGN KEY(id_user) REFERENCES users(id);

-- COMPLAINTS
ALTER TABLE complaints
    ADD CONSTRAINT fk_complaints_animal FOREIGN KEY(id_animal) REFERENCES animals(id);





-- INSERTS

-- ROLE_USERS
INSERT INTO role_users (type, permissions) VALUES ('ADMIN', 'CRUD');
INSERT INTO role_users (type, permissions) VALUES ('EMPLOYEE', 'EDIT, READ, WRITE');
INSERT INTO role_users (type, permissions) VALUES ('CUSTOMER', 'READ, WRITE');
INSERT INTO role_users (type, permissions) VALUES ('GUEST', 'READ');


-- USERS
INSERT INTO users (name, surname, nick, address, country, email, password, image, id_role)
VALUES('Admin', 'admin', 'superadmin', 'calle Goya, 22, Novelda', 'Spain', 'admin@salvadog.com', 'admin', 'admin.jpg', 1);
INSERT INTO users (name, surname, nick, address, country, email, password, image, id_role)
VALUES('Alfred', 'Castañeda', 'Alfredito', 'Avenida Gran Vía, 112, Madrid', 'Spain', 'alfredo@salvadog.com', 'alfredo111', 'alfredopost.jpg', 2);
INSERT INTO users (name, surname, nick, address, country, email, password, image, id_role)
VALUES('Noelia', 'Morán', 'laNoe69', 'calle Venezuela, 2, Alicante', 'Spain', 'lanoe@gmail.com', 'noenoe', 'elsabado.jpg', 3);
INSERT INTO users (name, surname, nick, address, country, email, password, image, id_role)
VALUES('Alessandro', 'Sánchez', 'SUSSO', 'calle Encarnita Polo, 32, Elche', 'Spain', 'suso1234@gmail.com', 'elsusothebest', 'postureo.jpg', 4);
INSERT INTO users (name, surname, nick, address, country, email, password, image, id_role)
VALUES('Azucena', 'Careia', 'la_Azu', 'calle del Martillo, 123, Badajoz', 'Spain', 'azucenacareia@gmail.com', '1234', 'post1234.jpg', 3);
INSERT INTO users (name, surname, nick, address, country, email, password, image, id_role)
VALUES('Ernesto', 'Jiménez', 'nestor', 'Avenida Orihuela, 45, Alicante', 'Spain', 'nestorestor@gmail.com', '55556666', 'flight44.jpg', 3);
INSERT INTO users (name, surname, nick, address, country, email, password, image, id_role)
VALUES('Amanda', 'Oriol', 'la_chiqui', 'calle Esparta, 54, Barcelona', 'Spain', 'amandalamanda@gmail.com', '9988', 'michurri.jpg', 3);
INSERT INTO users (name, surname, nick, address, country, email, password, image, id_role)
VALUES('Justiniana', 'Alférez', 'Justi', 'calle Alcoba, 33, Sevilla', 'Spain', 'justiniana667@gmail.com', 'jusjus', 'selphi23.jpg', 3);

UPDATE users SET created_at = CURDATE() WHERE id = 1;
UPDATE users SET created_at = CURDATE() WHERE id = 2;
UPDATE users SET created_at = CURDATE() WHERE id = 3;
UPDATE users SET created_at = CURDATE() WHERE id = 4;
UPDATE users SET created_at = CURDATE() WHERE id = 5;
UPDATE users SET created_at = CURDATE() WHERE id = 6;
UPDATE users SET created_at = CURDATE() WHERE id = 7;
UPDATE users SET created_at = CURDATE() WHERE id = 8;
UPDATE users SET updated_at = CURDATE() WHERE id = 1;
UPDATE users SET updated_at = CURDATE() WHERE id = 2;
UPDATE users SET updated_at = CURDATE() WHERE id = 3;
UPDATE users SET updated_at = CURDATE() WHERE id = 4;
UPDATE users SET updated_at = CURDATE() WHERE id = 5;
UPDATE users SET updated_at = CURDATE() WHERE id = 6;
UPDATE users SET updated_at = CURDATE() WHERE id = 7;
UPDATE users SET updated_at = CURDATE() WHERE id = 8;



-- ANIMALS_TYPE
INSERT INTO animals_type (color, type, country)
VALUES ("marrón", "perro", "Spain");
INSERT INTO animals_type (color, type, country)
VALUES ("negro", "perro", "Spain");
INSERT INTO animals_type (color, type, country)
VALUES ("blanco y marrón", "gato", "Spain");
INSERT INTO animals_type (color, type, country)
VALUES ("grises", "gatos", "Spain");
INSERT INTO animals_type (color, type, country)
VALUES ("negro", "perro", "Spain");
INSERT INTO animals_type (color, type, country)
VALUES ("blanco y negro", "perro", "Spain");

-- ANIMALS
INSERT INTO animals (name, age, chip, description, image, id_type, id_users, created_at, updated_at)
VALUES ("Koko", 3, TRUE, "Perro muy bueno y tranquilo", "kokodurmiendo.jpg", 1, 3, CURDATE(), CURDATE());
INSERT INTO animals (name, age, chip, description, image, id_type, id_users)
VALUES ("Lula", 1, TRUE, "Perrito abandonado fosterrier", "fddfd33.jpg", 2, 3);
INSERT INTO animals (name, age, chip, description, image, id_type, id_users)
VALUES ("Shiva", 1, TRUE, "Gato abandonado pero muy sociable", "shivabonita.jpg", 3, 4);
INSERT INTO animals (name, age, chip, description, image, id_type, id_users)
VALUES ("Rocky y Monty", 5, TRUE, "Gatos hermanos que han quedado abandonados", "ssdd233.jpg", 4, 5);
INSERT INTO animals (name, age, chip, description, image, id_type, id_users)
VALUES ("Tyson", 2, TRUE, "Perro encantador, muy bueno y tranquilo", "232323fff.jpg", 5, 6);
INSERT INTO animals (name, age, chip, description, image, id_type, id_users)
VALUES ("Goku", 0, TRUE, "Perro recién nacido que no tiene familia", "perritobonito01.jpg", 6, 7);

UPDATE animals SET created_at = CURDATE() WHERE id = 3;
UPDATE animals SET created_at = CURDATE() WHERE id = 4;
UPDATE animals SET created_at = CURDATE() WHERE id = 5;
UPDATE animals SET created_at = CURDATE() WHERE id = 6;
UPDATE animals SET updated_at = CURDATE() WHERE id = 3;
UPDATE animals SET updated_at = CURDATE() WHERE id = 4;
UPDATE animals SET updated_at = CURDATE() WHERE id = 5;
UPDATE animals SET updated_at = CURDATE() WHERE id = 2;


-- BLOG
INSERT INTO blog (date_pub, description, image, id_user, created_at, updated_at)
VALUES ('2023-01-22', 'Viaje a Santander con nuestros animalitos', 'fefdds33.jpg', 3, CURDATE(), CURDATE());
INSERT INTO blog (date_pub, description, image, id_user, created_at, updated_at)
VALUES ('2023-01-22', 'No paramos de recoger animales desvanecidos y abandonados', 'fffaasslas.jpg', 3, CURDATE(), CURDATE());
INSERT INTO blog (date_pub, description, image, id_user, created_at, updated_at)
VALUES ('2023-01-22', 'Nueva ley de protección animal', 'asocuass22.jpg', 1, CURDATE(), CURDATE());
INSERT INTO blog (date_pub, description, image, id_user, created_at, updated_at)
VALUES ('2023-01-22', 'No tienen vergüenza!! Necesitamos tu ayuda!!', 'salvalos.jpg', 1, CURDATE(), CURDATE());


-- DONATIONS
INSERT INTO donations (amount, description, id_animal, id_user, created_at, updated_at)
VALUES (100, "Donación para Koko", 1, 8, CURDATE(), CURDATE());

-- COMPLAINTS
id INT PRIMARY KEY auto_increment NOT NULL,
    date_pub DATE,
    country VARCHAR(30),
    description VARCHAR(100),
    image VARCHAR(100),
    id_animal INT,

INSERT INTO complaints (date_pub, country, description, image)
VALUES (CURDATE(), 'Spain', "Hemos encontrado una familia maltratadora", "aasscgfd.jpg");
