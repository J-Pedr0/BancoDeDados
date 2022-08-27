--criação de schema para teste
create schema turma8;
--drop schema turma8;

--cria tabela aluno
create table aluno(
	alu_tx_nome varchar(50) not null,
	alu_int_idade int4 not null,
	alu_tx_endereco varchar(100) not null
);

--cria tabela disciplina
create table disciplina(
	dis_cd_id serial not null,
	dis_tx_nome varchar(50) not null,
	primary key(dis_cd_id)
);


--remove a restrição not null na coluna idade
alter table aluno alter column alu_int_idade drop not null;


--adiciona a restrição not null na coluna idade
alter table aluno alter column alu_int_idade set not null;


--insere uma coluna ativo com tipo boolean na tabela aluno
alter table aluno add alu_bl_ativo boolean;


--sql insert na tabela aluno
INSERT INTO aluno
(alu_tx_nome, alu_int_idade, alu_tx_endereco, alu_bl_ativo)
VALUES('Rodolfo', 21, 'Rua A', true);
	  ('Maria', 28, 'Rua B', true)
	  ('Ana', 28, 'Rua C', true)
	  ('Júlia', 42, 'Rua D', false)
	  ('Henrique', 35, 'Rua E', false);

--sql alter para chave primária
alter table aluno add alu_cd_id serial not null;
alter table aluno add constraint pk_aluno primary key(alu_cd_id);


--sql alter para chave estrangeira
alter table disciplina add alu_cd_id int4 not null;
alter table disciplina add constraint fk_disciplina 
	foreign key(alu_cd_id) references aluno(alu_cd_id);


--sql update 
update aluno set alu_tx_endereco = 'Rua Borges'
	where alu_cd_id = 1;
update aluno set alu_tx_endereco = 'Rua Borges'
	where alu_tx_nome = 'Ana';

--sql update SEM WHERE
update aluno set alu_tx_endereco = 'Rua Y';
	
--sql delete 
delete from aluno where alu_cd_id = 3;

--sql insert na tabela disciplina
INSERT INTO disciplina
(dis_tx_nome, alu_cd_id)
VALUES('Banco de Dados', 2),
	  ('Lógica de Programação', 1),
	  ('API', 2),
	  ('Banco de Dados', 4),
	  ('Lógica de Programação', 4);