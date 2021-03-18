CREATE DATABASE wordpress;
CREATE USER wpuser@localhost IDENTIFIED BY 'wpuserpass';
GRANT ALL PRIVILEGES ON wordpress.* TO wpuser@localhost;
/* grand all privileges on all wordpress tables*/
CREATE USER superuser@localhost IDENTIFIED BY 'superuserpass';
GRANT ALL PRIVILEGES ON *.* TO superuser@localhost;
FLUSH PRIVILEGES;

/*  created two users : one with access to wordpress DB and the other with access */
/*  to all DB. */
/*  mysql < create_wordpress_db.sql to run */
