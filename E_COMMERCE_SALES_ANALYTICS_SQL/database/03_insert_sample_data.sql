USE ecommerce_analytics;

INSERT INTO customers(first_name,last_name,email,phone,city,state,registration_date) VALUES
('Arun','Kumar','arun@gmail.com','9000000001','Bangalore','Karnataka','2024-01-10'),
('Priya','Sharma','priya@gmail.com','9000000002','Mysore','Karnataka','2024-02-15'),
('Rahul','Verma','rahul@gmail.com','9000000003','Chennai','Tamil Nadu','2024-03-20'),
('Sneha','Patel','sneha@gmail.com','9000000004','Hyderabad','Telangana','2024-04-12'),
('Vikram','Rao','vikram@gmail.com','9000000005','Pune','Maharashtra','2024-05-18'),
('Anjali','Mehta','anjali@gmail.com','9000000006','Bangalore','Karnataka','2024-06-05'),
('David','Wilson','david@gmail.com','9000000007','Mumbai','Maharashtra','2024-07-21'),
('Sarah','Johnson','sarah@gmail.com','9000000008','Delhi','Delhi','2024-08-09'),
('Daniel','Lee','daniel@gmail.com','9000000009','Kochi','Kerala','2024-09-14'),
('Olivia','White','olivia@gmail.com','9000000010','Bangalore','Karnataka','2024-10-01'),
('James','Hall','james@gmail.com','9000000011','Chennai','Tamil Nadu','2024-10-18'),
('Sophia','Allen','sophia@gmail.com','9000000012','Pune','Maharashtra','2024-11-07'),
('Michael','Brown','michael@gmail.com','9000000013','Hyderabad','Telangana','2024-11-22'),
('Emily','Davis','emily@gmail.com','9000000014','Bangalore','Karnataka','2025-01-03'),
('John','Smith','john@gmail.com','9000000015','Mumbai','Maharashtra','2025-01-20');

INSERT INTO categories(category_name) VALUES
('Electronics'),('Computers'),('Mobile Accessories'),('Home Appliances'),('Fashion'),('Beauty'),('Sports');

INSERT INTO products(product_name,category_id,brand,unit_price,cost_price,stock_quantity,rating) VALUES
('Wireless Headphones',1,'SoundMax',2999,1800,120,4.5),
('Smart Watch',1,'FitTech',4999,3000,90,4.4),
('Bluetooth Speaker',1,'SoundMax',2499,1500,75,4.2),
('Laptop Pro 14',2,'TechBook',74999,60000,35,4.7),
('Gaming Mouse',2,'GamePro',1999,1100,150,4.3),
('Mechanical Keyboard',2,'GamePro',4499,2800,100,4.6),
('USB-C Hub',3,'ConnectX',1799,950,180,4.1),
('Power Bank 20000mAh',3,'PowerPlus',2299,1400,200,4.3),
('Air Fryer',4,'HomeChef',6999,4800,60,4.5),
('Mixer Grinder',4,'KitchenPro',4999,3300,85,4.2),
('Running Shoes',5,'RunFast',3499,2100,110,4.4),
('Backpack',5,'UrbanBag',1999,1200,140,4.1),
('Face Wash',6,'GlowCare',599,300,300,4.0),
('Fitness Band',7,'FitTech',2999,1800,100,4.3),
('Yoga Mat',7,'FlexFit',1299,700,220,4.5);

INSERT INTO orders(customer_id,order_date,order_status,shipping_city,shipping_state,total_amount) VALUES
(1,'2026-01-05','Delivered','Bangalore','Karnataka',7998),
(2,'2026-01-12','Delivered','Mysore','Karnataka',4999),
(3,'2026-02-02','Delivered','Chennai','Tamil Nadu',74999),
(4,'2026-02-15','Delivered','Hyderabad','Telangana',5298),
(5,'2026-03-03','Delivered','Pune','Maharashtra',6999),
(1,'2026-03-15','Delivered','Bangalore','Karnataka',6498),
(6,'2026-04-01','Delivered','Bangalore','Karnataka',4499),
(7,'2026-04-18','Delivered','Mumbai','Maharashtra',10497),
(8,'2026-05-06','Delivered','Delhi','Delhi',3499),
(9,'2026-05-20','Shipped','Kochi','Kerala',6798),
(10,'2026-06-02','Delivered','Bangalore','Karnataka',2299),
(11,'2026-06-15','Delivered','Chennai','Tamil Nadu',8498),
(12,'2026-07-03','Delivered','Pune','Maharashtra',9998),
(13,'2026-07-10','Pending','Hyderabad','Telangana',4499),
(14,'2026-07-20','Delivered','Bangalore','Karnataka',2999),
(15,'2026-08-01','Delivered','Mumbai','Maharashtra',7998),
(3,'2026-08-03','Delivered','Chennai','Tamil Nadu',5498),
(5,'2026-08-05','Shipped','Pune','Maharashtra',6998),
(7,'2026-08-07','Delivered','Mumbai','Maharashtra',3998),
(1,'2026-08-10','Pending','Bangalore','Karnataka',4798);

