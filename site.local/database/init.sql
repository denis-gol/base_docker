

###########################
##   initiate database   ##
###########################

# USE cinema12;

## ----------------------- table CUSTOMERS ---------------------------
CREATE TABLE customers
(
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    phone VARCHAR(16) NULL,
    email VARCHAR(64) NULL,
    birth_date DATE NULL,
    date_reg DATE NULL
);

## ----------------------- table FILMS ---------------------------
CREATE TABLE films
(
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    genre VARCHAR(64) NOT NULL,
    director VARCHAR(64) NOT NULL,
    year year NOT NULL,
    duration INT NOT NULL
);

## ----------------------- table ROOMS ---------------------------
CREATE TABLE rooms
(
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    type VARCHAR(64) NOT NULL,
    is_children TINYINT(1) DEFAULT 0 NOT NULL
);

## ----------------------- table SESSIONS ---------------------------
CREATE TABLE sessions
(
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    film_id INT UNSIGNED NOT NULL,
    room_id INT UNSIGNED NOT NULL,
    time_start TIMESTAMP NOT NULL,
    duration INT NOT NULL
);

ALTER TABLE sessions ADD FOREIGN KEY (film_id)
    REFERENCES films(id) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE sessions ADD FOREIGN KEY (room_id)
    REFERENCES rooms(id) ON DELETE CASCADE ON UPDATE CASCADE;

## ----------------------- table SEATS ---------------------------
CREATE TABLE seats
(
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    room_id INT UNSIGNED NOT NULL,
    row INT NULL,
    seat INT NULL,
    CONSTRAINT seats_rooms_fk
        foreign key (room_id) references rooms (id)
            on update cascade on delete cascade
);

## ----------------------- table PRICE ---------------------------
CREATE TABLE prices
(
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    film_id INT UNSIGNED NOT NULL,
    room_id INT UNSIGNED NOT NULL,
    seat_id INT UNSIGNED NOT NULL,
    price INT NULL
);

ALTER TABLE prices ADD FOREIGN KEY (film_id)
    REFERENCES films(id) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE prices ADD FOREIGN KEY (room_id)
    REFERENCES rooms(id) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE prices ADD FOREIGN KEY (seat_id)
    REFERENCES seats(id) ON DELETE CASCADE ON UPDATE CASCADE;

## ----------------------- table TICKETS ---------------------------
CREATE TABLE tickets
(
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    customer_id INT UNSIGNED NOT NULL,
    session_id INT UNSIGNED NOT NULL,
    seat_id INT UNSIGNED NOT NULL,
    price_id INT UNSIGNED NULL,
    discount TINYINT NULL,
    date_purchase TIMESTAMP NULL,
    confirm_code INT NULL
);

ALTER TABLE tickets ADD FOREIGN KEY (customer_id)
    REFERENCES customers(id) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE tickets ADD FOREIGN KEY (session_id)
    REFERENCES sessions(id) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE tickets ADD FOREIGN KEY (seat_id)
    REFERENCES seats(id) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE tickets ADD FOREIGN KEY (price_id)
    REFERENCES prices(id) ON DELETE CASCADE ON UPDATE CASCADE;

