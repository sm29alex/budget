DROP TABLE IF EXISTS records;
DROP TABLE IF EXISTS user_roles;
DROP TABLE IF EXISTS items;
DROP TABLE IF EXISTS users;

DROP SEQUENCE IF EXISTS seq_users;
DROP SEQUENCE IF EXISTS seq_items;
DROP SEQUENCE IF EXISTS seq_records;

CREATE SEQUENCE seq_users;
CREATE SEQUENCE seq_items;
CREATE SEQUENCE seq_records;

CREATE TABLE users
(
  id               INTEGER PRIMARY KEY DEFAULT nextval('seq_users'),
  name             VARCHAR                 NOT NULL,
  email            VARCHAR                 NOT NULL,
  password         VARCHAR                 NOT NULL,
  registered       TIMESTAMP DEFAULT now() NOT NULL,
  enabled          BOOL DEFAULT TRUE       NOT NULL
);
CREATE UNIQUE INDEX users_unique_email_idx ON users (email);

CREATE TABLE user_roles
(
  user_id INTEGER NOT NULL,
  role    VARCHAR,
  CONSTRAINT user_roles_idx UNIQUE (user_id, role),
  FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE
);

CREATE TABLE items (
  id          INTEGER PRIMARY KEY DEFAULT nextval('seq_items'),
  user_id     INTEGER   NOT NULL  REFERENCES users (id),
  parent_id   INTEGER   REFERENCES items (id),
  description TEXT      NOT NULL,
  CONSTRAINT items_id_parent_id_idx UNIQUE (id, parent_id)
);

CREATE TABLE records (
  id          INTEGER PRIMARY KEY DEFAULT nextval('seq_records'),
  item_id     INTEGER NOT NULL REFERENCES items (id),
  date        DATE DEFAULT now()::DATE,
  cost        DECIMAL(10, 2) NOT NULL
);
