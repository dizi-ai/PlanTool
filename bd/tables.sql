drop table users, boards, board_rows, status_info, board_items, board_item_media;
CREATE TABLE users(
id SERIAL PRIMARY KEY,
us_name TEXT not null,
email TEXT not null,
us_login text not null,
us_password text not null,
registration_date date,
last_pw_change date
);

CREATE TABLE boards(
board_id BIGSERIAL PRIMARY KEY,
board_name TEXT not null,
owner_id SERIAL not null,
board_description text,
creation_date date,
FOREIGN KEY (owner_id) REFERENCES users (id)
);

CREATE TABLE board_rows(
br_id BIGSERIAL PRIMARY KEY,
board_id BIGSERIAL not null,
row_name text,
row_description text,
created_by serial,
creation_date date,
FOREIGN KEY (board_id) REFERENCES boards (board_id),
FOREIGN KEY (created_by) REFERENCES users (id)
);

CREATE TABLE status_info(
status_id SERIAL PRIMARY KEY,
status_descr text not null
);

CREATE TABLE board_items(
bi_id BIGSERIAL PRIMARY KEY,
row_id BIGSERIAL not null,
bi_name text,
bi_description text,
deadline date not null,
status_id serial not null,
updated_by serial,
updated_date date,
created_by serial not null,
creation_date date,
FOREIGN KEY (row_id) REFERENCES board_rows (br_id),
FOREIGN KEY (status_id) REFERENCES status_info (status_id),
FOREIGN KEY (updated_by) REFERENCES users (id),
FOREIGN KEY (created_by) REFERENCES users (id)
);

CREATE TABLE board_item_media(
bim_id BIGSERIAL PRIMARY KEY,
bi_id_f BIGSERIAL not null,
media_file text not null,
upload_date date,
upload_by serial not null,
FOREIGN KEY (bi_id_f) REFERENCES board_items (bi_id),
FOREIGN KEY (upload_by) REFERENCES users (id)
);

CREATE TABLE user_permissions(
up_id SMALLSERIAL  PRIMARY KEY,
board_p SMALLSERIAL not null,
items_p SMALLSERIAL not null
);

CREATE TABLE board_user_access(
bua_id serial PRIMARY KEY,
board_id BIGSERIAL not null,
user_id serial not null,
up_id SMALLSERIAL not null,
FOREIGN KEY (board_id) REFERENCES boards (board_id),
FOREIGN KEY (user_id) REFERENCES users (id),
FOREIGN KEY (up_id) REFERENCES user_permissions (up_id)
);