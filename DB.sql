DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS questions;
DROP TABLE IF EXISTS answers;
DROP TABLE IF EXISTS cdns;
DROP TABLE IF EXISTS jobs;
DROP TABLE IF EXISTS blogs;


CREATE TABLE users
(
    id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    email VARCHAR(255) UNIQUE,
    password VARCHAR(255),
    image VARCHAR(255),
    status VARCHAR(255),
    rank INTEGER
);
INSERT INTO users
    (name,email,password,image,status,rank)
VALUES
    ('Abdallah', 'Abdalla@gmail.com', '123456789', 'url', 'true', 999);


CREATE TABLE questions
(
    id SERIAL PRIMARY KEY,
    user_id INT,
    title VARCHAR(255),
    description TEXT,
    tags VARCHAR(255),
    code TEXT,
    rank INTEGER,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

-- INSERT INTO questions (user_id,title,description,tags,code,rank) VALUES (1,'ask2','hard one','HTML','var=aasdas',999);

CREATE TABLE answers
(
    id SERIAL PRIMARY KEY,
    user_id INT,
    question_id INT,
    answer TEXT,
    description TEXT,
    code TEXT,
    rank INTEGER,
    approved BOOLEAN DEFAULT false,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (question_id) REFERENCES questions(id) ON DELETE CASCADE
);

-- INSERT INTO answers (user_id,question_id,answer,description,code,rank,approved) VALUES (2,1,'hard one','1','var=aasdas',999,true);

CREATE TABLE replies
(
    id SERIAL PRIMARY KEY,
    user_id INT,
    answer_id INT,
    reply TEXT,
    description TEXT,
    code TEXT,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (answer_id) REFERENCES answers(id) ON DELETE CASCADE
);

-- INSERT INTO replies (user_id,answer_id,reply,description,code,rank,approved) VALUES (2,1,'hard one','1','var=aasdas',999,true);

CREATE TABLE jobs
(
    id SERIAL PRIMARY KEY,
    type VARCHAR(255),
    company VARCHAR(255),
    company_url VARCHAR(255),
    location VARCHAR(255),
    title VARCHAR(255),
    description TEXT,
    company_logo VARCHAR(255),
    user_id INT,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);


CREATE TABLE cdns
(
    id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    latest VARCHAR(255),
    version VARCHAR(255),
    description TEXT,
    author VARCHAR(255),
    filename VARCHAR(255),
    keywords VARCHAR(255),
    user_id INT,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

CREATE TABLE blogs
(
    id SERIAL PRIMARY KEY,
    tittle VARCHAR(255),
    blog TEXT,
    img TEXT,
    des Text,
    user_id INT,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
)

