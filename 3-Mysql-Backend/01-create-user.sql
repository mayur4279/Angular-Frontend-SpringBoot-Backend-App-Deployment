CREATE USER 'ecommerceapp'@'%' IDENTIFIED BY 'ecommerceapp';

GRANT ALL PRIVILEGES ON *.* TO 'ecommerceapp'@'%' WITH GRANT OPTION;

FLUSH PRIVILEGES; 


