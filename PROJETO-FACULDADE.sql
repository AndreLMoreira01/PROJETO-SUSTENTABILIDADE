CREATE DATABASE sustentabilidade_db;
USE sustentabilidade_db;

CREATE TABLE paises(
	id_pais INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    continente VARCHAR(50)
);

CREATE TABLE fontes_dados(
    id_fonte_dado INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome_fonte VARCHAR(100),
    tipo_dado VARCHAR(200),
    link_origem VARCHAR(255)
);

CREATE TABLE biomas(
	id_bioma INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    bioma VARCHAR(50)
);

CREATE TABLE locais(
	id_local INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	estado VARCHAR(50),
    municipio VARCHAR(50),
    latitude VARCHAR(50),
    longitude VARCHAR(50)
);

CREATE TABLE clima_fatos(
	id_clima_fato INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    ano YEAR,
    mes INT,
    temperatura_media DECIMAL(5,2),
    emissao_co2_mt DECIMAL(12,2),
    pais_id INT,
    fonte_dado_id INT,
	FOREIGN KEY (pais_id) REFERENCES paises(id_pais),
    FOREIGN KEY (fonte_dado_id) REFERENCES fontes_dados(id_fonte_dado)
);

CREATE TABLE desmatamento_fatos(
	id_desmatamento_fatos INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    data_alerta DATE NOT NULL,
	area_km2 DECIMAL(10,2) NOT NULL,
	local_id INT,
    fonte_dado_id INT,
    bioma_id INT,
    FOREIGN KEY (local_id) REFERENCES locais(id_local),
    FOREIGN KEY (fonte_dado_id) REFERENCES fontes_dados(id_fonte_dado),
	FOREIGN KEY (bioma_id) REFERENCES biomas(id_bioma)
);

INSERT INTO paises (nome, continente)
VALUES ('Brasil', 'América do Sul');

INSERT INTO fontes_dados (nome_fonte, tipo_dado, link_origem) VALUES
('INPE - DETER', 'Alertas de Desmatamento', 'https://terrabrasilis.dpi.inpe.br/app/dashboard/alerts/legal_amazon/'),
('IBAMA - SAD', 'Monitoramento', 'https://dados.ibama.gov.br/'),
('MapBiomas', 'Uso do Solo', 'https://mapbiomas.org/'),
('NASA FIRMS', 'Detecção de Calor', 'https://firms.modaps.eosdis.nasa.gov/'),
('ICMBio – Dados Abertos', 'Conjunto de bases públicas do Instituto Chico Mendes','https://dados.gov.br/dados/busca?termo=icmbio');

INSERT INTO biomas (bioma) VALUES
('Amazônia'),
('Cerrado'),
('Pantanal'),
('Caatinga'),
('Mata Atlântica'),
('Pampa');

INSERT INTO locais (estado, municipio, latitude, longitude) VALUES
('Pará', 'Altamira', '-3.204', '-52.212'),
('Rondônia', 'Porto Velho', '-8.760', '-63.899'),
('Amazonas', 'Manicoré', '-5.812', '-61.289'),
('Mato Grosso', 'Sinop', '-11.860', '-55.509'),
('Mato Grosso', 'Colniza', '-9.266', '-59.225'),
('Acre', 'Rio Branco', '-9.975', '-67.824'),
('Pará', 'Itaituba', '-4.267', '-55.992'),
('Roraima', 'Caracaraí', '1.815', '-61.128'),
('Amapá', 'Laranjal do Jari', '-0.804', '-52.453'),
('Tocantins', 'Araguaína', '-7.192', '-48.204');


INSERT INTO desmatamento_fatos (data_alerta, area_km2, local_id, fonte_dado_id, bioma_id) VALUES
('2022-01-14', 8.6, 1, 1, 1),
('2022-01-22', 12.3, 4, 2, 1),
('2022-02-05', 4.1, 3, 3, 2),
('2022-02-18', 9.7, 5, 1, 4),
('2022-03-01', 15.2, 7, 4, 1),
('2022-03-15', 6.4, 2, 3, 1),
('2022-03-28', 3.8, 6, 2, 5),
('2022-04-07', 11.9, 8, 1, 6),
('2022-04-16', 7.5, 9, 4, 3),
('2022-04-29', 13.1, 10, 3, 1),

('2022-05-06', 18.4, 1, 2, 1),
('2022-05-17', 5.2, 3, 1, 4),
('2022-05-27', 10.8, 5, 4, 3),
('2022-06-03', 14.7, 2, 3, 2),
('2022-06-14', 21.9, 7, 1, 1),
('2022-06-25', 19.3, 4, 2, 3),
('2022-07-04', 23.5, 6, 3, 6),
('2022-07-13', 17.2, 9, 4, 1),
('2022-07-25', 8.9, 10, 2, 4),
('2022-08-02', 16.8, 8, 1, 5),

('2022-08-11', 20.1, 3, 4, 1),
('2022-08-26', 6.7, 5, 2, 3),
('2022-09-03', 4.9, 7, 3, 2),
('2022-09-15', 11.4, 1, 1, 1),
('2022-09-27', 2.6, 6, 4, 5),
('2022-10-05', 9.8, 4, 2, 3),
('2022-10-19', 13.7, 10, 3, 1),
('2022-10-30', 7.3, 2, 1, 2),
('2022-11-10', 3.5, 9, 4, 6),
('2022-11-22', 12.5, 8, 2, 1),

('2022-12-04', 5.9, 7, 3, 4),
('2022-12-17', 10.3, 5, 1, 3),
('2023-01-09', 14.6, 1, 4, 1),
('2023-01-23', 7.8, 3, 2, 2),
('2023-02-04', 18.9, 4, 1, 1),
('2023-02-16', 9.0, 6, 3, 5),
('2023-03-01', 12.7, 2, 4, 3),
('2023-03-14', 4.4, 9, 1, 6),
('2023-03-26', 15.5, 7, 3, 1),
('2023-04-08', 6.2, 10, 2, 4);

INSERT INTO desmatamento_fatos (data_alerta, area_km2, local_id, fonte_dado_id, bioma_id) VALUES
('2021-06-10', 1089.3, 1, 5, 1),
('2021-07-22', 742.6, 3, 5, 1),
('2020-08-15', 663.1, 5, 5, 1),
('2022-03-05', 1421.8, 1, 5, 1),
('2020-05-19', 529.4, 2, 5, 1),
('2023-01-28', 214.7, 6, 5, 6),
('2019-09-12', 387.3, 8, 5, 2),
('2022-11-03', 695.2, 3, 5, 1),
('2021-04-17', 564.9, 7, 5, 1),
('2023-02-11', 403.8, 4, 5, 2),

('2019-08-27', 312.5, 7, 5, 1),
('2020-10-09', 268.1, 2, 5, 1),
('2022-06-21', 241.2, 6, 5, 6),
('2021-03-13', 452.7, 3, 5, 1),
('2023-04-05', 173.6, 10, 5, 4),
('2022-09-14', 198.4, 10, 5, 4),
('2019-07-30', 289.5, 1, 5, 1),
('2023-05-18', 332.1, 4, 5, 2),
('2020-12-03', 251.0, 2, 5, 1),
('2021-02-26', 189.9, 1, 5, 1);

SELECT 
    d.id_desmatamento_fatos,
    d.data_alerta,
    d.area_km2,
    l.municipio,
    b.bioma,
    f.nome_fonte
FROM desmatamento_fatos d
JOIN locais l ON d.local_id = l.id_local
JOIN biomas b ON d.bioma_id = b.id_bioma
JOIN fontes_dados f ON d.fonte_dado_id = f.id_fonte_dado;
