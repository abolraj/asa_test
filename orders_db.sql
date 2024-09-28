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
    user_id INT NOT NULL,
    status enum('ordered','delivering','paid','delivered','cancelled'),
    ordered_at TIMESTAMP NOT NULL
);

/* orders products table */
CREATE table orders_products (
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    FOREGIN KEY(order_id) REFERENCES orders(id),
    FOREGIN KEY(product_id) REFERENCES product(id),
);


INSERT INTO products (`id`, `name`,`price`,`available_no`) VALUES 
(1, 'airpod', 12000, 10),
(2, 'play4', 10000, 10),
(3, 'redmi12', 12000, 10),
(4, 'bmw', 72000, 1),
(5, 'benz', 13000, 13),
(6, 'banana', 14000, 5),
(7, 'tomato', 156000, 6);

INSERT INTO orders (`id`,`status`, `ordered_at`) VALUES
(1 'ordered', '2020-10-21 12:30:23'),
(2, 'ordered', '2020-10-21 12:30:23'),
(3, 'ordered', '2020-10-21 12:30:23'),
(4, 'delivered', '2020-10-21 12:30:23'),
(5, 'paid', null),
(6, 'delivering', '2020-10-21 12:30:23'),
(7, 'delivering', '2020-10-21 12:30:23'),
(8, 'delivering', null),
(9, 'paid', '2020-10-21 12:30:23'),
(10, 'paid', '2020-10-21 12:30:23'),
(11, 'delivered', '2020-10-21 12:30:23'),
(12, 'delivered', null),
(13, 'delivered', '2020-10-21 12:30:23'),
(14, 'delivered', '2020-10-21 12:30:23'),
(15, 'cancelled', '2020-10-21 12:30:23'),
(16, 'cancelled', '2020-10-21 12:30:23'),
(17, 'cancelled', '2020-10-21 12:30:23'),
(18, 'cancelled', '2020-10-21 12:30:23'),
(19, 'cancelled', '2020-10-21 12:30:23'),
(20, 'cancelled', '2020-10-21 12:30:23');
