mysql -u root -psteve -e 'drop database if exists topics;'
mysql -u root -psteve -e 'create database topics default character set utf8;'
mysql -u root -psteve -e "grant all privileges on topics.* to 'topics'@'localhost';"
mysql -u root -psteve -e "set password for 'topics'@'localhost' = PASSWORD('cloudf1');"
mysql topics -u topics -pcloudf1 < topics.sql
