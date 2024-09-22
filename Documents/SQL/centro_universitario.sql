CREATE TABLE Alunos (
ra  varchar(10) PRIMARY KEY NOT NULL, 
nome char (40),
cpf CHAR(11) unique,
data_de_nascimento Date,
sexo varchar(1) CHECK (sexo IN ('M', 'F')),
escolaridade varchar(20))

CREATE TABLE Professores (
id varchar (10) PRIMARY KEY NOT NULL,
nome varchar (40),
cpf CHAR(11) unique, 
data_de_nascimento date,
sexo varchar(1) CHECK (sexo IN ('M', 'F')),
Titulação varchar (10)
)

CREATE TABLE Periodo_de_ofertas (
id_periodo SERIAL PRIMARY KEY , 
data_inicio DATE NOT NULL,
data_fim DATE NOT NULL
);

CREATE TABLE Curso (
id_Curso SERIAL PRIMARY KEY,
Nome VARCHAR(20),
Valor decimal (8 , 2),
Carga_horária INT,
Status_de_Ativação boolean,
ID_professor varchar(20),
ID_Periodo SERIAL,
FOREIGN KEY(ID_professor) REFERENCES Professores(id),
FOREIGN KEY(ID_Periodo) REFERENCES Periodo_de_ofertas(id_periodo));

CREATE TABLE Matrícula (
id_matrícula SERIAL PRIMARY KEY,
Data_matrícula date, 
ra_aluno varchar(10),
id_Curso_mat SERIAL,
N1 decimal (4,2),
N2 decimal (4,2),
NF decimal (4,2),
Aprovação boolean,
FOREIGN KEY(ra_aluno) REFERENCES Alunos(ra),
FOREIGN KEY(id_Curso_mat) REFERENCES Curso (id_Curso)
);

ALTER TABLE Professores 
add column Email varchar(50) NOT NULL

ALTER TABLE Alunos 
add column Email varchar(50) NOT NULL

CREATE INDEX Ind_CPF on Alunos(cpf);
CREATE INDEX Ind_Prof_CPF on Professores(cpf);

INSERT INTO Alunos VALUES
('e10000', 'Amanda Monteiro', '17963913737', '1999-10-16', 'F', 'Bacharel', 'amandamonteiro@unifaa.com'),
('e10001', 'Lucas Pereira', '17969812589', '1998-11-27', 'M', 'Licenciatura', 'lucaspereira@unifaa.com'),
('e10002', 'Felipe Alvez', '17852314752', '1998-05-30', 'M', 'Licenciatura', 'felipea@unifaa.com'),
('e10003', 'Maria Silva', '17984723145', '1997-03-14', 'F', 'Bacharel', 'mariasilva@unifaa.com'),
('e10004', 'João Souza', '17896325478', '1999-07-22', 'M', 'Licenciatura', 'joaosouza@unifaa.com'),
('e10005', 'Ana Costa', '17852147856', '2000-01-10', 'F', 'Bacharel', 'anacosta@unifaa.com'),
('e10006', 'Pedro Oliveira', '17965412398', '1998-09-08', 'M', 'Licenciatura', 'pedrooliveira@unifaa.com'),
('e10007', 'Carla Nunes', '17874526985', '1999-12-19', 'F', 'Bacharel', 'carlanunes@unifaa.com'),
('e10008', 'Marcos Lima', '17987451236', '1997-06-05', 'M', 'Licenciatura', 'marcoslima@unifaa.com'),
('e10009', 'Fernanda Alves', '17896541236', '1998-08-24', 'F', 'Bacharel', 'fernandaalves@unifaa.com'),
('e10010', 'Ricardo Mendes', '17985236987', '1999-02-28', 'M', 'Licenciatura', 'ricardomendes@unifaa.com'),
('e10011', 'Julia Ribeiro', '17893215487', '1997-11-11', 'F', 'Bacharel', 'juliaribeiro@unifaa.com'),
('e10012', 'Thiago Costa', '17974123698', '1998-04-15', 'M', 'Licenciatura', 'thiagocosta@unifaa.com');

