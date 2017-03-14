CREATE DATABASE apprenticeships;

CREATE TABLE user_types (
  id SERIAL4 PRIMARY KEY,
  user_type VARCHAR(20) NOT NULL
);

CREATE TABLE industries (
  id SERIAL4 PRIMARY KEY,
  industry VARCHAR(80) NOT NULL
);




CREATE TABLE apprentice_profiles (
    id SERIAL4 PRIMARY KEY,
    user_type_id INTEGER,
    industry_id INTEGER NOT NULL,
    firstname VARCHAR(200) NOT NULL,
    surname VARCHAR(200) NOT NULL,
    email VARCHAR(300) NOT NULL,
    mobile_no VARCHAR(200),
    work_experience_id INTEGER,
    education_id INTEGER,
    license_id INTEGER,
    career_object VARCHAR(200),
    apprentice_level VARCHAR(200),
    state VARCHAR(4) NOT NULL,
    postcode VARCHAR(200) NOT NULL,
    password_digest VARCHAR(400) NOT NULL,
    profile_comp BOOLEAN NOT NULL
);

CREATE TABLE employer_profiles (
  id SERIAL4 PRIMARY KEY,
  industry_id INTEGER NOT NULL,
  user_type_id INTEGER,
  firstname VARCHAR(200) NOT NULL,
  surname VARCHAR(200) NOT NULL,
  company_name VARCHAR(200) NOT NULL,
  website_link VARCHAR(200),
  business_email VARCHAR(200) NOT NULL,
  company_number VARCHAR(200),
  password_digest VARCHAR(400) NOT NULL,
  state VARCHAR(4) NOT NULL,
  postcode VARCHAR(200) NOT NULL,
  profile_comp BOOLEAN NOT NULL

);

CREATE TABLE work_experiences (
  id SERIAL4 PRIMARY KEY,
  apprentice_profile_id INTEGER NOT NULL,
  company VARCHAR(200) NOT NULL,
  title VARCHAR(200) NOT NULL,
  summary TEXT,
  date_started VARCHAR(200) NOT NULL,
  date_finished VARCHAR(200) NOT NULL,
  profile_comp BOOLEAN NOT NULL
);

CREATE TABLE education (
  id SERIAL4 PRIMARY KEY,
  apprentice_profile_id INTEGER NOT NULL,
  school VARCHAR(200) NOT NULL,
  certification VARCHAR(200) NOT NULL,
  year_completed VARCHAR(200) NOT NULL,
  profile_comp BOOLEAN NOT NULL
);

CREATE TABLE licenses (
  id SERIAL4 PRIMARY KEY,
  apprentice_profile_id INTEGER NOT NULL,
  name VARCHAR(200) NOT NULL,
  state_held VARCHAR(4) NOT NULL,
  year_completed VARCHAR(200) NOT NULL,
  profile_comp BOOLEAN NOT NULL
);

CREATE TABLE referees (
  id SERIAL4 PRIMARY KEY,
  apprentice_profile_id INTEGER NOT NULL,
  name VARCHAR(200) NOT NULL,
  email VARCHAR(200) NOT NULL,
  phone INTEGER NOT NULL
);
