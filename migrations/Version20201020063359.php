<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20201020063359 extends AbstractMigration
{
    public function getDescription() : string
    {
        return '';
    }

    public function up(Schema $schema) : void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('CREATE SEQUENCE comment_id_seq INCREMENT BY 1 MINVALUE 1 START 1');
        $this->addSql('CREATE SEQUENCE conference_id_seq INCREMENT BY 1 MINVALUE 1 START 1');
        $this->addSql('CREATE TABLE comment (id INT NOT NULL, conference_id INT NOT NULL, author VARCHAR(255) NOT NULL, text TEXT NOT NULL, email VARCHAR(255) NOT NULL, created_at TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL, photo_filename VARCHAR(255) DEFAULT NULL, PRIMARY KEY(id))');
        $this->addSql('CREATE INDEX IDX_9474526C604B8382 ON comment (conference_id)');
        $this->addSql('CREATE TABLE conference (id INT NOT NULL, city VARCHAR(255) NOT NULL, year VARCHAR(4) NOT NULL, is_international BOOLEAN NOT NULL, PRIMARY KEY(id))');
        $this->addSql('ALTER TABLE comment ADD CONSTRAINT FK_9474526C604B8382 FOREIGN KEY (conference_id) REFERENCES conference (id) NOT DEFERRABLE INITIALLY IMMEDIATE');
        $this->addSql('INSERT INTO comment (conference_id, author, text, email, created_at, photo_filename) VALUES (1, Fabien, texto fabien, fabien@some.where, 2019-12-06 10:49:00, lisbon.jpg)');
        $this->addSql('INSERT INTO comment (conference_id, author, text, email, created_at, photo_filename) VALUES (1, Thomas, texto thomas, thomas@some.where, 2019-12-06 10:49:00, lisbon.jpg)');
        $this->addSql('INSERT INTO comment (conference_id, author, text, email, created_at, photo_filename) VALUES (1, Helene, texto heleen, helene@some.where, 2019-12-06 10:49:00, lisbon.jpg)');
        $this->addSql('INSERT INTO comment (conference_id, author, text, email, created_at, photo_filename) VALUES (1, Lucas, texto lucas, lucas@some.where, 2019-12-06 10:49:00, lisbon.jpg)');
        $this->addSql('INSERT INTO conference (city, year, is_international) VALUES (Amsterdam, 2019, true)');
        $this->addSql('INSERT INTO conference (city, year, is_international) VALUES (Paris, 2020, false)');

    }

    public function down(Schema $schema) : void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('CREATE SCHEMA public');
        $this->addSql('ALTER TABLE comment DROP CONSTRAINT FK_9474526C604B8382');
        $this->addSql('DROP SEQUENCE comment_id_seq CASCADE');
        $this->addSql('DROP SEQUENCE conference_id_seq CASCADE');
        $this->addSql('DROP TABLE comment');
        $this->addSql('DROP TABLE conference');
    }
}
