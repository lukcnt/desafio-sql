CREATE DATABASE desafio;

USE desafio;

CREATE SCHEMA producao;

CREATE TABLE producao.TipoProduto(
	cd_tipo_produto INT NOT NULL PRIMARY KEY IDENTITY(1,1),
	nm_tipo_produto VARCHAR(50) NOT NULL
);

CREATE TABLE producao.Avaliacao(
	cd_avaliacao VARCHAR(2) NOT NULL PRIMARY KEY,
	nm_avaliacao VARCHAR(50) NOT NULL
);

CREATE TABLE producao.Inspetor(
	cd_matricula INT NOT NULL PRIMARY KEY IDENTITY(1,1),
	nm_inspetor VARCHAR(50) NOT NULL
);

CREATE TABLE producao.Ficha(
	cd_ficha INT NOT NULL PRIMARY KEY IDENTITY(1,1),
	dt_inspecao DATE NOT NULL,
	cd_matricula INT NOT NULL,
	FOREIGN KEY (cd_matricula) REFERENCES
                    producao.Inspetor(cd_matricula)
		ON DELETE CASCADE
);

CREATE TABLE producao.Produto(
	cd_produto INT NOT NULL IDENTITY(1,1),
	cd_linha_producao INT NOT NULL,
	aa_producao INT NOT NULL,
	cd_tipo_produto INT NOT NULL,
	FOREIGN KEY (cd_tipo_produto) REFERENCES
                    producao.TipoProduto(cd_tipo_produto)
		ON DELETE CASCADE,
	PRIMARY KEY(cd_produto, cd_linha_producao, aa_producao)
);

CREATE TABLE producao.Inspecao(
	cd_inspecao INT NOT NULL PRIMARY KEY IDENTITY(1,1),
	cd_ficha INT NOT NULL,
	cd_produto INT NOT NULL,
	linha_produto INT NOT NULL,
	aa_produto INT NOT NULL,
	cd_avaliacao VARCHAR(2) NOT NULL,
	hr_inspecao TIME,
	FOREIGN KEY (cd_ficha) REFERENCES
                    producao.Ficha(cd_ficha) 
		ON DELETE CASCADE,
	FOREIGN KEY (cd_produto, linha_produto, aa_produto) REFERENCES
                    producao.Produto(cd_produto, cd_linha_producao, aa_producao)
		ON DELETE CASCADE,
	FOREIGN KEY (cd_avaliacao) REFERENCES
                    producao.Avaliacao(cd_avaliacao)
		ON DELETE CASCADE
);

begin transaction;
INSERT INTO producao.TipoProduto(nm_tipo_produto) VALUES
		('Geladeira'),
		('Maquina de Lavar'),
		('Fogao'),
		('Freezer'),
		('Frigobar');
commit;

begin transaction;
INSERT INTO producao.Avaliacao(cd_avaliacao, nm_avaliacao) VALUES 
		('OK', 'Liberado'),
		('EL', 'Problema Eletrico'),
		('PT', 'Problema de Pintura'),
		('PE', 'Problema na Estrutura'),
		('TR', 'Todo Rejeitado'); 
commit;

begin transaction;
INSERT INTO producao.Inspetor(nm_inspetor) VALUES 
    	('Roberta Luisa'),
		('Lucas Cantoni'),
		('Amanda Novis'),
		('Trancoso Da Silva'),
		('Luiz Roberto');   
commit;

begin transaction;
INSERT INTO producao.Ficha(dt_inspecao, cd_matricula) VALUES
		('20221201', 1),
		('20221211', 3),
		('20221221', 5),
		('20221202', 2),
		('20221212', 4),
		('20221222', 5),
		('20221203', 2),
		('20221209', 4),
		('20221213', 1),
		('20221204', 3),
		('20221207', 2),
		('20221216', 4),
		('20221205', 1),
		('20221213', 3),
		('20221219', 5);
commit;

