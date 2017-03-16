CREATE DATABASE apprenticeships;


CREATE TABLE industries (
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(80) NOT NULL
);

INSERT INTO industries (id, name) VALUES (1, 'construction');
INSERT INTO industries (id, name) VALUES (2, 'electrical');
INSERT INTO industries (id, name) VALUES (3, 'plumbing');
INSERT INTO industries (id, name) VALUES (4, 'mechanic');
INSERT INTO industries (id, name) VALUES (5, 'carpentry');
INSERT INTO industries (id, name) VALUES (6, 'machinery');
INSERT INTO industries (id, name) VALUES (7, 'welding');

CREATE TABLE states (
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(80) NOT NULL
);


INSERT INTO states (id, name) VALUES (1, 'SA');
INSERT INTO states (id, name) VALUES (2, 'VIC');
INSERT INTO states (id, name) VALUES (3, 'NSW');
INSERT INTO states (id, name) VALUES (4, 'QLD');
INSERT INTO states (id, name) VALUES (5, 'TAS');
INSERT INTO states (id, name) VALUES (6, 'ACT');
INSERT INTO states (id, name) VALUES (7, 'WA');
INSERT INTO states (id, name) VALUES (8, 'NT');





CREATE TABLE apprentice_profiles (
    id SERIAL4 PRIMARY KEY,
    industry_id INTEGER NOT NULL,
    firstname VARCHAR(200) NOT NULL,
    surname VARCHAR(200) NOT NULL,
    email VARCHAR(300) NOT NULL,
    mobile_no VARCHAR(200),
    state_id INTEGER NOT NULL,
    postcode VARCHAR(200) NOT NULL,
    password_digest VARCHAR(400) NOT NULL
);

CREATE TABLE work_preferences (
  id SERIAL4 PRIMARY KEY,
  apprentice_profile_id INTEGER NOT NULL,
  preferred_work_location VARCHAR(200) NOT NULL,
  apprentice_level VARCHAR(200),
  jobseeking_status VARCHAR(200) NOT NULL
);

CREATE TABLE work_experiences (
  id SERIAL4 PRIMARY KEY,
  apprentice_profile_id INTEGER NOT NULL,
  company VARCHAR(200),
  title VARCHAR(200),
  summary TEXT,
  date_started VARCHAR(200),
  date_finished VARCHAR(200)
);

CREATE TABLE qualifications (
  id SERIAL4 PRIMARY KEY,
  apprentice_profile_id INTEGER NOT NULL,
  school VARCHAR(200),
  certification VARCHAR(200),
  year_completed VARCHAR(200)
);

CREATE TABLE licenses (
  id SERIAL4 PRIMARY KEY,
  apprentice_profile_id INTEGER NOT NULL,
  name VARCHAR(200),
  state_held VARCHAR(4)
);

CREATE TABLE referees (
  id SERIAL4 PRIMARY KEY,
  apprentice_profile_id INTEGER NOT NULL,
  name VARCHAR(200),
  email VARCHAR(200),
  relationship VARCHAR(200),
  phone INTEGER
);

-- FUTURE PHASE
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
  state_id INTEGER NOT NULL,
  postcode VARCHAR(200) NOT NULL,
  profile_comp BOOLEAN

);

CREATE TABLE user_types (
  id SERIAL4 PRIMARY KEY,
  user_type VARCHAR(20) NOT NULL
);
