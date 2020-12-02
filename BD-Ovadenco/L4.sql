-- 1. Aflafi toate datele despre grupele de studii de la facultate. 

SELECT * FROM grupe

-- 5. Sa se afi~eze lista studentilor al caror nume se termina in ,,u" 

SELECT * FROM studenti WHERE Nume_Student LIKE '%u'

-- 6. Afi~ati numele ~i prenumele primilor 5 studenti, care au obtinut note in ordine descrescatoare la al
-- doilea test de la disciplina Baze de date. Sa se foloseasca optiunea TOP ... WITH TIES. 


SELECT TOP(5)Nota, Nume_Student, Prenume_Student FROM studenti_reusita, studenti WHERE Tip_Evaluare = 'Testul 2'  ORDER BY Nota DESC 

-- 13. Aflati cursurile urmate de catre studentul Florea loan. 

SELECT DISTINCT Disciplina FROM discipline 
 INNER JOIN studenti_reusita ON discipline.Id_Disciplina = studenti_reusita.Id_Disciplina
 INNER JOIN studenti ON studenti_reusita.Id_Student = studenti.Id_Student
 WHERE Nume_Student = 'Florea' and Prenume_Student = 'Ioan'

-- 14. Aflati numele ~i prenumele studentilor, precum ~i cursurile promovate cu note mai mari de 8 la
-- examen. 

SELECT  DISTINCT Nume_Student , Prenume_Student , Disciplina    FROM  studenti
INNER JOIN studenti_reusita ON studenti.Id_Student = studenti_reusita.Id_Student 
INNER JOIN discipline ON studenti_reusita.Id_Disciplina = discipline.Id_Disciplina
WHERE Nota > 8 and Tip_Evaluare = 'Examen'

-- 18. Afi~ati numele ~i prenumele profesorilor, care au predat doar discipline cu o incarcare orara mai
--mica de 60 de ore.

SELECT DISTINCT Nume_Profesor , Prenume_Profesor FROM profesori
INNER JOIN studenti_reusita ON profesori.Id_Profesor = studenti_reusita.Id_Profesor
INNER JOIN discipline ON studenti_reusita.Id_Disciplina = discipline.Id_Disciplina 
WHERE Nr_Ore_plan_disciplina < 60

-- 25. in ce grupe de studii (Cod_ Grupa) figureaza mai mult de 24 de studenti?

SELECT DISTINCT Cod_Grupa  FROM grupe
INNER JOIN studenti_reusita ON grupe.Id_Grupa = studenti_reusita.Id_Grupa
INNER JOIN studenti ON studenti_reusita.Id_Student = studenti.Id_Student
GROUP BY Cod_Grupa  HAVING COUNT(DISTINCT studenti_reusita.Id_Student) > 24

-- 27. Afi~ati studentii (identificatorii) care au sustinut (evaluare examen) la toate disciplinele predate de
-- prof. lon

SELECT DISTINCT Nume_Student , Prenume_Student FROM profesori  
INNER JOIN studenti_reusita ON profesori.Id_Profesor = studenti_reusita.Id_Profesor
INNER JOIN studenti ON studenti_reusita.Id_Student = studenti.Id_Student
WHERE Prenume_Profesor LIKE 'Ion' AND Nota > 4 AND Tip_Evaluare = 'Examen'


-- 26. Gasiti numele, prenumele ~i adresele studentilor ~i ale profesorilor care locuiesc pe strada 31
-- August. SELECT DISTINCT Prenume_Student , Nume_student ,Adresa_Postala_Student FROM studentiINNER JOIN studenti_reusita ON studenti.Id_Student = studenti_reusita.Id_StudentINNER JOIN profesori ON studenti_reusita.Id_Profesor = profesori.Id_Profesor WHERE Adresa_Postala_Student LIKE '%31 august%' 
UNION
SELECT  Nume_Profesor, Prenume_Profesor, Adresa_Postala_Profesor FROM profesori
WHERE Adresa_Postala_Profesor LIKE '%31 august%'  
 --- сяоек! --- 
 --- CONCLUSION : By doing lab 4 i undestood how to use inner join , left join , right join , alter join .Also now i know how to use selection model.
 --- It will help in data analysis for my future job.
 --- яоюяханнннн!!!!!

