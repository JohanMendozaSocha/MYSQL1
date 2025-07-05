CREATE DATABASE delivery_db;
USE delivery_db;

CREATE TABLE users (
    id INT PRIMARY KEY,
    names VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(20),
   addres VARCHAR(225) NOT NULL
);

CREATE TABLE restaurant(
id Int primary KEY auto_increment,
name VARCHAR(100) NOT NULL,
email VARCHAR(100) UNIQUE NOT NULL,
phone VARCHAR(20),
addres VARCHAR(255) NOT NULL
);

CREATE TABLE products(
 id INT PRIMARY KEY AUTO_INCREMENT,
 restaurant_id INT NOT NULL,
 name VARCHAR (100)NOT NULL,
 description TEXT,
 price DECIMAL (10,2) NOT NULL,
 FOREIGN KEY (restaurant_id)references restaurant(id)
);

CREATE TABLE orders (
 ID int primary key auto_increment,
 user_id INT NOT NULL,
 restaurant_id INT NOT NULL,
 date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
 status VARCHAR(50) DEFAULT 'Pendiente', -- Ej: pendiente, En camino, Entregado, Cancelado
 FOREIGN KEY (user_id) REFERENCES user(id),
 FOREIGN KEY (product_id) REFERENCES product(id)
 );
 
 CREATE TABLE order_details(
 id INT PRIMARY KEY AUTO_INCREMENT,
 order_id INT NOT NULL,
 product_id INT NOT NULL,
 quantity INT NOT NULL,
 unitary_price DECIMAL(10,2) NOT NULL,
 FOREIGN KEY (order_id) REFERENCES orders(id),
 FOREIGN KEY (product_id) REFERENCES products(id)
 );
 
