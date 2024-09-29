CREATE USER 'ecommerceapp'@'localhost' IDENTIFIED BY 'ecommerceapp';

GRANT ALL PRIVILEGES ON *.* TO 'ecommerceapp'@'%' WITH GRANT OPTION;

FLUSH PRIVILEGES;


