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
