CREATE TABLE IF NOT EXISTS users
(
    id       INT UNSIGNED NOT NULL AUTO_INCREMENT,
    email    VARCHAR(60),
    password VARCHAR(255),
    PRIMARY KEY (id),
    CONSTRAINT uc_email UNIQUE (email)
);

CREATE TABLE IF NOT EXISTS ads
(
    id          INT UNSIGNED NOT NULL AUTO_INCREMENT,
    title       VARCHAR(40),
    description VARCHAR(255),
    category    VARCHAR(20),
    user_id     INT,
    FOREIGN KEY (user_id) REFERENCES users (id),
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS categories
(
    id       INT UNSIGNED NOT NULL AUTO_INCREMENT,
    category VARCHAR(20),
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS category_ads
(
    category_id INT,
    user_id     INT,
    FOREIGN KEY (category_id) REFERENCES categories (id),
    FOREIGN KEY (user_id) REFERENCES users (id)
);
# For a given ad, what is the email address of the user that created it?
SELECT email
FROM ads
         JOIN users ON ads.user_id = users.id
WHERE ads.user_id = user_id;
# For a given ad, what category, or categories, does it belong to?
SELECT a.category
FROM ads AS a
         JOIN category_ads AS ca on a.user_id = ca.user_id
         JOIN categories AS c on ca.category_id = c.id;

# For a given category, show all the ads that are in that category.
SELECT title
FROM categories AS cat
         JOIN category_ads AS ca on cat.id = ca.category_id;

# For a given user, show all the ads they have posted.
SELECT title, description
FROM users
         JOIN ads ON users.id = ads.user_id
WHERE users.id = 5;


# quizzes
CREATE TABLE IF NOT EXISTS quizzes
(
    id      INT UNSIGNED NOT NULL AUTO_INCREMENT,
    title   VARCHAR(40),
    subject VARCHAR(20),
    PRIMARY KEY (id)
);

# questions
CREATE TABLE IF NOT EXISTS questions
(
    id      INT UNSIGNED NOT NULL AUTO_INCREMENT,
    text    text,
    quiz_id INT,
    PRIMARY KEY (id),
    FOREIGN KEY (quiz_id) REFERENCES quizzes (id)
);

# answer
CREATE TABLE IF NOT EXISTS answers
(
    id          INT UNSIGNED NOT NULL AUTO_INCREMENT,
    text        text,
    correct     CHAR, #right or wrong (R/W)
    question_id INT,
    PRIMARY KEY (id),
    FOREIGN KEY (question_id) REFERENCES questions (id)
);

CREATE TABLE IF NOT EXISTS users
(
    id       INT UNSIGNED NOT NULL AUTO_INCREMENT,
    role     CHAR         NOT NULL, # A is 'admin', 'S' is student
    username VARCHAR(20)  NOT NULL,
    password VARCHAR(25)  NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS results
(
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    score FLOAT,
    user_id INT,
    quizzes_id INT,
    PRIMARY KEY (id),
    FOREIGN KEY (user_id) REFERENCES users (id),
    FOREIGN KEY (quizzes_id) REFERENCES quizzes (id)
)

SELECT COUNT(*) AS 'How many students have taken quiz'
FROM results AS r
JOIN quizzes AS q on r.quizzes_id = q.id
WHERE quizzes_id = 5;