begin transaction;
INSERT INTO producao.Produto(cd_linha_producao, aa_producao, cd_tipo_produto) VALUES
		( 1, 22, 1),
		( 1, 22, 1),
		( 1, 22, 2),
		( 1, 22, 2),
		( 1, 22, 3),
		( 1, 22, 3),
		( 1, 22, 4),
		( 1, 22, 4),
		( 1, 22, 5),
		( 1, 22, 5), 
		( 2, 22, 1),
		( 2, 22, 1),
		( 2, 22, 2),
		( 2, 22, 2),
		( 2, 22, 3),
		( 2, 22, 3),
		( 2, 22, 4), 
		( 2, 22, 4),
		( 2, 22, 5),
		( 2, 22, 5), 
		( 3, 22, 1),
		( 3, 22, 1),
		( 3, 22, 2),
		( 3, 22, 2),
		( 3, 22, 3),
		( 3, 22, 3),
		( 3, 22, 4),
		( 3, 22, 4),
		( 3, 22, 5),
		( 3, 22, 5), 
		( 4, 22, 1),
		( 4, 22, 1),
		( 4, 22, 2),
		( 4, 22, 2),
		( 4, 22, 3),
		( 4, 22, 3),
		( 4, 22, 4),
		( 4, 22, 4),
		( 4, 22, 5),
		( 4, 22, 5);
commit;

begin transaction;
INSERT INTO producao.Inspecao(cd_ficha, cd_produto, linha_produto, aa_produto, cd_avaliacao, hr_inspecao) VALUES 
		( 1, 1, 1, 22, 'OK', '09:05'),
		( 1, 3, 1, 22, 'OK', '09:40'),
		( 1, 5, 1, 22, 'EL', '10:09'),
		( 1, 7, 1, 22, 'PT', '10:40'),
		( 2, 28, 3, 22, 'PT', '09:32'),
		( 2, 30, 3, 22, 'PE', '09:43'),
		( 2, 31, 4, 22, 'OK', '10:11'),
		( 2, 33, 4, 22, 'PE', '10:39'),
		( 3, 24, 3, 22, 'OK', '09:07'),
		( 3, 28, 3, 22, 'OK', '09:24'),
		( 3, 30, 3, 22, 'EL', '09:40'),
		( 3, 33, 4, 22, 'OK', '10:11'), 
		( 4, 9, 1, 22, 'TR', '09:23'),
		( 4, 2, 1, 22, 'OK', '09:45'),
		( 4, 4, 1, 22, 'OK', '10:22'),
		( 4, 6, 1, 22, 'PE', '10:55'),
		( 5, 35, 4, 22, 'OK', '09:16'),
		( 5, 37, 4, 22, 'OK', '09:44'),
		( 5, 39, 4, 22, 'EL', '10:14'),
		( 5, 32, 4, 22, 'TR', '10:36'),
		( 6, 39, 4, 22, 'OK', '09:15'),
		( 6, 32, 4, 22, 'EL', '09:11'),
		( 6, 34, 4, 22, 'OK', '09:44'),
		( 6, 38, 4, 22, 'OK', '09:51'),
		( 7, 8, 1, 22, 'OK', '09:12'),
		( 7, 10, 1, 22, 'PE', '09:41'),
		( 7, 11, 2, 22, 'OK', '09:55'),
		( 7, 13, 2, 22, 'EL', '10:05'),
		( 8, 29, 3, 22, 'EL', '09:17'),
		( 8, 22, 3, 22, 'OK', '09:34'),
		( 8, 24, 3, 22, 'PT', '09:49'),
		( 8, 26, 3, 22, 'OK', '10:31'), 
		( 9, 34, 4, 22, 'EL', '09:19'),
		( 9, 36, 4, 22, 'OK', '09:44'),
		( 9, 38, 4, 22, 'PT', '09:50'),
		( 9, 40, 4, 22, 'OK', '10:22'), 
		( 10, 15, 2, 22, 'OK', '09:17'),
		( 10, 17, 2, 22, 'OK', '09:48'),
		( 10, 19, 2, 22, 'OK', '09:51'),
		( 10, 12, 2, 22, 'PT', '10:30'),
		( 11, 21, 3, 22, 'OK', '09:32'),
		( 11, 23, 3, 22, 'TR', '09:22'),
		( 11, 25, 3, 22, 'PT', '10:06'),
		( 11, 27, 3, 22, 'OK', '10:25'),
		( 12, 10, 1, 22, 'OK', '09:33'),
		( 12, 13, 2, 22, 'OK', '09:41'),
		( 12, 12, 2, 22, 'OK', '09:33'),
		( 12, 14, 2, 22, 'OK', '09:52'), 
		( 13, 14, 2, 22, 'PE', '09:15'),
		( 13, 16, 2, 22, 'OK', '09:34'),
		( 13, 18, 2, 22, 'EL', '09:55'),
		( 13, 20, 2, 22, 'OK', '10:20'), 
		( 14, 5, 1, 22, 'OK', '09:09'),
		( 14, 7, 1, 22, 'OK', '09:29'),
		( 14, 9, 1, 22, 'EL', '09:49'),
		( 14, 6, 1, 22, 'PT', '10:29'), 
		( 15, 18, 2, 22, 'PE', '09:15'),
		( 15, 23, 3, 22, 'EL', '09:43'),
		( 15, 25, 3, 22, 'OK', '10:02'),
		( 15, 29, 3, 22, 'OK', '10:25'); 