INSERT INTO order_items(order_id,product_id,quantity,unit_price,discount_amount) VALUES
(1,1,1,2999,0),(1,2,1,4999,0),(2,2,1,4999,0),(3,4,1,74999,0),
(4,3,1,2499,200),(4,7,1,1799,0),(4,8,1,2299,1099),(5,9,1,6999,0),
(6,1,1,2999,0),(6,3,1,2499,0),(6,7,1,1799,799),(7,6,1,4499,0),
(8,11,1,3499,0),(8,12,1,1999,0),(8,14,1,2999,0),(9,11,1,3499,0),
(10,9,1,6999,201),(11,8,1,2299,0),(12,5,1,1999,0),(12,6,1,4499,0),
(12,7,1,1799,0),(13,2,1,4999,0),(13,14,1,2999,0),(13,13,1,599,0),
(14,6,1,4499,0),(15,14,1,2999,0),(16,1,1,2999,0),(16,2,1,4999,0),
(17,8,1,2299,0),(17,5,1,1999,0),(17,13,1,599,0),(17,7,1,601,0),
(18,9,1,6999,1),(19,5,2,1999,0),(20,1,1,2999,0),(20,7,1,1799,0);

INSERT INTO payments(order_id,payment_date,payment_method,amount,payment_status) VALUES
(1,'2026-01-05','UPI',7998,'Paid'),(2,'2026-01-12','Card',4999,'Paid'),
(3,'2026-02-02','Card',74999,'Paid'),(4,'2026-02-15','UPI',5298,'Paid'),
(5,'2026-03-03','Card',6999,'Paid'),(6,'2026-03-15','UPI',6498,'Paid'),
(7,'2026-04-01','Card',4499,'Paid'),(8,'2026-04-18','UPI',10497,'Paid'),
(9,'2026-05-06','COD',3499,'Paid'),(10,'2026-05-20','Card',6798,'Paid'),
(11,'2026-06-02','UPI',2299,'Paid'),(12,'2026-06-15','Card',8498,'Paid'),
(13,'2026-07-03','UPI',9998,'Paid'),(14,'2026-07-10','Card',4499,'Pending'),
(15,'2026-07-20','UPI',2999,'Paid'),(16,'2026-08-01','Card',7998,'Paid'),
(17,'2026-08-03','UPI',5498,'Paid'),(18,'2026-08-05','Card',6998,'Paid'),
(19,'2026-08-07','COD',3998,'Paid'),(20,'2026-08-10','UPI',4798,'Pending');

INSERT INTO shipping(order_id,courier,shipping_date,expected_delivery,actual_delivery,shipping_status) VALUES
(1,'BlueDart','2026-01-06','2026-01-10','2026-01-09','Delivered'),
(2,'Delhivery','2026-01-13','2026-01-18','2026-01-17','Delivered'),
(3,'BlueDart','2026-02-03','2026-02-08','2026-02-07','Delivered'),
(4,'EcomExpress','2026-02-16','2026-02-21','2026-02-23','Delivered'),
(5,'Delhivery','2026-03-04','2026-03-09','2026-03-08','Delivered'),
(6,'BlueDart','2026-03-16','2026-03-21','2026-03-20','Delivered'),
(7,'EcomExpress','2026-04-02','2026-04-07','2026-04-06','Delivered'),
(8,'Delhivery','2026-04-19','2026-04-24','2026-04-25','Delivered'),
(9,'BlueDart','2026-05-07','2026-05-12','2026-05-11','Delivered'),
(10,'Delhivery','2026-05-21','2026-05-26',NULL,'In Transit'),
(11,'EcomExpress','2026-06-03','2026-06-08','2026-06-07','Delivered'),
(12,'BlueDart','2026-06-16','2026-06-21','2026-06-20','Delivered'),
(13,'Delhivery','2026-07-04','2026-07-09','2026-07-08','Delivered'),
(14,'BlueDart','2026-07-11','2026-07-16',NULL,'Pending'),
(15,'EcomExpress','2026-07-21','2026-07-26','2026-07-25','Delivered'),
(16,'BlueDart','2026-08-02','2026-08-07','2026-08-06','Delivered'),
(17,'Delhivery','2026-08-04','2026-08-09','2026-08-08','Delivered'),
(18,'EcomExpress','2026-08-06','2026-08-11',NULL,'In Transit'),
(19,'BlueDart','2026-08-08','2026-08-13','2026-08-12','Delivered'),
(20,'Delhivery','2026-08-11','2026-08-16',NULL,'Pending');

INSERT INTO discounts(product_id,discount_code,discount_percent,start_date,end_date,active) VALUES
(1,'AUDIO10',10,'2026-01-01','2026-12-31',TRUE),
(4,'LAPTOP5',5,'2026-01-01','2026-12-31',TRUE),
(9,'HOME15',15,'2026-01-01','2026-12-31',TRUE),
(11,'RUN10',10,'2026-01-01','2026-12-31',TRUE),
(14,'FIT5',5,'2026-01-01','2026-12-31',TRUE);

INSERT INTO reviews(customer_id,product_id,review_date,rating,review_text) VALUES
(1,1,'2026-01-12',5,'Excellent sound quality'),(2,2,'2026-01-20',4,'Good battery'),
(3,4,'2026-02-15',5,'Excellent laptop'),(4,3,'2026-02-25',4,'Good speaker'),
(5,9,'2026-03-12',5,'Very useful'),(1,1,'2026-03-25',4,'Good headphones'),
(6,6,'2026-04-12',5,'Great keyboard'),(7,11,'2026-05-01',4,'Comfortable shoes'),
(8,11,'2026-05-18',5,'Very comfortable'),(9,9,'2026-06-01',4,'Works well'),
(10,8,'2026-06-12',4,'Good power bank'),(11,6,'2026-06-25',5,'Excellent'),
(12,2,'2026-07-12',4,'Nice watch'),(13,6,'2026-07-20',5,'Great product'),
(14,14,'2026-07-28',4,'Useful for fitness'),(15,1,'2026-08-10',5,'Excellent audio');