INSERT INTO Professores VALUES
('P9000', 'Jorge Luiz', '14563820224', '1958-12-29', 'M', 'Mestre', 'jorge.luiz@unifaa'),
('P9001', 'Cláudia Ferreira', '15478230987', '1965-04-15', 'F', 'Doutora', 'claudia.ferreira@unifaa'),
('P9002', 'Roberto Souza', '14896532147', '1970-07-10', 'M', 'Mestre', 'roberto.souza@unifaa'),
('P9003', 'Fernanda Gomes', '15789412368', '1978-11-02', 'F', 'Doutora', 'fernanda.gomes@unifaa'),
('P9004', 'Paulo Nascimento', '14325879652', '1963-03-25', 'M', 'Mestre', 'paulo.nascimento@unifaa'),
('P9005', 'Marisa Lopes', '15987456321', '1972-09-16', 'F', 'Doutora', 'marisa.lopes@unifaa'),
('P9006', 'Carlos Oliveira', '14852697412', '1968-05-08', 'M', 'Doutor', 'carlos.oliveira@unifaa'),
('P9007', 'Tatiana Alves', '14587963245', '1975-02-20', 'F', 'Mestre', 'tatiana.alves@unifaa'),
('P9008', 'Luiz Henrique', '14652387954', '1960-10-30', 'M', 'Doutor', 'luiz.henrique@unifaa'),
('P9009', 'Sônia Machado', '15321478956', '1967-01-12', 'F', 'Mestre', 'sonia.machado@unifaa'),
('P9010', 'André Ramos', '14965873214', '1973-06-18', 'M', 'Doutor', 'andre.ramos@unifaa');


INSERT INTO Periodo_de_ofertas (data_inicio, data_fim) VALUES
('2024-01-02', '2024-06-30'),
('2024-07-01', '2024-12-31'),
('2023-01-01', '2023-06-30'),
('2023-07-01', '2023-12-31'),
('2022-01-01', '2022-06-30'),
('2022-07-01', '2022-12-31'),
('2021-01-01', '2021-06-30'),
('2021-07-01', '2021-12-31'),
('2020-01-01', '2020-06-30'),
('2020-07-01', '2020-12-31'),
('2019-01-01', '2019-06-30'),
('2019-07-01', '2019-12-31'),
('2018-01-01', '2018-06-30'),
('2018-07-01', '2018-12-31'),
('2017-01-01', '2017-06-30'),
('2017-07-01', '2017-12-31');

INSERT INTO Curso (Nome, Valor, Carga_horária, Status_de_Ativação, ID_professor, ID_Periodo) VALUES
('Engenharia Civil', 800.00, 80, TRUE, 'P9001', 1),
('Arquitetura', 750.00, 75, TRUE, 'P9002', 2),
('Medicina', 150.00, 120, TRUE, 'P9003', 3),
('Direito', 700.00, 90, TRUE, 'P9004', 4),
('Psicologia', 600.00, 70, TRUE, 'P9005', 5),
('Administração', 500.00, 60, TRUE, 'P9006', 6),
('Ciência da Computação', 650.00, 65, TRUE, 'P9007', 7),
('Biomedicina', 700.00, 85, FALSE, 'P9008', 8),
('Educação Física', 550.00, 55, TRUE, 'P9009', 9),
('Farmácia', 720.00, 80, TRUE, 'P9010', 10);


ALTER TABLE Curso
ALTER COLUMN Nome TYPE VARCHAR(50);

INSERT INTO Matrícula (Data_matrícula, ra_aluno, id_Curso_mat, N1, N2, NF, Aprovação) VALUES
('2024-01-15', 'e10000', 1, 7.5, 8.0, 7.75, TRUE), 
('2024-02-20', 'e10001', 2, 6.0, 7.0, 6.50, FALSE),  
('2024-03-05', 'e10002', 3, 8.5, 9.0, 8.75, TRUE),   
('2024-04-12', 'e10003', 4, 5.0, 6.0, 5.50, FALSE),  
('2024-05-22', 'e10004', 5, 9.0, 8.0, 8.50, TRUE),   
('2024-06-18', 'e10005', 6, 7.0, 6.5, 6.75, TRUE),   
('2024-07-30', 'e10006', 7, 4.5, 5.5, 5.00, FALSE),  
('2024-08-15', 'e10007', 8, 8.0, 9.0, 8.50, TRUE),   
('2024-09-25', 'e10008', 9, 6.5, 6.0, 6.25, FALSE),  
('2024-10-10', 'e10009', 10, 7.0, 8.5, 7.75, TRUE);  

UPDATE Professores
SET Titulação = 'Mestrado'
WHERE Titulação = 'Mestre';

SELECT * FROM Alunos



DELETE FROM Curso
WHERE ID_Periodo IN (
    SELECT id_periodo
    FROM Periodo_de_ofertas
    WHERE EXTRACT(YEAR FROM Data_inicio) < 2023
);

DELETE FROM Matrícula
WHERE id_Curso_mat IN (
    SELECT id_Curso
    FROM Curso
    WHERE ID_Periodo IN (
        SELECT id_periodo
        FROM Periodo_de_ofertas
        WHERE EXTRACT(YEAR FROM Data_inicio) < 2023
    )
);

