PRAGMA foreign_keys = ON;

CREATE TABLE users (
    id INTEGER PRIMARY KEY, 
    fname TEXT NOT NULL, 
    lname TEXT NOT NULL
);

INSERT INTO 
    users (fname, lname)
VALUES
    ('Anya', 'Hirota'),
    ('Maya', 'Hirota'),
    ('Garrett', 'Olson'),
    ('Henry', 'Han');

CREATE TABLE questions (
    id INTEGER PRIMARY KEY, 
    title TEXT NOT NULL, 
    body TEXT NOT NULL, 
    author_id INTEGER NOT NULL,

    FOREIGN KEY (author_id) REFERENCES users(id)
);

INSERT INTO
    questions (title, body, author_id)
VALUES
    ('Minnesota?', 'Have you every been to Minnesota? It is an amazing place!', (SELECT id FROM users WHERE fname = 'Garrett' AND lname = 'Olson')),
    ('KPOP!!!', 'What is your fave k-pop song?',  (SELECT id FROM users WHERE fname = 'Henry' AND lname = 'Han'));

CREATE TABLE question_follows (
    id INTEGER PRIMARY KEY,
    question_id INTEGER,
    user_id INTEGER,

    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (question_id) REFERENCES questions(id)
);

CREATE TABLE replies (
    id INTEGER PRIMARY KEY,
    question_id INTEGER NOT NULL, 
    parent_reply_id INTEGER, 
    author_id INTEGER NOT NULL,
    body TEXT NOT NULL,

    FOREIGN KEY (author_id) REFERENCES users(id),
    FOREIGN KEY (question_id) REFERENCES questions(id),
    FOREIGN KEY (parent_reply_id) REFERENCES replies(id)
);

CREATE TABLE question_likes (
    id INTEGER PRIMARY KEY,
    liker_id INTEGER,
    question_id INTEGER,

    FOREIGN KEY (liker_id) REFERENCES users(id),
    FOREIGN KEY (question_id) REFERENCES questions(id)
);



