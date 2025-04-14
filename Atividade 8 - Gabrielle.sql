DROP DATABASE Escola;

CREATE DATABASE Escola;
USE Escola;

CREATE TABLE Curso ( 
Cod_curso CHAR (2) PRIMARY KEY NOT NULL,
Nome_do_Curso VARCHAR(60) NOT NULL,
Mensalidade NUMERIC (10,2) NOT NULL
);

CREATE TABLE Disciplina ( 
Cod_Disc VARCHAR (5) NOT NULL PRIMARY KEY,
Nome CHAR (30) NOT NULL, 
Numero_de_Crédito VARCHAR (1) NOT NULL,
Cod_curso char(2),
FOREIGN KEY (Cod_curso) REFERENCES Curso (Cod_curso)
);

CREATE TABLE Aluno (
RA CHAR (9) NOT NULL PRIMARY KEY,
RG CHAR (9) NOT NULL,
Nome VARCHAR (30) NOT NULL,
Cod_curso CHAR (2) NOT NULL,
FOREIGN KEY (Cod_curso) REFERENCES Curso (Cod_curso)
);


CREATE TABLE Boletim (
RA CHAR (9) NOT NULL,
Cod_Disc VARCHAR (4),
Nota DECIMAL (10,2) NOT NULL,
PRIMARY KEY (RA),
FOREIGN KEY (RA) REFERENCES Aluno (RA), 
FOREIGN KEY (Cod_Disc) REFERENCES Disciplina (Cod_Disc)
);

INSERT INTO Curso
(Cod_curso, Nome_do_Curso, Mensalidade)
VALUES
('AS',"Analise",100),
("CC","Ciencia da computação","950"),
("SI","Sistemas de informação","800");


INSERT INTO Disciplina
(Cod_Disc, Nome, Numero_de_Crédito)
VALUES
("BD","Banco de dados","4"),
("BDA","Banco de dados avançados","6"),
("BDOO","Banco de dados OOB","4"),
("DDS","sistemas de banco de dados","4"),
("BDB","Desenvolvimento banco de dados","6"),
("IBD","Introdução a banco de dados","2");

INSERT INTO Aluno
(RA, RG, NOME, Cod_curso)
VALUES
("45256","789562314","Bianca Maria Pedrosa", "SI"),
("44554","753198462","Tatiane Citton", "SI"),
("74587","147852369","Alexandre Pedrosa", "AS" ),
("14785","321654987","Alexandre Monteiro","AS"),
("14526","112456987","Marcia Ribeiro", "CC"),
("74586","778529636","Jussara Marandola","CC"),
("44556","554123698","Walter Rodrigues", "CC");


INSERT INTO Boletim
(RA, Nota)
VALUES
("45256","10.00"),
("44554","7.50"),
("74587","9.00"),
("14785","9.60"),
("14526","8.00"),
("74586","6.00");

select count(*) as total_disciplinas from Disciplina;
select count(*) as total_alunos from aluno;
select nome_do_curso from Curso;





