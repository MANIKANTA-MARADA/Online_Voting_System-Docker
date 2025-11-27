-- Ensures roles ALWAYS exist even if Flyway skipped
INSERT IGNORE INTO roles(name) VALUES ('ROLE_USER');
INSERT IGNORE INTO roles(name) VALUES ('ROLE_ADMIN');