DELETE FROM Periodo_de_ofertas
WHERE EXTRACT(YEAR FROM Data_inicio) < 2023;

SELECT ra, nome, email 
FROM Alunos
WHERE sexo = 'F'
ORDER BY nome;

SELECT id, nome, cpf
FROM Professores
WHERE Titulação IS NULL;

SELECT Alunos.ra, Alunos.nome, Alunos.cpf, Matrícula.Data_matrícula, Curso.nome AS nomeCurso, Curso.Carga_horária
FROM Alunos
JOIN Matrícula ON Alunos.ra = Matrícula.ra_aluno
JOIN Curso ON Matrícula.id_Curso_mat = Curso.id_curso
WHERE Curso.nome = 'Farmácia';

Select * from Alunos
Select * from Matrícula
Select * from Periodo_de_ofertas

ALTER TABLE Periodo_de_ofertas
DROP CONSTRAINT IF EXISTS periodo_de_ofertas_pkey; 

ALTER TABLE Periodo_de_ofertas
ALTER COLUMN id_periodo TYPE VARCHAR(11);

ALTER TABLE Curso
DROP CONSTRAINT IF EXISTS SERIAL;

ALTER TABLE Curso
ALTER COLUMN ID_Periodo TYPE VARCHAR(11);


ALTER TABLE Curso
DROP CONSTRAINT IF EXISTS curso_id_periodo_fkey;


ALTER TABLE Periodo_de_ofertas
ALTER COLUMN id_periodo TYPE VARCHAR(11);


ALTER TABLE Curso
ALTER COLUMN ID_Periodo TYPE VARCHAR(11);


ALTER TABLE Curso
ADD CONSTRAINT curso_id_periodo_fkey
FOREIGN KEY (ID_Periodo) REFERENCES Periodo_de_ofertas(id_periodo);

INSERT INTO Periodo_de_ofertas (data_inicio, data_fim) VALUES 
('2023-01-01', '2023-06-30'), 
('2023-07-01', '2023-12-31'), 
('2024-01-01', '2024-06-30');  

SELECT Curso.nome, Curso.Carga_horária, Curso.Valor, Professores.nome AS professorNome, Professores.Titulação
FROM Curso
JOIN Professores ON Curso.ID_professor = Professores.id
WHERE Curso.ID_Periodo = '1';  

SELECT Alunos.nome, Alunos.email
FROM Alunos
JOIN Matrícula ON Alunos.ra = Matrícula.ra_aluno
JOIN Curso ON Matrícula.id_Curso_mat = Curso.id_Curso
WHERE Curso.ID_professor = 'P9004'; 

SELECT Alunos.ra, Alunos.nome, Alunos.cpf, Curso.nome AS nomeCurso, Matrícula.NF AS notaFinal, 
       CASE 
           WHEN Matrícula.NF >= 7.0 THEN 'Aprovado' 
           ELSE 'Reprovado' 
       END AS aprovação
FROM Alunos
JOIN Matrícula ON Alunos.ra = Matrícula.ra_aluno
JOIN Curso ON Matrícula.id_Curso_mat = id_Curso
WHERE Matrícula.NF >= 7.0;  

SELECT Curso.nome AS nomeCurso, COUNT(Matrícula.id_matrícula) AS quantidadeAlunos
FROM Curso
JOIN Matrícula ON Curso.id_Curso = Matrícula.id_Curso_mat
WHERE Curso.ID_Periodo = '4' 
GROUP BY Curso.nome;

SELECT 
    MAX(Curso.Valor) AS cursoMaisCaro, 
    MIN(Curso.Valor) AS cursoMaisBarato, 
    AVG(Curso.Valor) AS valorMedio
FROM Curso;

SELECT AVG(Curso.Valor) AS ticketMedio
FROM Curso
WHERE Curso.ID_periodo = '1';  

SELECT Professores.nome, Professores.cpf
FROM Professores
WHERE Professores.id NOT IN (
    SELECT DISTINCT Curso.ID_professor
    FROM Curso
    JOIN Matrícula ON Curso.id_Curso = Matrícula.id_Curso_mat
    JOIN Alunos ON Matrícula.ra_aluno = Alunos.ra
    WHERE Alunos.cpf = Professores.cpf
);

WITH valorMedio AS (
    SELECT AVG(Curso.Valor) AS valorMedioCurso
    FROM Curso
)
SELECT Curso.nome, Curso.Valor
FROM Curso
JOIN valorMedio ON Curso.Valor > valorMedio.valorMedioCurso;


Select * from curso