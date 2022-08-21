CREATE DATABASE bdEscola
GO
USE bdEscola
CREATE TABLE tbAluno(
	ra					INTEGER			NOT NULL
	, nome				VARCHAR(100)	NOT NULL
	, idade				INTEGER			NOT NULL  CHECK(idade > 0)
	PRIMARY KEY (ra)
);

CREATE TABLE tbDisciplina(
	codigo				INTEGER			NOT NULL
	, nome				VARCHAR(80)		NOT NULL
	, cargaHoraria		INTEGER			NOT NULL CHECK(cargaHoraria >= 32)
	PRIMARY KEY (codigo)
);
CREATE TABLE tbAlunoDisciplina(
	alunoRA				INTEGER			NOT NULL
	, disciplinaCodigo	INTEGER			NOT NULL
	PRIMARY KEY (alunoRA, disciplinaCodigo)
	CONSTRAINT fk_alunoDiscipinaAlunoRA FOREIGN KEY (alunoRA) REFERENCES tbAluno(ra)
	, CONSTRAINT fk_alunoDisciplinaDisciplinaCodigo FOREIGN KEY (disciplinaCodigo) REFERENCES tbDisciplina(codigo)
);
CREATE TABLE tbArea(
	id		INTEGER		NOT NULL
	, nome	VARCHAR(50) NOT NULL
	PRIMARY KEY (id)
);
CREATE TABLE tbCurso(
	codigo				INTEGER			NOT NULL
	, nome				VARCHAR(50)		NOT NULL 
	, areaId			INTEGER			NOT NULL
	PRIMARY KEY (codigo)
	CONSTRAINT fk_cursoArea FOREIGN KEY (areaId) REFERENCES tbArea(id)
);
CREATE TABLE tbCursoDisciplina(
	cursoCodigo			INTEGER			NOT NULL
	, disciplinaCodigo	INTEGER			NOT NULL
	PRIMARY KEY (cursoCodigo,disciplinaCodigo)
	CONSTRAINT fk_cursoDisciplinaCursoCodigo FOREIGN KEY (cursoCodigo) REFERENCES tbCurso(codigo)
	, CONSTRAINT fk_cursoDisciplinaDisciplinaCodigo FOREIGN KEY (disciplinaCodigo) REFERENCES tbDisciplina(codigo)
);
CREATE TABLE tbTitulacao(
	codigo				INTEGER			NOT NULL
	, titulo			VARCHAR(40)		NOT NULL
	PRIMARY KEY (codigo)
);
CREATE TABLE tbProfessor(
	registro			INTEGER			NOT NULL
	, nome				VARCHAR(100)	NOT NULL 
	, titulacaoCodigo	INTEGER			NOT NULL
	PRIMARY KEY (registro)
	CONSTRAINT fk_professorTitulacaoCodigo	FOREIGN KEY (titulacaoCodigo) REFERENCES tbTitulacao(codigo)
);
CREATE TABLE tbDisciplinaProfessor(
	disciplinaCodigo	INTEGER			NOT NULL
	, professorRegistro INTEGER			NOT NULL
	PRIMARY KEY (disciplinaCodigo,professorRegistro)
	CONSTRAINT fk_disciplinaProfessorDisciplinaCodigo FOREIGN KEY (disciplinaCodigo) REFERENCES tbDisciplina(codigo)
	, CONSTRAINT fk_disciplinaProfessorRegistro FOREIGN KEY (professorRegistro) REFERENCES tbProfessor(registro)
);

--==========================INSERTS==============----
INSERT INTO tbAluno(ra,nome,idade)
	VALUES
		(3416,'DIEGO PIOVESAN DE RAMOS',18)
		,(3423,'LEONARDO MAGALHÃES DA ROSA',17)
		,(3434,'LUIZA CRISTINA DE LIMA MARTINELI',20)
		,(3440,'IVO ANDRÉ FIGUEIRA DA SILVA',25)
		,(3443,'BRUNA LUISA SIMIONI',37)
		,(3448,'THAÍS NICOLINI DE MELLO',17)
		,(3457,'LÚCIO DANIEL TÂMARA ALVES',29)
		,(3459,'LEONARDO RODRIGUES',25)
		,(3465,'ÉDERSON RAFAEL VIEIRA',19)
		,(3466,'DAIANA ZANROSSO DE OLIVEIRA',21)
		,(3467,'DANIELA MAURER',23)
		,(3470,'ALEX SALVADORI PALUDO',42)
		,(3471,'VINÍCIUS SCHVARTZ',19)
		,(3472,'MARIANA CHIES ZAMPIERI',18)
		,(3482,'EDUARDO CAINAN GAVSKI',19)
		,(3483,'REDNALDO ORTIZ DONEDA',20)
		,(3499,'MAYELEN ZAMPIERON',22)
