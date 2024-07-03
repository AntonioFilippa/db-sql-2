1. Contare quanti iscritti ci sono stati ogni anno

SELECT YEAR(enrolment_date) AS enrolment_year, COUNT(\*) AS total_enrolments
FROM enrolments
GROUP BY YEAR(enrolment_date)
ORDER BY enrolment_year;

2. Contare gli insegnanti che hanno l'ufficio nello stesso edificio


SELECT office_address, COUNT(_) AS teachers_count
FROM teachers
GROUP BY office_address
HAVING COUNT(_) > 1
ORDER BY teachers_count DESC;

3. Calcolare la media dei voti di ogni appello d'esame

SELECT exam_id, AVG(vote) AS average_vote
FROM exam_student
GROUP BY exam_id
ORDER BY exam_id;



4. Contare quanti corsi di laurea ci sono per ogni dipartimento
SELECT department_id, COUNT(id) AS degree_courses_count
FROM degrees
GROUP BY department_id
ORDER BY degree_courses_count DESC;
