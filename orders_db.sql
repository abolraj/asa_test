/* users table */
CREATE table users (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50),
    username VARCHAR(50) NOT NULL unique,
    password VARCHAR(32) NOT NULL
);

/* products table */
CREATE table products (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50),
    price BIGINT NOT NULL,
    available_no INT NOT NULL
);

/* orders table */
CREATE table orders (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    product_id INT NOT NULL,
    user_id INT NOT NULL,
    status enum('ordered','delivering','paid','delivered','cancelled'),
    ordered_at TIMESTAMP NOT NULL
);

INSERT INTO products (`id`, `name`,`price`,`available_no`) VALUES 
(1, 'airpod', 12000, 10),
(2, 'play4', 10000, 10),
(3, 'redmi12', 12000, 10),
(4, 'bmw', 72000, 1),
(5, 'benz', 13000, 13),
(6, 'banana', 14000, 5),
(7, 'tomato', 156000, 6);
