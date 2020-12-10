use universitatea
ALTER SCHEMA dbo TRANSFER studenti.studenti;
ALTER SCHEMA dbo TRANSFER studenti.studenti_reusita;
DROP SCHEMA IF EXISTS studenti;
go
CREATE SCHEMA cadre_didactice;
go
CREATE SCHEMA plan_studii;
go
CREATE SCHEMA schema_studenti;
go
ALTER SCHEMA cadre_didactice TRANSFER dbo.profesori;
go
ALTER SCHEMA plan_studii TRANSFER dbo.orarul;
ALTER SCHEMA plan_studii TRANSFER dbo.discipline;
go
ALTER SCHEMA schema_studenti TRANSFER dbo.studenti;
ALTER SCHEMA schema_studenti TRANSFER dbo.studenti_reusita;
go

--Sarcina 6

select * from plan_studii.discipline where DATALENGTH(Disciplina)>20
go

select DISTINCT Cod_Grupa,studenti.Nume_Student,studenti.Prenume_Student,studenti.Adresa_Postala_Student from grupe
inner join schema_studenti.studenti_reusita on grupe.Id_Grupa = studenti_reusita.Id_Grupa 
inner join schema_studenti.studenti on studenti_reusita.Id_Student = studenti.Id_Student
where studenti.Adresa_Postala_Student like '%31 August%'
go

select Distinct Nume_Student,Prenume_Student,Adresa_Postala_Student from schema_studenti.studenti
inner join schema_studenti.studenti_reusita on studenti_reusita.Id_Student = studenti.Id_Student
inner join grupe on grupe.Id_Grupa = studenti_reusita.Id_Grupa
where Adresa_Postala_Student like '%31 august%' 
UNION
select  Nume_Profesor, Prenume_Profesor, Adresa_Postala_Profesor from cadre_didactice.profesori
where Adresa_Postala_Profesor like '%31 august%'
go

--Sarcina 7

Create SYNONYM profi for cadre_didactice.profesori;
go
CREATE SYNONYM stud for schema_studenti.studenti;
go
CREATE SYNONYM stud_reusita for schema_studenti.studenti_reusita;
go
CREATE SYNONYM lectii for plan_studii.discipline;
go
CREATE SYNONYM orar for plan_studii.orarul;
go
--interogari modificate
select * from lectii where DATALENGTH(Disciplina)>20
go

select DISTINCT Cod_Grupa,stud.Nume_Student,stud.Prenume_Student,stud.Adresa_Postala_Student from grupe
inner join stud_reusita on grupe.Id_Grupa = stud_reusita.Id_Grupa 
inner join stud on stud_reusita.Id_Student = stud.Id_Student
where stud.Adresa_Postala_Student like '%31 August%'
go

select Distinct Nume_Student,Prenume_Student,Adresa_Postala_Student from stud
inner join stud_reusita on stud_reusita.Id_Student = stud.Id_Student
inner join grupe on grupe.Id_Grupa = stud_reusita.Id_Grupa
where Adresa_Postala_Student like '%31 august%' 
UNION
select  Nume_Profesor, Prenume_Profesor, Adresa_Postala_Profesor from profi
where Adresa_Postala_Profesor like '%31 august%'
go
