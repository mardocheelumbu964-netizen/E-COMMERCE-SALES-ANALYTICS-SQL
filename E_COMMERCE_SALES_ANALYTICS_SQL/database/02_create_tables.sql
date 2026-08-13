USE ecommerce_analytics;

CREATE TABLE customers (
 customer_id INT AUTO_INCREMENT PRIMARY KEY,
 first_name VARCHAR(50) NOT NULL,
 last_name VARCHAR(50) NOT NULL,
 email VARCHAR(120) UNIQUE NOT NULL,
 phone VARCHAR(20), city VARCHAR(80), state VARCHAR(80),
 country VARCHAR(80) DEFAULT 'India',
 registration_date DATE NOT NULL,
 customer_status VARCHAR(20) DEFAULT 'Active'
);

CREATE TABLE categories (
 category_id INT AUTO_INCREMENT PRIMARY KEY,
 category_name VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE products (
 product_id INT AUTO_INCREMENT PRIMARY KEY,
 product_name VARCHAR(150) NOT NULL,
 category_id INT NOT NULL,
 brand VARCHAR(100),
 unit_price DECIMAL(12,2) NOT NULL,
 cost_price DECIMAL(12,2) NOT NULL,
 stock_quantity INT DEFAULT 0,
 rating DECIMAL(3,2) DEFAULT 0,
 product_status VARCHAR(20) DEFAULT 'Active',
 FOREIGN KEY (category_id) REFERENCES categories(category_id)
);

CREATE TABLE orders (
 order_id INT AUTO_INCREMENT PRIMARY KEY,
 customer_id INT NOT NULL,
 order_date DATE NOT NULL,
 order_status VARCHAR(30) DEFAULT 'Pending',
 shipping_city VARCHAR(80),
 shipping_state VARCHAR(80),
 total_amount DECIMAL(12,2) DEFAULT 0,
 FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE order_items (
 order_item_id INT AUTO_INCREMENT PRIMARY KEY,
 order_id INT NOT NULL,
 product_id INT NOT NULL,
 quantity INT NOT NULL,
 unit_price DECIMAL(12,2) NOT NULL,
 discount_amount DECIMAL(12,2) DEFAULT 0,
 FOREIGN KEY (order_id) REFERENCES orders(order_id),
 FOREIGN KEY (product_id) REFERENCES products(product_id)
);

CREATE TABLE payments (
 payment_id INT AUTO_INCREMENT PRIMARY KEY,
 order_id INT NOT NULL,
 payment_date DATE,
 payment_method VARCHAR(30),
 amount DECIMAL(12,2),
 payment_status VARCHAR(30) DEFAULT 'Paid',
 FOREIGN KEY (order_id) REFERENCES orders(order_id)
);

CREATE TABLE shipping (
 shipping_id INT AUTO_INCREMENT PRIMARY KEY,
 order_id INT NOT NULL,
 courier VARCHAR(80),
 shipping_date DATE,
 expected_delivery DATE,
 actual_delivery DATE,
 shipping_status VARCHAR(30),
 FOREIGN KEY (order_id) REFERENCES orders(order_id)
);

CREATE TABLE discounts (
 discount_id INT AUTO_INCREMENT PRIMARY KEY,
 product_id INT,
 discount_code VARCHAR(50) UNIQUE,
 discount_percent DECIMAL(5,2),
 start_date DATE, end_date DATE,
 active BOOLEAN DEFAULT TRUE,
 FOREIGN KEY (product_id) REFERENCES products(product_id)
);

CREATE TABLE reviews (
 review_id INT AUTO_INCREMENT PRIMARY KEY,
 customer_id INT NOT NULL,
 product_id INT NOT NULL,
 review_date DATE,
 rating INT,
 review_text VARCHAR(500),
 FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
 FOREIGN KEY (product_id) REFERENCES products(product_id)
);