commit;

SELECT CONVERT(VARCHAR(5), DATEADD(minute, DATEDIFF(MINUTE, '09:00', insp.hr_inspecao), 0), 114) as total
FROM producao.inspecao as insp
WHERE hr_inspecao IN (
	SELECT TOP 1 hr_inspecao as last_time
	FROM producao.inspecao as i
	INNER JOIN producao.ficha as f ON (i.cd_ficha = f.cd_ficha)
	INNER JOIN producao.inspetor as p ON (f.cd_matricula = p.cd_matricula)
	WHERE f.dt_inspecao = '20221216' AND p.nm_inspetor = 'Trancoso Da Silva'
	ORDER BY hr_inspecao
	DESC);

SELECT hr_inspecao as last_time
FROM producao.inspecao as i
JOIN producao.ficha as f ON (i.cd_ficha = f.cd_ficha)
JOIN producao.inspetor as p ON (f.cd_matricula = p.cd_matricula)
WHERE f.dt_inspecao BETWEEN '20221201' and '20221222' AND p.nm_inspetor = 'Trancoso Da Silva';

SELECT cd_avaliacao, COUNT(1) as recorrencia
FROM producao.inspecao as pi
JOIN producao.ficha as pf ON (pi.cd_ficha = pf.cd_ficha)
WHERE pf.dt_inspecao BETWEEN CONVERT(datetime, '20221201')
	AND CONVERT(datetime, '20221222')
	AND cd_avaliacao != 'OK'
GROUP BY cd_avaliacao
ORDER BY recorrencia DESC;

SELECT nm_inspetor, COUNT(1) as	produtos_tr
FROM producao.Inspetor as pi
INNER JOIN producao.Ficha as pfi ON (pi.cd_matricula = pfi.cd_matricula)
INNER JOIN producao.Inspecao as pin ON (pfi.cd_ficha = pin.cd_ficha)
WHERE pin.cd_avaliacao = 'TR'
GROUP BY nm_inspetor
ORDER BY produtos_tr DESC;

SELECT CONCAT(cd_produto, '.', linha_produto, '.', aa_produto) as cod_produto
FROM producao.inspecao
WHERE cd_avaliacao = 'OK' AND cd_produto IN (
    SELECT cd_produto
    FROM producao.inspecao
    GROUP BY cd_produto
    HAVING COUNT(distinct cd_avaliacao) > 1);