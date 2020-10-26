<?php

$this->addSql('INSERT INTO admin (id, username, roles, password) VALUES (nextval("admin_id_seq"), "admin", "[\"ROLE_ADMIN\"]", "$argon2id$v=19$m=65536,t=4,p=1$WvVyGjoOQkAVAmSsd7C2kA$QH/TPDj3L3PrfaMnrwGjHurq2OOEAHIn6wzBDubiE5U")');

$this->addSql('INSERT INTO conference (city, year, is_international) VALUES (Amsterdam, 2019, true)');
$this->addSql('INSERT INTO conference (city, year, is_international) VALUES (Paris, 2020, false)');

$this->addSql('INSERT INTO comment (conference_id, author, text, email, created_at, photo_filename) VALUES (1, Fabien, texto fabien, fabien@some.where, 2019-12-06 10:49:00, lisbon.jpg)');
$this->addSql('INSERT INTO comment (conference_id, author, text, email, created_at, photo_filename) VALUES (1, Thomas, texto thomas, thomas@some.where, 2019-12-06 10:49:00, lisbon.jpg)');
$this->addSql('INSERT INTO comment (conference_id, author, text, email, created_at, photo_filename) VALUES (1, Helene, texto heleen, helene@some.where, 2019-12-06 10:49:00, lisbon.jpg)');
$this->addSql('INSERT INTO comment (conference_id, author, text, email, created_at, photo_filename) VALUES (1, Lucas, texto lucas, lucas@some.where, 2019-12-06 10:49:00, lisbon.jpg)');
