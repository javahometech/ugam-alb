#!/bin/bash
yum install httpd -y
chkconfig httpd on
mkdir /var/www/html/orders
echo "<h2> Ugam Orders Service </h2>" > /var/www/html/orders/index.html
echo "Success" > /var/www/html/index.html
service httpd start