use turma10;

create schema despachante;

create table despachante.proprietario(
	cd_cpf_proprietario varchar(14) primary key not null,
	nm_proprietario varchar(50) not null
);

create table despachante.veiculo(
	cd_veiculo varchar(10) primary key not null,
	nm_veiculo varchar(50) not null,
	cd_cpf_proprietario varchar(14),
	foreign key(cd_cpf_proprietario) references
		despachante.proprietario(cd_cpf_proprietario)
);

create table despachante.licenciamento(
	dt_licenciamento date primary key not null,
	vl_licenciamento money not null,
	cd_veiculo varchar(10),
	foreign key(cd_veiculo) references
		despachante.veiculo(cd_veiculo)
);