GO
INSERT INTO tbDisciplina(codigo,nome,cargaHoraria)
	VALUES
		(1,'Laboratório de Banco de Dados',80)
		,(2,'Laboratório de Engenharia de Software',80)
		,(3,'Programação Linear e Aplicações',80)
		,(4,'Redes de Computadores',80)
		,(5,'Segurança da informação',40)
		,(6,'Teste de Software',80)
		,(7,'Custos e Tarifas Logísticas',80)
		,(8,'Gestão de Estoques',40)
		,(9,'Fundamentos de Marketing',40)
		,(10,'Métodos Quantitativos de Gestão',80)
		,(11,'Gestão do Tráfego Urbano',80)
		,(12,'Sistemas de Movimentação e Transporte',40)
GO
INSERT INTO tbTitulacao(codigo,titulo)
	VALUES
		(1,'Especialista')
		,(2,'Mestre')
		,(3,'Doutor')
GO
INSERT INTO tbProfessor(registro,nome,titulacaoCodigo)
	VALUES
		(1111,'Leandro',2)
		,(1112,'Antonio',2)
		,(1113,'Alexandre',3)
		,(1114,'Wellington',2)
		,(1115,'Luciano',1)
		,(1116,'Edson',2)
		,(1117,'Ana',2)
		,(1118,'Alfredo',1)
		,(1119,'Celio',2)
		,(1120,'Dewar',3)
		,(1121,'Julio',1)
GO
INSERT INTO tbArea(id,nome)
	VALUES
		(1,'Ciências da Computação')
		,(2,'Engenharia Civil')
GO
INSERT INTO tbCurso(codigo,nome,areaId)
	VALUES
		(1,'ADS',1)
		,(2,'Logística',2)
GO
INSERT INTO tbAlunoDisciplina(disciplinaCodigo,alunoRA)
	VALUES
		(1,3416)
		,(4,3416)
		,(1,3423)
		,(2,3423)
		,(5,3423)
		,(6,3423)
		,(2,3434)
		,(5,3434)
		,(6,3434)
		,(1,3440)
		,(5,3443)
		,(6,3443)
		,(4,3448)
		,(5,3448)
		,(6,3448)
		,(2,3457)
		,(4,3457)
		,(5,3457)
		,(6,3457)
		,(1,3459)
		,(6,3459)
		,(7,3465)
		,(11,3465)
		,(8,3466)
		,(11,3466)
		,(8,3467)
		,(12,3467)
		,(8,3470)
		,(9,3470)
		,(11,3470)
		,(12,3470)
		,(7,3471)
		,(7,3472)
		,(12,3472)
		,(9,3482)
		,(11,3482)
		,(8,3483)
		,(11,3483)
		,(12,3483)
		,(8,3499)

INSERT INTO tbDisciplinaProfessor(disciplinaCodigo,professorRegistro)
	VALUES
		(1,1111)
		,(2,1112)
		,(3,1113)
		,(4,1114)
		,(5,1115)
		,(6,1116)
		,(7,1117)
		,(8,1118)
		,(9,1117)
		,(10,1119)
		,(11,1120)
		,(12,1121)

INSERT INTO tbCursoDisciplina(disciplinaCodigo,cursoCodigo)
	VALUES
		(1,1)
		,(2,1)
		,(3,1)
		,(4,1)
		,(5,1)
		,(6,1)
		,(7,2)
		,(8,2)
		,(9,2)
		,(10,2)
		,(11,2)
		,(12,2)

--============================CONSULTAS=================
--1- Como fazer as listas de chamadas, com RA e nome por disciplina ?	
SELECT 
	al.ra AS RA
	,al.nome AS Nome 
