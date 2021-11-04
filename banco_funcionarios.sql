CREATE DATABASE jonns;

USE jonns;

CREATE TABLE tb_setor (
	codigo int(11) primary key not null auto_increment,
	nome varchar(45) not null
);


CREATE TABLE tb_funcionario (
	codigo int(11) primary key not null auto_increment, 
	nome varchar(45) not null,
	sobrenome varchar(45) not null, 
	cpf int(11) unique not null, 
	rg int(11) unique not null,
	codigo_setor int(11),

	 foreign key (codigo_setor) references tb_setor(codigo)
);

CREATE TABLE tb_dependentes (
	codigo int(11) primary key not null auto_increment, 
	nome varchar(45) not null,
	sobrenome varchar(45) not null, 
	cpf int(11) unique not null, 
	rg varchar(11) unique not null,
	codigo_funcionario int(11),

	foreign key (codigo_funcionario) references tb_funcionario(codigo)
);

CREATE TABLE tb_telefone_funcionario (
	codigo int(11) primary key not null auto_increment, 
	codigo_area int(45) not null,
	numero varchar(45) not null, 
	codigo_funcionario int(11),

	foreign key (codigo_funcionario) references tb_funcionario(codigo)
);

CREATE TABLE tb_clientes (
	codigo int(11) primary key not null auto_increment, 
	nome varchar(45) not null,
	sobrenome varchar(45) not null, 
	cpf int(11) unique not null, 
	rg int(11) unique not null
);

CREATE TABLE tb_pedidos (
	nr_pedido int(11) primary key not null, 
	cpf_cliente int(11) not null,

	foreign key (cpf_cliente) references tb_clientes(cpf)
);

CREATE TABLE tb_emails (
	codigo int(11) primary key not null auto_increment, 
	email varchar(45) not null,
	codigo_cliente int(11),

	foreign key (codigo_cliente) references tb_clientes(codigo)
);


CREATE TABLE tb_enderecos (
	codigo int(11) primary key not null auto_increment, 
	logradouro varchar(45) not null,
	bairro varchar(45) not null,
	estado varchar(45) not null,
	cep int(11) not null
);

CREATE TABLE tb_aux_cliente_endereco (
	codigo_cliente int(11) not null,
    codigo_endereco int(11) not null,
    
    foreign key (codigo_cliente) references tb_clientes(codigo),
    foreign key (codigo_endereco) references tb_enderecos(codigo)
);

CREATE TABLE tb_aux_funcionario_endereco (
	codigo_funcionario int(11) not null,
	codigo_endereco int(11) not null,

	foreign key (codigo_funcionario) references tb_funcionario(codigo),
	foreign key (codigo_endereco) references tb_enderecos(codigo)
);

CREATE TABLE tb_atendimento_funcionarios_cliente (
	data_atendimento DATE not null,
    codigo_funcionario int(11) not null,
	codigo_cliente int(11) not null,

	foreign key (codigo_funcionario) references tb_funcionario(codigo),
	foreign key (codigo_cliente) references tb_clientes(codigo)
);

insert into tb_setor (nome) values ('Vendas');
insert into tb_setor (nome) values ('Marketing');
insert into tb_setor (nome) values ('Financeiro');


insert into tb_setor (nome) values ('Informatica'),
                                   ('Recursos Humanos'),
                                   ('Diretoria');

insert into tb_funcionario (nome, sobrenome, rg, cpf, codigo_setor) values ('Rafael', 'Silveira', 1111, 1111, 1),
																			('Pedro', 'Paliardi', 2222, 2222, 1),
																			('Jose', 'Silveira', 3333, 3333, 2),
																			('Augusto', 'Costa', 4444, 4444, 2),
																			('Rafael', 'Antunes', 5555, 5555, 3),
																			('Roberto', 'Camargo', 6666, 6666, 3),
																			('Joana', 'Nunes', 7777, 7777, 4),
																			('Manuela', 'Pereira', 8888, 8888, 5),
																			('Rafael', 'Montenegro', 9999, 9999, 6);
                                 
insert into tb_dependentes (nome, sobrenome, rg, cpf, codigo_funcionario) values ('Bruno', 'Nogueira', 1111, 1111, 1),
																				('leonardo', 'Paliardi', 2222, 2222, 1),
																				('Rafael', 'Silveira', 3333, 3333, 3),
																				('Renata', 'Silveira', 4444, 4444, 3),
																				('Joao', 'Costa', 5555, 5555, 4),
																				('Antonela', 'Antunes', 6666, 6666, 4),
																				('Manuela', 'Camargo', 7777, 7777, 5),
																				('Leandro', 'Camargo', 8888, 8888, 5),
																				('Douglas', 'Montenegro', 9999, 9999, 8);
