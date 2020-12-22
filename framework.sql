CREATE DATABASE IF NOT EXISTS `framework`;
USE `framework`;

CREATE TABLE `users` (
    `steamid` VARCHAR(40) NOT NULL,

    PRIMARY KEY (`steamid`)
);

ALTER TABLE `users`
    ADD `position` VARCHAR(53) NULL DEFAULT '{-269.4, -955.3, 31.2}';