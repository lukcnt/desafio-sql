use turma10;

create schema escola;

create table escola.escola(
	cd_escola int not null primary key,
	sg_escola varchar(5) not null,
	nm_escola varchar(50) not null
);

create table escola.docente(
	cd_docente int not null primary key,
	dt_admissao_docente date not null,
	cd_escola int not null,
	sg_escola varchar(5) not null,
	foreign key(cd_escola) references
		escola.escola(cd_escola)
);

create table escola.disciplina(
	cd_disciplina int not null primary key,
	nm_disciplina varchar(15) not null,
	cd_escola int not null,
	foreign key(cd_escola) references
		escola.escola(cd_escola)
);

create table escola.aluno(
	cd_matricula_aluno int primary key not null,
	nm_aluno varchar(50) not null
);

create table escola.historico(
	cd_matricula_aluno int not null,
	cd_disciplina int not null,
	qt_nota_exame_final decimal(2, 1) not null,
	primary key(cd_matricula_aluno, cd_disciplina),
	foreign key(cd_matricula_aluno) references
		escola.aluno(cd_matricula_aluno),
	foreign key(cd_disciplina) references
		escola.disciplina(cd_disciplina)
);