INSERT INTO tb_dependente(nome, sobrenome, rg, cpf, codigo_funcionario,gays) values ('Ismael', 'mamel', 2299841, 00697463117, 8, 'BICHA RODA BAIANA');
																			
 # ALTERAR ITENS DA TABELA:
 
update tb_dependentes set sobrenome = 'Silva' where codigo_funcionario = 1;

# SELECIONAR TABELA INTEIRA

select * from tb_funcionario;


INSERT INTO `jonns`.`tb_endereco` (`logradouro`, `bairro`, `estado`, `cep`) VALUES ('Endereco1', 'Bairro1', 'Estado', '1234311');
INSERT INTO `jonns`.`tb_endereco` (`logradouro`, `bairro`, `estado`, `cep`) VALUES ('Endereco2', 'Bairro2', 'Estado', '32112');
INSERT INTO `jonns`.`tb_endereco` (`logradouro`, `bairro`, `estado`, `cep`) VALUES ('Endereco3', 'Bairro3', 'Estado', '12331');
INSERT INTO `jonns`.`tb_endereco` (`logradouro`, `bairro`, `estado`, `cep`) VALUES ('Endereco4', 'Bairro4', 'Estado', '54889');
INSERT INTO `jonns`.`tb_endereco` (`logradouro`, `bairro`, `estado`, `cep`) VALUES ('Endereco5', 'Bairro4', 'Estado', '579624');
INSERT INTO `jonns`.`tb_endereco` (`logradouro`, `bairro`, `estado`, `cep`) VALUES ('Endereco6', 'Bairro5', 'Estado', '57824');
INSERT INTO `jonns`.`tb_endereco` (`logradouro`, `bairro`, `estado`, `cep`) VALUES ('Endereco7', 'Bairro5', 'Estado', '78932');
INSERT INTO `jonns`.`tb_endereco` (`logradouro`, `bairro`, `estado`, `cep`) VALUES ('Endereco8', 'Bairro6', 'Estado', '65989');
INSERT INTO `jonns`.`tb_endereco` (`logradouro`, `bairro`, `estado`, `cep`) VALUES ('Endereco9', 'Bairro6', 'Estado', '65798');

INSERT INTO `jonns`.`tb_aux_funcionario_endereco` (`codigo_funcionario`, `codigo_endereco`) VALUES ('1', '1');
INSERT INTO `jonns`.`tb_aux_funcionario_endereco` (`codigo_funcionario`, `codigo_endereco`) VALUES ('3', '2');
INSERT INTO `jonns`.`tb_aux_funcionario_endereco` (`codigo_funcionario`, `codigo_endereco`) VALUES ('4', '3');
INSERT INTO `jonns`.`tb_aux_funcionario_endereco` (`codigo_funcionario`, `codigo_endereco`) VALUES ('5', '4');
INSERT INTO `jonns`.`tb_aux_funcionario_endereco` (`codigo_funcionario`, `codigo_endereco`) VALUES ('6', '5');
INSERT INTO `jonns`.`tb_aux_funcionario_endereco` (`codigo_funcionario`, `codigo_endereco`) VALUES ('7', '6');
INSERT INTO `jonns`.`tb_aux_funcionario_endereco` (`codigo_funcionario`, `codigo_endereco`) VALUES ('8', '7');
INSERT INTO `jonns`.`tb_aux_funcionario_endereco` (`codigo_funcionario`, `codigo_endereco`) VALUES ('9', '8');
INSERT INTO `jonns`.`tb_aux_funcionario_endereco` (`codigo_funcionario`, `codigo_endereco`) VALUES ('10', '9');
INSERT INTO `jonns`.`tb_aux_funcionario_endereco` (`codigo_funcionario`, `codigo_endereco`) VALUES ('11', '8');
INSERT INTO `jonns`.`tb_aux_funcionario_endereco` (`codigo_funcionario`, `codigo_endereco`) VALUES ('12', '1');


INSERT INTO `jonns`.`tb_funcionario` (`nome`, `sobrenome`, `cpf`, `rg`) VALUES ('Funcionario', 'Sem Setor', '0', '0');

INSERT INTO `jonns`.`tb_setor` (`nome`) VALUES ('Setor sem Funcionario');

-------------------

SELECT nome_setor AS Setor FROM tb_setor;

SELECT concat("Olá, seja bem vindo," , nome) FROM tb_funcionario;

SELECT distinct nome, sobrenome FROM tb_funcionario;

SELECT * FROM tb_funcionario;

SELECT concat("OlÁ, " , nome, "! Seja bem-vindo ao curso Nina Gorda! ") from tb_funcionario;


#CRIANDO ELEMENTOS MATEMATICOS

SELECT format((((5+5)*2)/codigo),2) from tb_funcionario;

