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

6. Selezionare tutti i docenti che insegnano nel Dipartimento di
Matematica (54)

7. BONUS: Selezionare per ogni studente il numero di tentativi sostenuti
per ogni esame, stampando anche il voto massimo. Successivamente,
filtrare i tentativi con voto minimo 18.