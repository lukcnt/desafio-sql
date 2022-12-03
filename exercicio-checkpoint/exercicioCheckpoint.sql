use exercicioCheckpoint;

create schema locadora;

create table locadora.classificacao(
	cd_classificacao int primary key,
	vl_locacao_diaria money not null
);

create table locadora.categoria(
	sg_categoria varchar(5) primary key,
	nm_categoria varchar(15) not null
);

create table locadora.filme(
	cd_filme int identity(1, 1) not null primary key,
	nm_filme varchar(25) not null,
	sg_categoria varchar(5),
	cd_classificacao int,

	foreign key(sg_categoria) references locadora.categoria(sg_categoria)
	on delete set null
	on update cascade,

	foreign key(cd_classificacao) references locadora.classificacao(cd_classificacao)
	on delete set null
	on update cascade
);

create table locadora.cliente(
	cd_cliente int identity(1, 1) not null primary key,
	nm_cliente varchar(50) not null
);

create table locadora.solicitacao(
	cd_solicitacao int identity(1, 1) not null primary key,
	cd_cliente int not null,
	dt_solicitacao date not null
	
	foreign key(cd_cliente) references locadora.cliente(cd_cliente)
	on delete cascade
	on update cascade
);

create table locadora.solicitacao_filme(
	cd_filme int not null,
	cd_solicitacao int not null,
	dt_solicitacao_prevista date not null,
	dt_solicitacao_real date, /* not null é usado para colocar o valor como obrigatório, não é para ser usada sempre */
	primary key(cd_filme, cd_solicitacao),
	foreign key(cd_filme) references
		locadora.filme(cd_filme)
	on delete cascade
	on update cascade,

	foreign key(cd_solicitacao) references
		locadora.solicitacao(cd_solicitacao)
	on delete cascade
	on update cascade
);

begin transaction;
insert into locadora.categoria (sg_categoria, nm_categoria)
values ('D', 'Drama'), ('T', 'Terror'), ('S', 'Suspense'), ('C', 'Comédia'), ('R', 'Romântico');
commit;
insert into locadora.categoria (sg_categoria, nm_categoria)
values ('F', 'Ficção');

begin transaction;
insert into locadora.cliente (nm_cliente)
values ('Lucas'), ('Roberta'), ('André'), ('Mateus'), ('Giovanni');
commit;

begin transaction;
insert into locadora.classificacao (cd_classificacao, vl_locacao_diaria )
values (1, 1.00), (2, 2.00), (3, 3.00);
commit;

begin transaction;
insert into locadora.filme (nm_filme, sg_categoria, cd_classificacao)
values ('A espera de um milagre', 'D', 1),
	   ('Duna', 'F', 3),
	   ('A chegada', 'F', 2),
	   ('A hora do rush', 'C', 1),
	   ('Jason', 'T', 1);
commit;

begin transaction;
insert into locadora.solicitacao (cd_cliente, dt_solicitacao)
values (1, '2022-12-02'),
	   (1, '2022-12-05'),
	   (2, '2022-11-15'),
	   (2, '2022-11-30'),
	   (3, '2022-11-17'),
	   (3, '2022-11-27'),
	   (4, '2022-12-01'),
	   (5, '2022-11-18'),
	   (5, '2022-11-22'),
	   (5, '2022-11-28');
commit;

begin transaction;
insert into locadora.solicitacao_filme (cd_filme, cd_solicitacao, dt_solicitacao_prevista, dt_solicitacao_real)
values (1, 7, '2022-12-05', '2022-12-05'),
	   (3, 7, '2022-12-05', '2022-12-05'),
	   (2, 8, '2022-12-08', '2022-12-09'),
	   (5, 8, '2022-12-08', '2022-12-09'),
	   (3, 9, '2022-11-18', '2022-12-18'),
	   (5, 9, '2022-11-18', '2022-12-18'),
	   (4, 10, '2022-12-03', '2022-12-03'),
	   (1, 10, '2022-12-03', '2022-12-03'),
	   (5, 11, '2022-11-20', '2022-11-22'),
	   (4, 11, '2022-11-20', '2022-11-22'),
	   (1, 12, '2022-11-27', '2022-11-27'),
	   (3, 12, '2022-11-27', '2022-11-27'),
	   (2, 13, '2022-12-04', '2022-12-04'),
	   (3, 13, '2022-12-04', '2022-12-04'),
	   (4, 14, '2022-11-21', '2022-11-21'),
	   (2, 14, '2022-11-21', '2022-11-21'),
	   (5, 15, '2022-11-25', '2022-11-25'),
	   (3, 15, '2022-11-25', '2022-11-25'),
	   (1, 16, '2022-12-01', '2022-12-01'),
	   (2, 16, '2022-12-01', '2022-12-01');
commit;

select * from locadora.categoria;

select * from locadora.classificacao;

select * from locadora.cliente;

select * from locadora.filme;

select * from locadora.solicitacao;

select * from locadora.solicitacao_filme;