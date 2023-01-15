CREATE DATABASE IF NOT EXISTS salvadog;
USE salvadog;

CREATE TABLE IF NOT EXISTS users(
id          int auto_increment not null,
role        varchar(30),
name        varchar(50),
surname     varchar(100),
nick        varchar(50),
description varchar(255),
address     varchar(100),
country     varchar(50),
email       varchar(100),
password    varchar(50),
image       varchar(255),
created_at  datetime,
updated_at  datetime,
CONSTRAINT pk_users PRIMARY KEY(id)
)ENGINE="InnoDb";

CREATE TABLE IF NOT EXISTS partners(
id              int auto_increment not null,
user_id         int not null,
image_user_id   int not null,
name            varchar(50),
company         varchar(100),
address         varchar(100),
image           varchar(255),
type            varchar(30),
amount          int,
created_at      datetime,
updated_at      datetime,
CONSTRAINT pk_partners PRIMARY KEY(id),
CONSTRAINT fk_partners_users FOREIGN KEY(user_id) REFERENCES users(id)
)ENGINE="InnoDb";

CREATE TABLE IF NOT EXISTS animals(
id          int auto_increment not null,
type_id     int not null,
name        varchar(50),
age         tinyint,
chip        int
description varchar(255)
image       varchar(255)
created_at  datetime,
updated_at  datetime,
CONSTRAINT pk_animals PRIMARY KEY(id)
)ENGINE="InnoDb";

CREATE TABLE IF NOT EXISTS animal_type(
id          int auto_increment not null,
animal_id   int,
name        varchar(50),
type        varchar(50),
race        varchar(50),
origin      varchar(50),
country     varchar(50),
image       varchar(255),
created_at  datetime,
updated_at  datetime,
CONSTRAINT pk_animal_type PRIMARY KEY(id),
CONSTRAINT fk_animal_type_animals FOREIGN KEY(animal_id) REFERENCES animals(id)
)ENGINE="InnoDb";

CREATE TABLE IF NOT EXISTS adopters(
id              int auto_increment not null,
user_id         int not null,
animal_id       int not null,
image_user_id   int not null,
role_user       varchar(30),
description     varchar(255),
dni             int,
image           varchar(255),
amount          int,
created_at      datetime,
updated_at      datetime,
CONSTRAINT pk_adopters(id) PRIMARY KEY(id),
CONSTRAINT fk_adopters_users FOREIGN KEY(user_id) REFERENCES users(id),
CONSTRAINT fk_adopters_animals FOREIGN KEY(animal_id) REFERENCES animals(id),
CONSTRAINT fk_adopters_image_users FOREIGN KEY(image_user_id) REFERENCES users(image)
)ENGINE="InnoDb";

CREATE TABLE IF NOT EXISTS foster_house(
id                  int auto_increment not null,
adopter_id          int,
image_adopter_id    int,
animal_id           int,
donation_id         int,
name                varchar(50),
address             varchar(100),
country             varchar(50),
description         varchar(255),
image               varchar(255),
created_at          datetime,
updated_at          datetime,
CONSTRAINT pk_foster_house PRIMARY KEY(id),
CONSTRAINT fk_foster_house_adopters FOREIGN KEY(adopter_id) REFERENCES adopters(id),
CONSTRAINT fk_foster_house_image_adopters FOREIGN KEY(image_adopter_id) REFERENCES adopters(image),
CONSTRAINT fk_foster_house_animals FOREIGN KEY(animal_id) REFERENCES animals(id),
CONSTRAINT fk_foster_house_donations FOREIGN KEY(donation_id) REFERENCES donations(id)
)ENGINE="InnoDb";

CREATE TABLE IF NOT EXISTS notices(
id          int auto_increment not null,
animal_id  int,
date        date,
location    varchar(50),
description varchar(255),
content     text,
location    varchar(50),
image       varchar(255),
created_at  datetime,
updated_at  datetime,
CONSTRAINT pk_notices PRIMARY KEY(id),
CONSTRAINT fk_notices_animal FOREIGN KEY(animal_id) REFERENCES animals(id)
)ENGINE="InnoDb";

CREATE TABLE IF NOT EXISTS donations(
id             int auto_increment not null,
user_id        int,
partner_id     int,
adopter_id     int,
animal_id      int,
amount         int,
created_at     datetime,
updated_at     datetime,
CONSTRAINT pk_donations PRIMARY KEY(id),
CONSTRAINT fk_donations_users FOREIGN KEY(user_id) REFERENCES users(id),
CONSTRAINT fk_donations_partners FOREIGN KEY(partner_id) REFERENCES partners(id),
CONSTRAINT fk_donations_adopters FOREIGN KEY(adopter_id) REFERENCES adopters(id),
CONSTRAINT fk_donations_animals FOREIGN KEY(animal_id) REFERENCES animals(id)
)ENGINE="InnoDb";

CREATE TABLE IF NOT EXISTS blog(
id                  int auto_increment not null,
user_id             int,
image_user_id       int,
partner_id          int,
image_partner_id    int,
adopter_id          int,
foster_house_id     int,
date_pub            date,
description         text,
image               varchar(255),
created_at          datetime,
updated_at          datetime,
CONSTRAINT pk_blog PRIMARY KEY(id),
CONSTRAINT fk_blog_users FOREIGN KEY(user_id) REFERENCES users(id),
CONSTRAINT fk_blog_image_users FOREIGN KEY(image_user_id) REFERENCES users(image)
)ENGINE="InnoDb";
