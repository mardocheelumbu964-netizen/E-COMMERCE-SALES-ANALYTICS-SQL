USE ecommerce_analytics;

CREATE TABLE IF NOT EXISTS order_audit (
 audit_id INT AUTO_INCREMENT PRIMARY KEY,
 order_id INT,
 old_status VARCHAR(30),
 new_status VARCHAR(30),
 changed_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

DROP TRIGGER IF EXISTS trg_order_status_audit;

DELIMITER //
CREATE TRIGGER trg_order_status_audit
AFTER UPDATE ON orders
FOR EACH ROW
BEGIN
 IF OLD.order_status<>NEW.order_status THEN
  INSERT INTO order_audit(order_id,old_status,new_status)
  VALUES(OLD.order_id,OLD.order_status,NEW.order_status);
 END IF;
END //
DELIMITER ;
