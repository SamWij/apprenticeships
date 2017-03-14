CREATE DATABASE apprentices;

CREATE TABLE users (
  id SERIAL4 PRIMARY KEY,
  user_type VARCHAR(20) NOT NULL,
  firstname VARCHAR(200) NOT NULL,
  surname VARCHAR(200) NOT NULL,
  email VARCHAR(300) NOT NULL,
  mobile_no INTEGER,
  password_digest VARCHAR(400) NOT NULL
);



CREATE TABLE profiles (
    id SERIAL4 PRIMARY KEY,
    industry_id INTEGER NOT NULL,
    career_object VARCHAR(200) NOT NULL,
    career_summary TEXT,

    qualification VARCHAR(400),
    industry VARCHAR(400) NOT NULL

);
