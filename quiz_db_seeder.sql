USE quiz_db;

-- Inserting default test values for admin and users
INSERT INTO `quiz_db`.`admin` (`username`, `email`, `password`)
VALUES ('hungly', 'hung@email.com', 'codeup'),
       ('bob', 'bob@email.com', 'codeup'),
       ('admin1', 'admin1@email.com', '123'),
       ('admin2', 'admin2@email.com', '123'),
       ('admin3', 'admin3@email.com', '123');

INSERT INTO user (username, email, password)
VALUES ('student1', 'stu1@email.com', '123'),
       ('student2', 'stu2@email.com', '123'),
       ('student3', 'stu3@email.com', '123');

-- Inserting default answers
INSERT INTO `quiz_db`.`correct_ans` (answer)
VALUES ('George Washington'),
       ('33'),
       ('6'),
       ('create, read, update, delete'),
       ('48'),
       ('1995');
select *
from correct_ans;

-- Inserting default questions
INSERT INTO questions (question, admin_id, correct_ans_id)
VALUES ('Who is the first president of the US?', 1, 1),
       ('What is Larry Bird''s Number', 1, 2),
       ('How many championships did Michael Jordan win?', 2, 3),
       ('What does CRUD stand for?', 2, 4),
       ('What is 24 + 24?', 2, 5),
       ('What year was Java created?', 2, 6);

-- Inserting default quiz
INSERT INTO quiz (admin_id, user_id)
VALUES (1, 1),
       (1, 2),
       (1, 3);

-- Insert quiz questions
INSERT INTO quiz_has_ques (quiz_id, ques_id)
VALUES (1, 1),
       (1, 2),
       (2, 3),
       (2, 4),
       (3, 5),
       (3, 6);

-- Insert user answers
INSERT INTO user_ans (answer, user_id, questions_id)
VALUES ('George Washington', 1, 1),
       ('33', 1, 2),
       ('Michael Jordan', 2, 1),
       ('28', 2, 2);
INSERT INTO user_ans (answer, user_id, questions_id)
VALUES ('6', 1, 3),
       ('create, read, update, delete', 1, 4),
       ('3', 2, 3),
       ('crap', 2, 4);
INSERT INTO user_ans (answer, user_id, questions_id)
VALUES ('48', 1, 5),
       ('2000', 1, 6);

SELECT u.username, q.question, ua.answer AS 'student''s answer', ca.answer AS 'correct answer', COUNT(*) AS 'incorrect'
FROM user AS u
LEFT JOIN user_ans AS ua ON u.id = ua.user_id
JOIN questions AS q on ua.questions_id = q.id
JOIN correct_ans AS ca on q.correct_ans_id = ca.id
WHERE ua.answer != ca.answer
GROUP BY u.username, q.question, ua.answer, ca.answer;

SELECT u.username, q.question, ua.answer AS 'student''s answer', ca.answer AS 'correct answer', COUNT(*) AS 'correct'
FROM user AS u
         LEFT JOIN user_ans AS ua ON u.id = ua.user_id
         JOIN questions AS q on ua.questions_id = q.id
         JOIN correct_ans AS ca on q.correct_ans_id = ca.id
WHERE ua.answer = ca.answer
GROUP BY u.username, q.question, ua.answer, ca.answer;




SELECT *
FROM quiz_db.admin;



