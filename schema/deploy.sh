mysql -u root -psteve -e 'drop database if exists top;'
mysql -u root -psteve -e 'create database top default character set utf8;'
mysql -u root -psteve -e "grant all privileges on top.* to 'top'@'localhost';"
mysql -u root -psteve -e "set password for 'top'@'localhost' = PASSWORD('cloudf1');"
mysql top -u top -pcloudf1 < top.sql