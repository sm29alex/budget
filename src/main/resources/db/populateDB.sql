DELETE FROM user_roles;
DELETE FROM records;
DELETE FROM items;
DELETE FROM users;

ALTER SEQUENCE seq_users RESTART;
ALTER SEQUENCE seq_items RESTART;
ALTER SEQUENCE seq_records RESTART;

INSERT INTO users (name, email, password) VALUES
  ('User', 'user@yandex.ru', 'password'),
  ('Admin', 'admin@gmail.com', 'admin');

INSERT INTO user_roles (role, user_id) VALUES
  ('ROLE_USER', 1),
  ('ROLE_ADMIN', 2);

INSERT INTO items (id, user_id, parent_id, description) VALUES
  (1, 1, NULL , 'Продукты'),
  (2, 1, NULL , 'Авто'),
  (3, 1, 2 , 'Запчасти'),
  (4, 1, 2 , 'Бензин'),
  (5, 1, 1 , 'Мясо'),
  (6, 2, NULL , 'Продукты'),
  (7, 2, 6 , 'Мясо'),
  (8, 2, 6 , 'Вегетарианские'),
  (9, 2, 7 , 'Свинина');

INSERT INTO records(item_id, date, cost) VALUES
  (1, '2017-12-06', 300.20),
  (1, '2017-12-06', 400.30),
  (1, '2017-12-07', 500),
  (5, '2017-12-06', 700),
  (5, '2017-12-07', 800);
