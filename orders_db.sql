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
    ordered_at TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id)
);

/* orders statuses times */
CREATE TABLE orders_statuses (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    order_id INT NOT NULL,
    status enum('ordered','delivering','delivered','paid','cancelled'),
    is_active BOOLEAN NOT NULL,
    created_at TIMESTAMP,
    FOREIGN KEY (order_id) REFERENCES orders(id)
);

/* orders products table */
CREATE table orders_products (
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(id),
    FOREIGN KEY (product_id) REFERENCES products(id)
);


INSERT INTO users (`name`,`username`,`password`) VALUES
('Abolfazl', 'abolfazl', '202cb962ac59075b964b07152d234b70'),
('Ali', 'ali', '202cb962ac59075b964b07152d234b70'),
('Abbas', 'abbas', '202cb962ac59075b964b07152d234b70'),
('Mohammad', 'mohammad', '202cb962ac59075b964b07152d234b70'),
('Jabbar', 'jabbar', '202cb962ac59075b964b07152d234b70'),
('Naghi', 'naghi', '202cb962ac59075b964b07152d234b70'),
('Sina', 'sina', '202cb962ac59075b964b07152d234b70'),
('Sara', 'sara', '202cb962ac59075b964b07152d234b70'),
('Saba', 'saba', '202cb962ac59075b964b07152d234b70'),
('Jam', 'jar', '202cb962ac59075b964b07152d234b70');


INSERT INTO products (`id`, `name`,`price`,`available_no`) VALUES 
(1, 'airpod', 12000, 10),
(2, 'play4', 10000, 10),
(3, 'redmi12', 12000, 10),
(4, 'bmw', 72000, 1),
(5, 'benz', 13000, 13),
(6, 'banana', 14000, 5),
(7, 'tomato', 156000, 6);

INSERT INTO orders (`id`, `user_id`, `ordered_at`) VALUES
(1, 1, '2020-10-21 12:30:23'),
(2, 2, '2020-10-21 12:30:23'),
(3, 2, '2020-10-21 12:30:23'),
(4, 3, '2020-10-21 12:30:23'),
(5, 4, null),
(6, 4, '2020-10-21 12:30:23'),
(7, 5, '2020-10-21 12:30:23'),
(8, 6, null),
(9, 7, '2020-10-21 12:30:23'),
(10, 8, '2020-10-21 12:30:23'),
(11, 9, '2020-10-21 12:30:23'),
(12, 9, null),
(13, 8, '2020-10-21 12:30:23'),
(14, 7, '2020-10-21 12:30:23'),
(15, 10, '2020-10-21 12:30:23'),
(16, 9, '2020-10-21 12:30:23'),
(17, 8, '2020-10-21 12:30:23'),
(18, 7, '2020-10-21 12:30:23'),
(19, 6, '2020-10-21 12:30:23'),
(20, 5, '2020-10-21 12:30:23');

INSERT INTO orders_statuses (`id`, `order_id`, `is_active`, `status`, `created_at`) VALUES
(1,   1, 0, 'ordered', '2024-01-01 10:00:00'),
(21,  1, 1, 'delivering', '2024-01-21 10:00:00'),
(2,   2, 0, 'ordered', '2024-01-02 11:00:00'),
(24,  2, 0, 'delivering', '2024-01-24 13:00:00'),
(22,  2, 1, 'delivered', '2024-01-22 11:00:00'),
(3,   3, 0, 'ordered', null),
(23,  3, 0, 'delivering', null),
(230, 3, 1, 'delivered', '2024-01-23 12:00:00'),
(4,   4, 0, 'ordered', '2024-01-04 13:00:00'),
(5,   4, 0,  'delivering', '2024-01-05 14:00:00'),
(6,   4, 0, 'delivered', '2024-01-06 15:00:00'),
(7,   4, 1, 'paid', '2024-01-07 16:00:00'),
(8,   5, 0, 'ordered', '2024-01-08 17:00:00'),
(25,  5, 1, 'delivering', null),
(26,  6, 1, 'ordered', '2024-01-26 15:00:00'),
(27,  7, 1, 'ordered', '2024-01-27 16:00:00'),
(28,  8, 1, 'ordered', '2024-01-28 17:00:00'),
(29,  9, 0, 'delivering', null),
(9,   9, 1, 'ordered', '2024-01-09 18:00:00'),
(10, 10, 0, 'ordered', '2024-01-10 19:00:00'),
(30, 10, 0, 'delivering', '2024-01-30 19:00:00'),
(31, 10, 1, 'delivered', null),
(11, 11, 1, 'ordered', '2024-01-11 10:00:00'),
(12, 12, 0, 'ordered', null),
(32, 12, 1, 'delivering', '2024-02-01 11:00:00'),
(13, 13, 0, 'ordered', '2024-01-13 12:00:00'),
(33, 13, 1, 'delivering', '2024-02-02 12:00:00'),
(14, 14, 0, 'ordered', '2024-01-14 13:00:00'),
(34, 14, 1, 'delivering', '2024-02-03 13:00:00'),
(15, 15, 0, 'ordered', '2024-01-15 14:00:00'),
(35, 15, 1, 'delivering', null),
(16, 16, 0, 'ordered', '2024-01-16 15:00:00'),
(36, 16, 1, 'delivering', '2024-02-05 15:00:00'),
(17, 17, 0, 'ordered', '2024-01-17 16:00:00'),
(37, 17, 1, 'delivering', '2024-02-06 16:00:00'),
(18, 18, 0, 'ordered', '2024-01-18 17:00:00'),
(38, 18, 1, 'delivering', '2024-02-07 17:00:00'),
(19, 19, 0, 'ordered', '2024-01-19 18:00:00'),
(39, 19, 1, 'delivering', '2024-02-08 18:00:00'),
(20, 20, 0, 'ordered', '2024-01-20 19:00:00'),
(40, 20, 1, 'delivering', '2024-02-09 19:00:00');

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

/* Undone orders */
SELECT DISTINCT order_id FROM orders_statuses WHERE is_active AND status NOT IN ('paid','cancelled');

/* Null time for status */
SELECT DISTINCT order_id FROM orders_statuses WHERE is_active AND created_at IS NULL;

/* Orders with more than one product */
SELECT order_id FROM orders_products GROUP BY order_id HAVING count(product_id)>1;