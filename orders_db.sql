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
    ordered_at TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id)
);

/* orders products table */
CREATE table orders_products (
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(id),
    FOREIGN KEY (product_id) REFERENCES products(id)
);


INSERT INTO products (`id`, `name`,`price`,`available_no`) VALUES 
(1, 'airpod', 12000, 10),
(2, 'play4', 10000, 10),
(3, 'redmi12', 12000, 10),
(4, 'bmw', 72000, 1),
(5, 'benz', 13000, 13),
(6, 'banana', 14000, 5),
(7, 'tomato', 156000, 6);

INSERT INTO orders (`id`, `user_id`, `status`, `ordered_at`) VALUES
(1, 1, 'ordered', '2020-10-21 12:30:23'),
(2, 1, 'ordered', '2020-10-21 12:30:23'),
(3, 1, null, '2020-10-21 12:30:23'),
(4, 1, 'delivered', '2020-10-21 12:30:23'),
(5, 1, 'paid', null),
(6, 1, 'delivering', '2020-10-21 12:30:23'),
(7, 1, 'delivering', '2020-10-21 12:30:23'),
(8, 1, 'delivering', null),
(9, 1, 'paid', '2020-10-21 12:30:23'),
(10, 1, 'paid', '2020-10-21 12:30:23'),
(11, 1, 'delivered', '2020-10-21 12:30:23'),
(12, 1, 'delivered', null),
(13, 1, null, '2020-10-21 12:30:23'),
(14, 1, 'delivered', '2020-10-21 12:30:23'),
(15, 1, 'cancelled', '2020-10-21 12:30:23'),
(16, 1, 'cancelled', '2020-10-21 12:30:23'),
(17, 1, 'cancelled', '2020-10-21 12:30:23'),
(18, 1, 'cancelled', '2020-10-21 12:30:23'),
(19, 1, 'cancelled', '2020-10-21 12:30:23'),
(20, 1, 'cancelled', '2020-10-21 12:30:23');

INSERT INTO orders_products (`order_id`,`product_id`) VALUES 
(1,2),
(1,3),
(1,4),
(2,2),
(3,5),
(4,5),
(5,2),
(6,6),
(7,6),
(7,6),
(8,2),
(1,7),
(1,2),
(9,7),
(20,7),
(10,7),
(10,2),
(11,4),
(12,4),
(12,3),
(12,3),
(15,3);

