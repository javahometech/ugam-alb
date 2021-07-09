#!/bin/bash
yum install httpd -y
chkconfig httpd on
mkdir /var/www/html/cart
echo "<h2> Ugam Cart Service </h2>" > /var/www/html/cart/index.html
echo "Success" > /var/www/html/index.html
service httpd start