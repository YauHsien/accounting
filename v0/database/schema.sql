
CREATE TABLE account_items (
  id      varchar(4)     NOT NULL,
  name    varchar(128)   NOT NULL,
  name_en varchar(128)   NOT NULL,
  desc_   varchar(1024),
  desc_en varchar(1024)
);

CREATE TABLE enc_key (
  co_name varchar(128)  NOT NULL,
  co_id   varchar(16)   NOT NULL PRIMARY KEY,
  pr_cred varchar(1024) NOT NULL,
  pub_key varchar(1024) NOT NULL
);

CREATE TABLE enc_format (
  co_id   varchar(16)   NOT NULL, -- FK
  format  varchar(4096) NOT NULL
);

CREATE TABLE blocks (
  co_id   varchar(16)   NOT NULL, -- FK
  content varchar(4096) NOT NULL,
  pre_key varchar(1024) NOT NULL,
  cur_key varchar(1024) NOT NULL
);

CREATE TABLE account_entries (
  id      int           NOT NULL PRIMARY KEY,
  desc_   varchar(300)  NOT NULL
);

CREATE TABLE account_ent_debited (
  ent_id  int           NOT NULL, -- FK
  acc_id  varchar(4)    NOT NULL, -- FK
  amount  int           NOT NULL
);

CREATE TABLE account_ent_credited (
  ent_id  int           NOT NULL, -- FK
  acc_id  varchar(4)    NOT NULL, -- FK
  amount  int           NOT NULL
);
