CREATE USER 'ecommerceapp'@'localhost' IDENTIFIED BY 'ecommerceapp';

GRANT ALL PRIVILEGES ON *.* TO 'ecommerceapp'@'%';

FLUSH PRIVILEGES;   

