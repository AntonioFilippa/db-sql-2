1.Selezionare tutti gli studenti iscritti al Corso di Laurea in Economia
SELECT * FROM `students` 
INNER JOIN degrees ON students.degree_id = degree_id
WHERE degrees.name ="Corso di Laurea in Economia"

2. Selezionare tutti i Corsi di Laurea Magistrale del Dipartimento di
Neuroscienze
SELECT 
degrees.level,
degrees.name, AS dipartimento
degrees.name AS corso_di_laurea
FROM departments
INNER JOIN degrees ON departments.id = degrees.department_id
WHERE departments.name = "Neuroscienze" AND degrees.level = "magistrale"

3. Selezionare tutti i corsi in cui insegna Fulvio Amato (id=44)
SELECT * FROM `courses`
INNER JOIN course_teacher ON courses.id = course_teacher.course_id
WHERE course_teacher.teacher_id = 44


4. Selezionare tutti gli studenti con i dati relativi al corso di laurea a cui
sono iscritti e il relativo dipartimento, in ordine alfabetico per cognome e
nome
SELECT students.name, students.surname, degrees.name AS corso_di_laurea, departments.name AS dipartimento
FROM students
INNER JOIN degrees ON students.degree_id = degrees.id
INNER JOIN departments ON degrees.department_id = departments.id
ORDER BY students.surname, students.name


5. Selezionare tutti i corsi di laurea con i relativi corsi e insegnanti

SELECT degrees.name AS corso_di_laurea, courses.name AS corso, teachers.name AS docente
FROM degrees
INNER JOIN courses ON degrees.id = courses.degree_id


6. Selezionare tutti i docenti che insegnano nel Dipartimento di
Matematica (54)
SELECT d.name AS DegreeName, 
       c.name AS CourseName, 
       t.name AS TeacherName
FROM degrees d
INNER JOIN courses c ON d.id = c.degree_id
INNER JOIN course_teacher ct ON c.id = ct.course_id
INNER JOIN teachers t ON ct.teacher_id = t.id
ORDER BY d.name, c.name;

7. BONUS: Selezionare per ogni studente il numero di tentativi sostenuti
per ogni esame, stampando anche il voto massimo. Successivamente,
filtrare i tentativi con voto minimo 18 considerando di avere 4 tabelle di riferimento(exams exam_student students).

SELECT 
  students.name, 
  students.surname, 
  exams.id AS esame, 
  COUNT(*) AS tentativi, 
  MAX(exam_student.vote) AS voto_massimo
FROM students
INNER JOIN exam_student ON students.id = exam_student.student_id
INNER JOIN exams ON exam_student.exam_id = exams.id
WHERE exam_student.vote >= 18
GROUP BY students.id, exams.id
ORDER BY students.surname, students.name;



