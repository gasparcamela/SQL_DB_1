
create table Alunos
(id_aluno int primary key not null,
nome varchar(200) not null,
data_nascimento date not null,
sexo varchar(1) null, -- M para masculino ou F para femenino
data_cadastro datetime not null, 
login_cadastro varchar(15) not null,
)

create table Situacao
(id_situacao int primary key not null, 
situacao varchar(25) not null, 
data_cadastro datetime not null, 
login_cadastro varchar(15) not null, 
)

create table Curso 
(id_curso int primary key not null,
nome_curso varchar(200) not null,
data_cadastro datetime not null, 
login_cadastro varchar(15) not null,
)

create table Turmas 
(id_turmas int primary key not null,
id_aluno int not null, 
id_curso int not null,
valor_turma numeric(15,2) not null,
desconto numeric(3,2) not null,
data_inicio date not null,
data_termino date not null,
data_cadastro datetime not null, 
login_cadastro varchar(15) not null,
)


create table Registro_Presenca
(id_turma int not null,
id_aluno int not null,
id_situacao int not null,
data_presenca date not null,
data_cadastro datetime not null, 
login_cadastro varchar(15) not null,
)

use SQL_DB_1

select *from Alunos
select *from Registro_Presenca
select *from Curso
select *from Turmas
select *from Situacao

--Turmas x Alunos
Alter table Turmas 
add constraint fk_TurmasAlunos foreign key (id_aluno) references Alunos (id_aluno);
--Turmas x Curso
Alter table Turmas
add constraint fk_TurmasCurso foreign key (id_curso) references Curso (id_curso);
--Registro_Presenca x Alunos
alter table Registro_Presenca
add constraint fk_Registro_PresencaAlunos foreign key (id_aluno) references Alunos (id_aluno);
--Registro_Presenca x Situacao
alter table Registro_Presenca
add constraint fk_Registro_PresencaSituacao foreign key (id_situacao) references Situacao (id_situacao);
--Registro_Presenca x Turmas
alter table Registro_Presenca
add constraint fk_RPresencaTurmas foreign key (id_turma) references Turmas (id_turma);