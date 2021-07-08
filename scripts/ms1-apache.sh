#!/bin/bash
yum install httpd -y
chkconfig httpd on
mkdir /var/www/html/payments
echo "<h2> Ugam Payments Service </h2>" > /var/www/html/payments/index.html
echo "Success" > /var/www/html/index.html
service httpd start