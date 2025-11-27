-- ============= USERS TABLE ===================
CREATE TABLE IF NOT EXISTS users (
  id BIGINT NOT NULL AUTO_INCREMENT,
  name VARCHAR(40) NOT NULL,
  username VARCHAR(15) NOT NULL,
  email VARCHAR(40) NOT NULL,
  password VARCHAR(100) NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id),
  UNIQUE KEY uk_users_username (username),
  UNIQUE KEY uk_users_email (email)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ============= ROLES TABLE ===================
CREATE TABLE IF NOT EXISTS roles (
  id BIGINT NOT NULL AUTO_INCREMENT,
  name VARCHAR(60) NOT NULL,
  PRIMARY KEY (id),
  UNIQUE KEY uk_roles_name (name)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ============= USER_ROLES TABLE ==============
CREATE TABLE IF NOT EXISTS user_roles (
  user_id BIGINT NOT NULL,
  role_id BIGINT NOT NULL,
  PRIMARY KEY (user_id, role_id),
  CONSTRAINT fk_user_roles_user_id FOREIGN KEY (user_id) REFERENCES users(id),
  CONSTRAINT fk_user_roles_role_id FOREIGN KEY (role_id) REFERENCES roles(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ============= POLLS TABLE ===================
CREATE TABLE IF NOT EXISTS polls (
  id BIGINT NOT NULL AUTO_INCREMENT,
  question VARCHAR(140) NOT NULL,
  expiration_date_time DATETIME NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  created_by BIGINT DEFAULT NULL,
  updated_by BIGINT DEFAULT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ============= CHOICES TABLE =================
CREATE TABLE IF NOT EXISTS choices (
  id BIGINT NOT NULL AUTO_INCREMENT,
  text VARCHAR(40) NOT NULL,
  poll_id BIGINT NOT NULL,
  PRIMARY KEY (id),
  CONSTRAINT fk_choices_poll_id FOREIGN KEY (poll_id) REFERENCES polls(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ============= VOTES TABLE ===================
CREATE TABLE IF NOT EXISTS votes (
  id BIGINT NOT NULL AUTO_INCREMENT,
  user_id BIGINT NOT NULL,
  poll_id BIGINT NOT NULL,
  choice_id BIGINT NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id),
  CONSTRAINT fk_votes_user_id FOREIGN KEY (user_id) REFERENCES users(id),
  CONSTRAINT fk_votes_poll_id FOREIGN KEY (poll_id) REFERENCES polls(id),
  CONSTRAINT fk_votes_choice_id FOREIGN KEY (choice_id) REFERENCES choices(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