SELECT format((((5+5)*2)/codigo),2) AS FORMULA_MATEMATICA FROM tb_funcionario;

#CRIANDO TABELA ------------------

select distinct nome, sobrenome FROM tb_funcionario;

ALTER TABLE tb_dependentes RENAME tb_dependente;

ALTER TABLE tb_enderecos RENAME tb_endereco; 

ALTER TABLE tb_pedidos RENAME tb_pedido;

ALTER TABLE tb_emails RENAME tb_email;

ALTER TABLE tb_funcionario add salario float(11,2); 

ALTER TABLE tb_funcionario add apelido VARCHAR(11); 

ALTER TABLE tb_dependente add gays VARCHAR(11);

SELECT * FROM tb_dependente;
-------------------

SELECT gays FROM tb_dependente WHERE nome IN ('Ismael');

SELECT nome FROM tb_funcionario where nome IN ('PEDRO', 'MARIA', 'RAFAEL');

SELECT nome FROM tb_clientes WHERE cpf IS NULL;

SELECT nome FROM tb_funcionario WHERE nome LIKE 'P%';

SELECT nome,cpf FROM tb_funcionario WHERE codigo_setor = 2 AND salario > 2000;

INSERT INTO tb_funcionario (salario) VALUES (2000);

#INSERIR DADOS NA TABELA

UPDATE `jonns`.`tb_funcionario` SET `salario` = '2000' WHERE (`codigo` = '1');
UPDATE `jonns`.`tb_funcionario` SET `salario` = '1500' WHERE (`codigo` = '2');
UPDATE `jonns`.`tb_funcionario` SET `salario` = '2000' WHERE (`codigo` = '3');
UPDATE `jonns`.`tb_funcionario` SET `salario` = '1500' WHERE (`codigo` = '4');
UPDATE `jonns`.`tb_funcionario` SET `salario` = '2000' WHERE (`codigo` = '5');
UPDATE `jonns`.`tb_funcionario` SET `salario` = '1500' WHERE (`codigo` = '6');
UPDATE `jonns`.`tb_funcionario` SET `salario` = '1500' WHERE (`codigo` = '7');
UPDATE `jonns`.`tb_funcionario` SET `salario` = '2000' WHERE (`codigo` = '8');
UPDATE `jonns`.`tb_funcionario` SET `salario` = '3000' WHERE (`codigo` = '9');

SELECT nome, cpf FROM tb_funcionario WHERE codigo_setor = 2 AND salario = 1500;

insert into tb_funcionario (nome, sobrenome, rg, cpf, codigo_setor) values ('NINA GORDA', 'LEAL', 2288, 69661138166, 7),

																	('LILICA GORDA', 'LEAL', 2288981, 00697463117, 5);
DELETE FROM `jonns`.`tb_funcionario` WHERE (`codigo` = '19');
UPDATE `jonns`.`tb_funcionario` SET `salario` = '4000' WHERE (`codigo` = '21');
UPDATE `jonns`.`tb_funcionario` SET `salario` = '5000' WHERE (`codigo` = '22');  

#operador WHERE

SELECT nome, sobrenome FROM tb_funcionario WHERE nome = 'NINA GORDA';

SELECT NOME, sobrenome, salario, apelido FROM tb_funcionario WHERE codigo_setor =  1;

SELECT nome, sobrenome, apelido FROM tb_funcionario WHERE salario >= 2000;

SELECT nome, sobrenome, apelido, codigo_setor FROM tb_funcionario WHERE codigo_setor = 2;

SELECT nome, sobrenome, salario FROM tb_funcionario WHERE salario < 2000;


# OPERADORES AUXILIARES

SELECT nome, cpf FROM tb_funcionario WHERE salario BETWEEN 1500 AND 2500;

SELECT nome, cpf FROM tb_funcionario WHERE salario IN (1000, 2000, 3000);

SELECT nome, cpf FROM tb_funcionario WHERE nome  IN ('Manuela', 'Rafael', 'Roberto');

SELECT nome, cpf FROM tb_funcionario WHERE salario IS NULL;

SELECT nome, cpf FROM tb_funcionario WHERE nome LIKE 'N%';

SELECT nome, cpf FROM tb_funcionario WHERE nome LIKE '%LA';

SELECT nome, cpf FROM tb_funcionario WHERE nome LIKE '_A%';

SELECT nome, cpf, salario, codigo_setor, apelido FROM tb_funcionario WHERE salario >=3000 AND codigo_setor = 21;

SELECT nome, cpf, salario, codigo_setor, apelido FROM tb_funcionario WHERE salario >= 3000 AND codigo_setor = 3;

SELECT nome, cpf, salario, codigo_setor, apelido FROM tb_funcionario WHERE salario >= 3000 OR codigo_setor = 3;

