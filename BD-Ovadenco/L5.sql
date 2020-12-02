--Laborator Nr.5 Bandalac Sergiu FAF-193

-- sarcina 1
DECLARE @N1 INT, @N2 INT, @N3 INT;
DECLARE @MAI_MARE INT;
SET @N1 = 60 * RAND(); 
SET @N2 = 60 * RAND(); 
SET @N3 = 60 * RAND(); 
 IF (@N1>@N2) AND (@N1>@N3) 
	SET @MAI_MARE = @N1;
ELSE
IF (@N2>@N1) AND (@N2>@N3) 
	SET @MAI_MARE = @N2;
ELSE
IF (@N3>@N1) AND (@N3>@N2) 
	SET @MAI_MARE = @N3;
PRINT @N1; 
PRINT @N2; 
PRINT @N3; 
PRINT 'Mai mare = ' + CAST(@MAI_MARE AS VARCHAR(2)); 
GO

-- sarcina 2
use universitatea
go
DECLARE @var INT;
DECLARE @nume varchar(20);
DECLARE @prenume varchar(20);
DECLARE @count INT;
SET @count = 1;
DECLARE @count1 INT;
SET @count1 = 1;
WHILE (@count!=11)
BEGIN
SELECT TOP(@count1) @var = Nota, @nume = Nume_Student, @prenume = Prenume_Student
FROM studenti_reusita
inner join studenti on studenti.Id_Student = studenti_reusita.Id_Student
inner join discipline on discipline.Id_Disciplina = studenti_reusita.Id_Disciplina
where Disciplina like '%Baze de date%' and Tip_Evaluare like 'Testul 1'
IF (@var != 6) and (@var != 8)
BEGIN
PRINT @nume + ' ' + @prenume +' ' + CAST(@var as varchar);
SET @count =@count + 1;
END
SET @count1 =@count1 + 1;
END

--verificare sarcina 2

SELECT TOP(10) Nume_Student, Prenume_Student, Nota from studenti
inner join studenti_reusita on studenti.Id_Student = studenti_reusita.Id_Student
inner join discipline on discipline.Id_Disciplina = studenti_reusita.Id_Disciplina
where Disciplina like '%Baze de date%' and Tip_Evaluare like 'Testul 1' and Nota!=6 and Nota!=8

--sarcina 3

DECLARE @N1 INT, @N2 INT, @N3 INT;
DECLARE @MAI_MARE INT;
SET @N1 = 60 * RAND(); 
SET @N2 = 60 * RAND(); 
SET @N3 = 60 * RAND(); 

SET @MAI_MARE = (SELECT
CASE 
	WHEN @N1>=@N2 AND @N1>=@N3 THEN @N1
	WHEN @N2>=@N1 AND @N2>=@N3 THEN @N2
	WHEN @N3>=@N2 AND @N3>=@N1 THEN @N3
END)

PRINT @N1; 
PRINT @N2; 
PRINT @N3; 
PRINT 'Mai mare = ' + CAST(@MAI_MARE AS VARCHAR(2)); 
GO

-- sarcina 4

-- sracina 1 modificata cu try catch
BEGIN TRY  
     DECLARE @N1 INT, @N2 INT, @N3 INT;
DECLARE @MAI_MARE INT;
SET @N1 = 60 * RAND(); 
SET @N2 = 60 * RAND(); 
SET @N3 = 60 * RAND(); 
 IF (@N1>=@N2) AND (@N1>=@N3) 
	SET @MAI_MARE = @N1;
ELSE
IF (@N2>=@N1) AND (@N2>=@N3) 
	SET @MAI_MARE = @N2;
ELSE
IF (@N3>=@N1) AND (@N3>=@N2) 
	SET @MAI_MARE = @N3;
PRINT @N1; 
PRINT @N2; 
PRINT @N3; 
PRINT 'Mai mare = ' + CAST(@MAI_MARE AS VARCHAR(2)); 
END TRY  
BEGIN CATCH  
PRINT ERROR_NUMBER() 
PRINT ERROR_SEVERITY() 
PRINT ERROR_STATE() 
PRINT ERROR_PROCEDURE() 
PRINT ERROR_LINE() 
PRINT ERROR_MESSAGE() 
END CATCH

-- sarcina 1 modificata cu raiseerror

SET @N1 = 60 * RAND(); 
SET @N2 = 60 * RAND(); 
SET @N3 = 60 * RAND(); 
 IF (@N1>=@N2) AND (@N1>=@N3) 
	SET @MAI_MARE = @N1;
ELSE
IF (@N2>=@N1) AND (@N2>=@N3) 
	SET @MAI_MARE = @N2;
ELSE
IF (@N3>=@N1) AND (@N3>=@N2) 
	SET @MAI_MARE = @N3;
ELSE 
RAISERROR ('Numerele nu corespund', 12, 1) 
PRINT @N1; 
PRINT @N2; 
PRINT @N3; 
PRINT 'Mai mare = ' + CAST(@MAI_MARE AS VARCHAR(2)); 

-- sarcina 2 modificata cu try catch

BEGIN TRY
use universitatea
DECLARE @var INT;
DECLARE @nume varchar(20);
DECLARE @prenume varchar(20);
DECLARE @count INT;
SET @count = 1;
DECLARE @count1 INT;
SET @count1 = 1;
WHILE (@count!=11)
BEGIN
SELECT TOP(@count1) @var = Nota, @nume = Nume_Student, @prenume = Prenume_Student
FROM studenti_reusita
inner join studenti on studenti.Id_Student = studenti_reusita.Id_Student
inner join discipline on discipline.Id_Disciplina = studenti_reusita.Id_Disciplina
where Disciplina like '%Baze de date%' and Tip_Evaluare like 'Testul 1'
IF (@var != 6) and (@var != 8)
BEGIN
SELECT Nume_Student, Prenume_Student, Nota from studenti
inner join studenti_reusita on studenti.Id_Student = studenti_reusita.Id_Student
inner join discipline on discipline.Id_Disciplina = studenti_reusita.Id_Disciplina
where Disciplina like '%Baze de date%' and Tip_Evaluare like 'Testul 1' and Nota = @var and Nume_Student = @nume and Prenume_Student = @prenume
SET @count =@count + 1;
END
SET @count1 =@count1 + 1;
END
END TRY
BEGIN CATCH
PRINT ERROR_NUMBER() 
PRINT ERROR_SEVERITY() 
PRINT ERROR_STATE() 
PRINT ERROR_PROCEDURE() 
PRINT ERROR_LINE() 
PRINT ERROR_MESSAGE() 
END CATCH