FROM tbAluno AS al
	INNER JOIN tbAlunoDisciplina AS ad
		ON al.ra = ad.alunoRA
	INNER JOIN tbDisciplina AS d
		ON d.codigo = ad.disciplinaCodigo
WHERE d.nome = 'Laboratório de Banco de Dados'
ORDER BY al.nome

--2- Fazer uma pesquisa que liste o nome das disciplinas e o nome dos professores que as ministram
SELECT  
	d.nome AS 'Disciplina'
	,p.nome AS 'Nome do professor'
FROM tbProfessor AS p
	INNER JOIN tbDisciplinaProfessor AS dp
		ON p.registro = dp.professorRegistro
	INNER JOIN tbDisciplina AS d
		ON d.codigo = dp.disciplinaCodigo
ORDER BY d.nome
--3- Fazer uma pesquisa que , dado o nome de uma disciplina, retorne o nome do curso			
SELECT 
	c.nome AS 'Nome do Curso'
FROM tbCurso as c
	INNER JOIN tbCursoDisciplina as cd
		ON c.codigo = cd.cursoCodigo
	INNER JOIN tbDisciplina as d
		ON d.codigo = cd.disciplinaCodigo
WHERE d.nome = 'Fundamentos de Marketing'
--4- Fazer uma pesquisa que , dado o nome de uma disciplina, retorne sua área	
SELECT 
	a.nome
FROM tbArea AS a
	INNER JOIN tbCurso AS c
		ON c.areaId = a.id
	INNER JOIN tbCursoDisciplina as cd
		ON cd.cursoCodigo = c.codigo
	INNER JOIN tbDisciplina as d
		ON d.codigo = cd.disciplinaCodigo
WHERE d.nome = 'Laboratório de Banco de Dados'
--5- Fazer uma pesquisa que , dado o nome de uma disciplina, retorne o título do professor que a ministra	
SELECT 
	t.titulo AS 'Título do professor'
FROM tbTitulacao as t
	INNER JOIN tbProfessor AS p
		ON p.titulacaoCodigo = t.codigo
	INNER JOIN tbDisciplinaProfessor AS dp
		ON dp.professorRegistro = p.registro
	INNER JOIN tbDisciplina AS d
		ON d.codigo = dp.disciplinaCodigo
WHERE d.nome = 'Redes de Computadores'
--6- Fazer uma pesquisa que retorne o nome da disciplina e quantos alunos estão matriculados em cada uma delas	
SELECT 
	d.nome AS Disciplina
	, count(ad.alunoRA) AS 'Quantidade de alunos matriculados'
FROM tbDisciplina AS d
	INNER JOIN tbAlunoDisciplina AS ad
		ON ad.disciplinaCodigo = d.codigo
GROUP BY ad.disciplinaCodigo,d.nome
ORDER BY [Quantidade de alunos matriculados] DESC
--7- Fazer uma pesquisa que, dado o nome de uma disciplina, retorne o nome do professor.  
--Só deve retornar de disciplinas que tenham, no mínimo, 5 alunos matriculados		
SELECT
	CASE WHEN (count(ad.alunoRA) > 4)
		THEN
			p.nome
		ELSE
			'A disciplina possui menos de 5 alunos matriculados'
	END AS resultado
FROM tbProfessor AS p
	INNER JOIN tbDisciplinaProfessor AS dp
		ON dp.professorRegistro = p.registro
	INNER JOIN tbDisciplina AS d
		ON d.codigo = dp.disciplinaCodigo
	INNER JOIN tbAlunoDisciplina AS ad
		ON ad.disciplinaCodigo = d.codigo
WHERE d.nome = 'Laboratório de Engenharia de Software'
GROUP BY p.nome

--8- Fazer uma pesquisa que retorne o nome do curso e a quatidade de professores cadastrados que ministram 
--aula nele. A coluna de ve se chamar quantidade								
SELECT
	c.nome
	, count(DISTINCT dp.professorRegistro) AS 'quantidade'
FROM tbCurso AS c
	INNER JOIN tbCursoDisciplina AS cd
		ON cd.cursoCodigo = c.codigo
	INNER JOIN tbDisciplina AS d
		ON d.codigo = cd.disciplinaCodigo
	INNER JOIN tbDisciplinaProfessor AS dp
		ON dp.disciplinaCodigo = d.codigo
GROUP BY c.nome