SELECT nome, cpf, salario, codigo_setor, apelido FROM tb_funcionario WHERE NOT (salario >= 3000 AND codigo_setor = 3);

#ORDENAÇÃO 

SELECT nome, sobrenome FROM tb_funcionario order by nome;

SELECT nome, sobrenome, salario FROM tb_funcionario WHERE salario <= 3000 ORDER BY nome;

SELECT nome, sobrenome, salario, codigo_setor, apelido FROM tb_funcionario where salario <= 3000 AND codigo_setor = 3 ORDER BY nome DESC;


SELECT tb_funcionario.nome, tb_Setor.nome FROM tb_funcionario INNER JOIN tb_Setor ON tb_funcionario.Codigo_Setor = tb_Setor.Codigo;


SELECT tb_funcionario.nome, tb_Setor.nome FROM tb_funcionario LEFT JOIN tb_Setor ON tb_funcionario.Codigo_Setor = tb_Setor.Codigo;

SELECT tb_funcionario.nome, tb_Setor.nome FROM tb_funcionario right JOIN tb_Setor ON tb_funcionario.Codigo_Setor = tb_Setor.Codigo;

SELECT tb_funcionario.nome, tb_Setor.nome FROM tb_funcionario FULL OUTER JOIN tb_Setor ON tb_funcionario.Codigo_Setor = tb_Setor.Codigo;

SELECT nome FROM tb_funcionario UNION ALL SELECT nome FROM tb_clientes;

#intersecção de tabelas

SELECT tb_funcionario.nome, tb_setor.nome FROM tb_funcionario INNER JOIN tb_setor ON tb_funcionario.codigo_setor = tb_setor.codigo;


SELECT tb_funcionario.nome, tb_funcionario.sobrenome, tb_endereco.logradouro FROM tb_funcionario 
	INNER JOIN tb_aux_funcionario_endereco
    INNER JOIN tb_endereco
    ON tb_funcionario.codigo = tb_aux_funcionario_endereco.codigo_funcionario
    AND
    tb_endereco.codigo = tb_aux_funcionario_endereco.codigo_endereco;
    

SELECT tb_funcionario.nome, tb_setor.nome FROM tb_funcionario
	LEFT JOIN tb_setor ON tb_funcionario.codigo_setor = tb_setor.codigo;


#UNION

SELECT nome FROM tB_funcionario UNION SELECT nome FROM tb_setor;

SELECT tb_funcionario.nome, tb_setor.nome FROM tb_funcionario
LEFT JOIN tb_setor ON tb_funcionario.codigo_setor = tb_setor.codigo
UNION
SELECT tb_funcionario,nome, tb_setor.nome FROM tb_funcionario
right JOIN tb_setor ON tb_funcionario.codigo_setor = tb_setor.codigo;

#COUNT

SELECT COUNT(*) FROM tb_funcionario;

SELECT COUNT(nome) FROM tb_funcionario;

#SOMA

SELECT SUM(SALARIO) FROM tb_funcionario;

#AVG (MEDIA ARITMETICA)

SELECT AVG(SALARIO) FROM TB_FUNCIONARIO;

#MENOR VALOR EM UMA COLUNA

SELECT MIN(NOME) FROM TB_FUNCIONARIO;

#MAIOR VALOR EM UMA COLUNA

SELECT MAX(NOME) FROM TB_FUNCIONARIO;

#GROUP BY 

SELECT COUNT(*), nome FROM tb_funcionario fun INNER JOIN tb_Setor ON fun.Codigo_Setor = setor.codigo GROUP BY fun.codigo_setor;

# HAVING - CONDIÇÕES PARA GROUP BY

SELECT COUNT(*), Setor.nome FROM tb_funcionario fun INNER JOIN tb_setor Setor ON fun.codigo_setor = Setor.codigo GROUP BY fun.codigo_setor HAVING fun.codigo.Setor = 2;

#

select avg(salario) from tb_funcionario;

select count(*) from tb_funcionario;

select sum(salario) from tb_funcionario;

select count(*) from tb_funcionario GROUP BY codigo_setor;

select count(*) from tb_funcionario GROUP BY codigo_setor HAVING AVG (salario) >= 2000;

#UPPER() e LOWER()

SELECT upper(nome) FROM tb_funcionario;
SELECT lower(NOME) FROM tb_funcionario;

#SUBSTR()

SELECT substr(nome, 1,3) FROM tb_funcionario;#Vai do caractere 1 ate o 3.

#LENGTH()

SELECT length(nome) FROM tb_funcionario;#Retorna a quantidade de caracteres num campo

#RPAD()

SELECT RPAD(nome, 9, '#') FROM tb_funcionario; #adiciona 9 caracteres a direita

#LPAD()

SELECT LPAD(nome, 9, '#') FROM tb_funcionario;