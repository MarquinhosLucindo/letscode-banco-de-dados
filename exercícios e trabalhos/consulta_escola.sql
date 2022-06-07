select *
from aluno;
--a. Produza um relatório que contenha os dados dos alunos matriculados em todos os cursos oferecidos pela escola.
SELECT c.nome, a.nome, a.endereco, a.telefone, a.data_nasc, a.cpf
FROM aluno AS a 
INNER JOIN matricula AS m ON a.cpf = m.cpf_aluno_fk
INNER JOIN curso as c ON m.curso_id_fk = c.curso_id;


--b. Produza um relatório com os dados de todos os cursos, com suas respectivas disciplinas, oferecidos pela escola.
SELECT c.curso_id, c.nome as nome_curso , d.nome as nome_disc, c.descricao, c.codigo_dpto_fk
FROM curso AS c 
INNER JOIN compoe AS co ON c.curso_id = co.curso_id_fk
INNER JOIN disciplina as d ON co.disciplina_id_fk = d.disciplina_id;


--c. Produza um relatório que contenha o nome dos alunos e as disciplinas em que estão matriculados.
SELECT a.nome, d.nome as disciplina, a.endereco, a.telefone, a.data_nasc, a.cpf
FROM aluno AS a 
INNER JOIN cursa AS c ON a.cpf = c.cpf_aluno_fk
INNER JOIN disciplina as d ON c.disciplina_id_fk = d.disciplina_id;


--d. Produza um relatório com os dados dos professores e as disciplinas que ministram.
SELECT p.matricula_professor, p.nome as professor, d.nome as disciplina, p.endereco, p.telefone, p.data_nasc, p.data_contratacao
FROM disciplina AS d 
INNER JOIN professor as p ON d.matricula_prof_fk = p.matricula_professor;


--e. Produza um relatório com os nomes das disciplinas e seus pré-requisitos.
SELECT disciplina_id, d.nome as disciplina
FROM disciplina AS d
INNER JOIN pre_req as p ON d.disciplina_id = p.disciplina_id_fk;

SELECT disciplina_id, d.nome as disciplina_dependencia
FROM disciplina AS d
INNER JOIN pre_req as p ON d.disciplina_id = p.dependencia_disciplina_id_fk;

--f. Produza um relatório com a média de idade dos alunos matriculados em cada curso.
SELECT AVG(date_part('year', current_date) - date_part('year', data_nasc))
FROM aluno AS a 
INNER JOIN matricula AS m ON a.cpf = m.cpf_aluno_fk
INNER JOIN curso as c ON m.curso_id_fk = c.curso_id;

--g. Produza um relatório com os cursos oferecidos por cada departamento.
SELECT c.nome as curso, d.nome as departamento
FROM curso AS c 
JOIN departamento as d ON c.codigo_dpto_fk = d.departamento_id;


