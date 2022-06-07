CREATE DATABASE escola WITH OWNER = 'postgres';
	
	
CREATE TABLE aluno(
	cpf TEXT PRIMARY KEY,
	nome VARCHAR(100) NOT NULL,
	endereco TEXT,
	telefone TEXT,
	data_nasc DATE
);


CREATE TABLE departamento(
	departamento_id SERIAL PRIMARY KEY,
	nome VARCHAR(100) NOT NULL		
);


CREATE TABLE professor(
	matricula_professor SERIAL PRIMARY KEY,
	nome VARCHAR(100) NOT NULL,
	endereco TEXT,
	telefone TEXT,
	data_nasc DATE,
	departamento_id_fk INT references departamento(departamento_id),
	data_contratacao DATE
);



CREATE TABLE disciplina(
	disciplina_id SERIAL PRIMARY KEY,
	nome TEXT,
	qtde_creditos INT,
	matricula_prof_fk INT references professor(matricula_professor)	
);


CREATE TABLE cursa(
	cpf_aluno_fk TEXT references aluno(cpf),
	disciplina_id_fk INT references disciplina(disciplina_id)		
);


CREATE TABLE curso(
	curso_id SERIAL PRIMARY KEY,
	nome VARCHAR(100) NOT NULL,
	descricao VARCHAR(200) NOT NULL,
	codigo_dpto_fk int references departamento(departamento_id)	
);


CREATE TABLE compoe(
	curso_id_fk INT references curso(curso_id),
	disciplina_id_fk INT references disciplina(disciplina_id)		
);


CREATE TABLE matricula(
	curso_id_fk INT references curso(curso_id),
	cpf_aluno_fk TEXT references aluno(cpf),
	data_matricula DATE	
);


CREATE TABLE pre_req(
	discilina_id_fk INT references disciplina(disciplina_id),
	dependencia_disciplina_id_fk INT references disciplina(disciplina_id)		
);

copy aluno from 'C:\Users\Public\copy\aluno.csv'
delimiter ',' csv;

copy departamento from 'C:\Users\Public\copy\departamento.csv'
delimiter ',' csv;

copy professor from 'C:\Users\Public\copy\professor.csv'
delimiter ',' csv;

copy disciplina from 'C:\Users\Public\copy\disciplina.csv'
delimiter ',' csv;

copy cursa from 'C:\Users\Public\copy\cursa_disc.csv'
delimiter ',' csv;

copy curso from 'C:\Users\Public\copy\curso.csv'
delimiter ',' csv;

copy compoe from 'C:\Users\Public\copy\compoe_curso.csv'
delimiter ',' csv;

copy matricula from 'C:\Users\Public\copy\matricula_aluno.csv'
delimiter ',' csv;

copy pre_req from 'C:\Users\Public\copy\pre_req.csv'
delimiter ',' csv;





