
create table fabricante(id_empresa int primary key not NULL,nome_vacina
varchar(50),nome_emp varchar(50) not null, telefone varchar(30));
insert into fabricante
values(40,'empresaA','fiocruz','3456-7990');
insert into fabricante
values (41,'empresaB','fiocruz','3456-7891');
insert into fabricante
values(42,'empresaC','fiocruz','3456-7892');
insert into fabricante
values(43,'empresaD','coronavac','3456-7893');
insert into fabricante
values(44,'empresaE','astrazenica','3456-7894');
insert into fabricante
values(45,'empresaF','astrazenica','3456-7895');
insert into fabricante
values(46,'empresaG','coronavac','3456-7896');
insert into fabricante
values(47,'empresaH','fiocruz','3456-7898');
insert into fabricante
values(48,'empresaI','jhonsons','3456-7899');
insert into fabricante
values(49,'empresaJ','jhonsons','3456-7890');


create table vacina(id_vacina int primary key not null,fkid_empresa int not null,nome_vacina
varchar(50) not null ,lote varchar(50) not null,preco_lote int not null);
alter table vacina
add foreign key(fkid_empresa)
references fabricante(id_empresa);
insert into vacina
Values (234,40,'fiocruz','lote1',29000);
insert into vacina
Values (235,41,'fiocruz','lote2',28000);
insert into vacina
Values (236,42,'fiozruz','lote3',30000);
insert into vacina
Values (237,43,'coronavac','lote1',30000);
insert into vacina
Values (238,44,'astrazenica','lote2',33000);
insert into vacina
Values (239,45,'atrazenica','lote1',34000);
insert into vacina
Values (240,46,'coronavac','lote2',36000);
insert into vacina
Values (241,47,'fiocruz','lote1',23000);
insert into vacina
Values (242,48,'jhonsons','lote2',21000);
insert into vacina
Values (243,49,'jhonsons','lote2',42000);



Create table pessoa(id_pessoa int primary key not null, date_naci DATE not null,cpf
VARCHAR(50) UNIQUE not null,nome varchar(50),grupo varchar(30) not null,telefone
varchar(50) not null,cidade varchar(50) not null ,estado varchar(50) not null);
insert into pessoa values(1,'12/07/2002','12345678910','Ronaldo da Silva Pereira','jovem',
'3691-5500','Crateus','CE');
insert into pessoa values(2,'09/05/1978','12345678911','Fernanda de Oliveira Costa','adulto',
'3691-5501','Quixada','CE');
insert into pessoa values(3,'10/02/2004','12345678912',' Manoel Soares Silva','jovem', '3691-
5502','Ipu','CE');
insert into pessoa values(4,'11/05/1954','12345678913', 'Manuel José Gomes','idoso', '3691-
5503','Novo Oriente','CE');
insert into pessoa values(5,'12/07/1967','12345678914', 'Menelick de Carvalho','adulto', '3691-
5504','Crateus','CE');
insert into pessoa values(6,'23/04/2010','12345678915', 'Maria de Lourdes Barbosa','crianca',
'3691-5505','Quixeramobim','CE');
insert into pessoa values(7,'21/02/2010','12345678916', 'João Paulo de Souza ','crianca', '3691-
5506','Quixeramobim','CE');
insert into pessoa values(8,'27/05/1970','12345678917', 'Roberto de Souza Feijó ','adulto',
'3691-5507','ipu','CE');
insert into pessoa values(9,'24/03/1991','12345678918','David Salomão Barbosa','adulto',
'3691-5508','Novo Oriente','CE');
insert into pessoa values(10,'27/06/2001','12345678919', 'Dalmo Lúcio Lima Coutinho
','jovem', '3691-5509','Quixada','CE');


create table enfermeiro(id_enfermeiro int primary key not null,nome_enfermeiro
varchar(50) not null,disponibilidade bool not null,fkid_vacina int not null ,fkid_pessoa int not
null);
alter table enfermeiro
add foreign key(fkid_pessoa)
references pessoa(id_pessoa);
alter table enfermeiro
add foreign key(fkid_vacina)
references vacina(id_vacina);
insert into enfermeiro
values(50,'Rebeca','TRUE',234,1);
insert into enfermeiro
values(51,'Ronaldo','FALSE',236,2);
insert into enfermeiro
values(52,'Elias','TRUE',240,3);
insert into enfermeiro
values(53,'Rodrigo','TRUE',242,4);
insert into enfermeiro
values(54,'Junior','FALSE',235,5);
insert into enfermeiro
values(55,'Tiago','TRUE',238,6);
insert into enfermeiro
values(56,'Tainara','TRUE',239,7);
insert into enfermeiro
values(57,'Fernando','TRUE',241,8);
insert into enfermeiro
values(58,'Marcos','TRUE',243,9);
insert into enfermeiro
values(59,'Maria','TRUE', 237,10);


create table posto_de_saude(id_posto int primary key not null,nome varchar(50) not
null,fkid_pessoa int not null,fkid_enfermeiro int not null,fkid_vacina int not null,cidade
varchar(50) not null,estado varchar(50) not null);
alter table posto_de_saude
add foreign key(fkid_enfermeiro)
references enfermeiro(id_enfermeiro);
alter table posto_de_saude
add foreign key(fkid_vacina)
references vacina(id_vacina);
alter table posto_de_saude
add foreign key(fkid_pessoa)
references pessoa(id_pessoa);
insert into posto_de_saude
values(10,'Sus_Crat',1,50,234,'Crateus','Ce');
insert into posto_de_saude
values(11,'Sus_Crat1',5,51,236,'Crateus','Ce');
insert into posto_de_saude
values(12,'Sus_Quixa',2,52,240,'Quixada','Ce');
insert into posto_de_saude
values(13,'Sus_Quixa1',10,53,242,'Quixada','Ce');
insert into posto_de_saude
values(14,'Sus_Quixe',6,54,235,'Quixeramobim','Ce');
insert into posto_de_saude
values(15,'Sus_Quixe1',7,55,238,'Quixeramobim','Ce');
insert into posto_de_saude
values(16,'Sus_Ipu',3,56,239,'Ipu','Ce');
insert into posto_de_saude
values(17,'Sus_Ipu',8,57,241,'Ipu','Ce');
insert into posto_de_saude
values(18,'Sus_Novo',4,58,243,'Novo Oriente','Ce');
insert into posto_de_saude
values(19,'Sus_Novo',9,59,237,'Novo Oriente','Ce');


create table estoque(id_estoque int primary key not null,fkid_posto int not null,fkid_vacina
int not null,qtd_disp int not null,capacidade int not null);
alter table estoque
add foreign key(fkid_vacina)
references vacina(id_vacina);
alter table estoque
add foreign key(fkid_posto)
references posto_de_saude(id_posto);
insert into estoque
values(200,10,234,10000,13000);
insert into estoque
values(201,11,235,10100,17000);
insert into estoque
values(202,12,236,5700,15000);
insert into estoque
values(203,13,237,19300,20000);
insert into estoque
values(204,14,238,12400,17500);
insert into estoque
values(205,15,239,5400,12000);
insert into estoque
values(206,16,240,7000,13500);
insert into estoque
values(207,17,241,10700,10800);
insert into estoque
values(208,18,242,5300,11000);
insert into estoque
values(209,19,243,5200,17000);


create table governo(id_governo int primary key not null,saldo_mes real not null,fkid_posto
int not null,fkid_vacina int not null,fkid_empresa int not null);
alter table governo
add foreign key(fkid_empresa)
references fabricante(id_empresa);
alter table governo
add foreign key(fkid_posto)
references posto_de_saude(id_posto);
alter table governo
add foreign key(fkid_vacina)
references vacina(id_vacina);
insert into governo
values(1,150000,10,234,40);
insert into governo
values(2,130000,11,235,41);
insert into governo
values(3,120000,12,236,42);
insert into governo
values(4,100000,13,237,43);
insert into governo
values(5,110000,14,238,44);
insert into governo
values(6,170000,15,239,45);
insert into governo
values(7,150000,16,240,46);
insert into governo
values(8,130000,17,241,47);
insert into governo
values(9,120000,18,242,48);
insert into governo
values(10,110000,19,243,49);


create table cartao_vacina(id_cartao int primary key not null,fkid_pessoa int not
null,fkid_posto int not null,n_doses int ,nome_vacinas varchar(50),grupo varchar(50) not
null);
alter table cartao_vacina
add foreign key(fkid_pessoa)
references pessoa(id_pessoa);
alter table cartao_vacina
add foreign key(fkid_posto)
references posto_de_saude(id_posto);
insert into cartao_vacina
values(601,1,10,3,'fiocruz','jovem');
insert into cartao_vacina
values(602,2,12,0,'','adulto');
insert into cartao_vacina
values(603,3,16,2,'coronavac', 'jovem');
insert into cartao_vacina
values(604,4,18,2,'jhonsons','idoso');
insert into cartao_vacina
values(605,5,11,0,'','idoso');
insert into cartao_vacina
values(606,6,14,2,'astrazenica','crianca');
insert into cartao_vacina
values(607,7,15,0,'','crianca');
insert into cartao_vacina
values(608,8,17,3,'fiocruz', 'adulto');
insert into cartao_vacina
values(609,9,19,1,'jhonsons', 'adulto');
insert into cartao_vacina
values(610,10,13,2,'coronavac','jovem');


create table fabricante_fabrica_vacina(id_ffv int primary key not null,fkid_empresa int not
null,fkid_vacina int not null,dt_fab date not null);
alter table fabricante_fabrica_vacina
add foreign key(fkid_vacina)
references vacina(id_vacina);
alter table fabricante_fabrica_vacina
add foreign key(fkid_empresa)
references fabricante(id_empresa);
insert into fabricante_fabrica_vacina
values(550,40,234,'10/03/2021');
insert into fabricante_fabrica_vacina
values(551,41,235,'01/02/2021');
insert into fabricante_fabrica_vacina
values(552,42,236,'13/09/2021');
insert into fabricante_fabrica_vacina
values(553,43,237,'12/04/2021');
insert into fabricante_fabrica_vacina
values(554,44,238,'10/01/2021');
insert into fabricante_fabrica_vacina
values(555,45,239,'05/04/2021');
insert into fabricante_fabrica_vacina
values(556,46,240,'11/02/2021');
insert into fabricante_fabrica_vacina
values(557,47,241,'03/06/2021');
insert into fabricante_fabrica_vacina
values(558,48,242,'07/05/2021');
insert into fabricante_fabrica_vacina
values(559,49,243,'03/02/2021');


create table governo_negocia_fabricante(id_gnf int primary key not null,fkid_empresa int
not null,fkid_governo int not null);
alter table governo_negocia_fabricante
add foreign key(fkid_empresa)
references fabricante(id_empresa);
alter table governo_negocia_fabricante
add foreign key(fkid_governo)
references governo(id_governo);
insert into governo_negocia_fabricante
values(20,40,1);
insert into governo_negocia_fabricante
values(21,41,2);
insert into governo_negocia_fabricante
values(22,42,3);
insert into governo_negocia_fabricante
values(23,43,4);
insert into governo_negocia_fabricante
values(24,44,5);
insert into governo_negocia_fabricante
values(25,45,6);
insert into governo_negocia_fabricante
values(26,46,7);
insert into governo_negocia_fabricante
values(27,47,8);
insert into governo_negocia_fabricante
values(28,48,9);
insert into governo_negocia_fabricante
values(29,49,10);


create table governo_compra_vacina(id_gcv int primary key not null,fkid_governo int not
null,fkid_vacina int not null,dt_compra date not null);
alter table governo_compra_vacina
add foreign key(fkid_vacina)
references vacina(id_vacina);
insert into governo_compra_vacina
values(700,1,234,'10/04/2021');
insert into governo_compra_vacina
values(701,2,235,'01/03/2021');
insert into governo_compra_vacina
values(702,3,236,'10/10/2021');
insert into governo_compra_vacina
values(703,4,237,'10/05/2021');
insert into governo_compra_vacina
values(704,5,238,'12/02/2021');
insert into governo_compra_vacina
values(705,6,239,'15/05/2021');
insert into governo_compra_vacina
values(706,7,240,'23/03/2021');
insert into governo_compra_vacina
values(707,8,241,'10/07/2021');
insert into governo_compra_vacina
values(708,9,242,'17/06/2021');
insert into governo_compra_vacina
values(709,10,243,'05/03/2021');


create table vacina_fornecida_posto(id_vfp int primary key not null,fkid_vacina int not null,
fkid_posto int not null,dt_fornece date not null);
alter table vacina_fornecida_posto
add foreign key(fkid_vacina)
references vacina(id_vacina);
alter table vacina_fornecida_posto
add foreign key(fkid_posto)
references posto_de_saude(id_posto);
insert into vacina_fornecida_posto
values(80,234,10,'10/05/2021');
insert into vacina_fornecida_posto
values(81,235,11,'01/04/2021');
insert into vacina_fornecida_posto
values(82,236,12,'10/11/2021');
insert into vacina_fornecida_posto
values(83,237,13,'10/06/2021');
insert into vacina_fornecida_posto
values(84,238,14,'12/03/2021');
insert into vacina_fornecida_posto
values(85,239,15,'15/06/2021');
insert into vacina_fornecida_posto
values(86,240,16,'23/04/2021');
insert into vacina_fornecida_posto
values(87,241,17,'10/08/2021');
insert into vacina_fornecida_posto
values(88,242,18,'17/07/2021');
insert into vacina_fornecida_posto
values(89,243,19,'05/04/2021');


create table vacina_armazenada_estoque(id_vae int primary key not null,fkid_vacina int not
null,fkid_estoque int not null);
alter table vacina_armazenada_estoque
add foreign key(fkid_vacina)
references vacina(id_vacina);
alter table vacina_armazenada_estoque
add foreign key (fkid_estoque)
references estoque(id_estoque);
insert into vacina_armazenada_estoque
values(401,234,200);
insert into vacina_armazenada_estoque
values(402,235,201);
insert into vacina_armazenada_estoque
values(403,236,202);
insert into vacina_armazenada_estoque
values(404,237,203);
insert into vacina_armazenada_estoque
values(405,238,204);
insert into vacina_armazenada_estoque
values(406,239,205);
insert into vacina_armazenada_estoque
values(407,240,206);
insert into vacina_armazenada_estoque
values(408,241,207);
insert into vacina_armazenada_estoque
values(409,242,208);
insert into vacina_armazenada_estoque
values(410,243,209);

create table enfermeiro_manuseia_vacina(id_emv int primary key not null,fkid_vacina int
not null,fkid_enfermeiro int not null);
alter table enfermeiro_manuseia_vacina
add foreign key(fkid_vacina)
references vacina(id_vacina);
alter table enfermeiro_manuseia_vacina
add foreign key(fkid_enfermeiro)
references enfermeiro(id_enfermeiro);
insert into enfermeiro_manuseia_vacina
values(140,234,50);
insert into enfermeiro_manuseia_vacina
values(141,236,51);
insert into enfermeiro_manuseia_vacina
values(142,240,52);
insert into enfermeiro_manuseia_vacina
values(143,242,53);
insert into enfermeiro_manuseia_vacina
values(144,235,54);
insert into enfermeiro_manuseia_vacina
values(145,238,55);
insert into enfermeiro_manuseia_vacina
values(146,239,56);
insert into enfermeiro_manuseia_vacina
values(147,241,57);
insert into enfermeiro_manuseia_vacina
values(148,243,58);
insert into enfermeiro_manuseia_vacina
values(149,237,59);


create table posto_emite_cartao(id_pec int primary key not null ,fkid_posto int not
null,fkid_cartao int not null);
alter table posto_emite_cartao
add foreign key(fkid_posto)
references posto_de_saude(id_posto);
alter table posto_emite_cartao
add foreign key(fkid_cartao)
references cartao_vacina(id_cartao);
insert into posto_emite_cartao
values(250,10,601);
insert into posto_emite_cartao
values(251,11,602);
insert into posto_emite_cartao
values(252,12,603);
insert into posto_emite_cartao
values(253,13,604);
insert into posto_emite_cartao
values(254,14,605);
insert into posto_emite_cartao
values(255,15,606);
insert into posto_emite_cartao
values(256,16,607);
insert into posto_emite_cartao
values(257,17,608);
insert into posto_emite_cartao
values(258,18,609);
insert into posto_emite_cartao
values(259,19,610);


create table posto_possui_estoque(id_pps int primary key not null ,fkid_estoque int not
null,fkid_posto int not null);
alter table posto_possui_estoque
add foreign key(fkid_posto)
references posto_de_saude(id_posto);
alter table posto_possui_estoque
add foreign key(fkid_estoque)
references estoque(id_estoque);
insert into posto_possui_estoque
values(330,200,10);
insert into posto_possui_estoque
values(331,201,11);
insert into posto_possui_estoque
values(332,202,12);
insert into posto_possui_estoque
values(333,203,13);
insert into posto_possui_estoque
values(334,204,14);
insert into posto_possui_estoque
values(335,205,15);
insert into posto_possui_estoque
values(336,206,16);
insert into posto_possui_estoque
values(337,207,17);
insert into posto_possui_estoque
values(338,208,18);
insert into posto_possui_estoque
values(339,209,19);


create table pessoa_frequenta_posto(id_pfp int primary key not null,fkid_posto int not
null,fkid_pessoa int not null,dt_visita date not null);
alter table pessoa_frequenta_posto
add foreign key(fkid_posto)
references posto_de_saude(id_posto);
alter table pessoa_frequenta_posto
add foreign key(fkid_pessoa)
references pessoa(id_pessoa);
insert into pessoa_frequenta_posto
values(550,10,1,'12/06/2021');
insert into pessoa_frequenta_posto
values(551,11,5,'12/05/2021');
insert into pessoa_frequenta_posto
values(552,12,2,'12/12/2021');
insert into pessoa_frequenta_posto
values(553,13,10,'10/07/2021');
insert into pessoa_frequenta_posto
values(554,14,6,'02/04/2021');
insert into pessoa_frequenta_posto
values(555,15,7,'12/05/2021');
insert into pessoa_frequenta_posto
values(556,16,3,'27/05/2021');
insert into pessoa_frequenta_posto
values(557,17,8,'30/06/2021');
insert into pessoa_frequenta_posto
values(558,18,4,'18/08/2021');
insert into pessoa_frequenta_posto
values(559,19,9,'07/06/2021');


create table pessoa_guarda_cartao(id_ppc int primary key not null,fkid_pessoa int not
null,fkid_cartao int not null);
alter table pessoa_guarda_cartao
add foreign key(fkid_pessoa)
references pessoa(id_pessoa);
alter table pessoa_guarda_cartao
add foreign key(fkid_cartao)
references cartao_vacina(id_cartao);
insert into pessoa_guarda_cartao
values(740,1,601);
insert into pessoa_guarda_cartao
values(741,2,602);
insert into pessoa_guarda_cartao
values(742,3,603);
insert into pessoa_guarda_cartao
values(743,4,604);
insert into pessoa_guarda_cartao
values(744,5,605);
insert into pessoa_guarda_cartao
values(745,6,606);
insert into pessoa_guarda_cartao
values(746,7,607);
insert into pessoa_guarda_cartao
values(747,8,609);


create table enfermeiro_aplica_pessoa(id_eap int primary key not null ,fkid_enfermeiro int
not null, fkid_pessoa int not null,dt_aplicacao date not null);
alter table enfermeiro_aplica_pessoa
add foreign key(fkid_enfermeiro)
references enfermeiro(id_enfermeiro);
alter table enfermeiro_aplica_pessoa
add foreign key(fkid_pessoa)
references pessoa(id_pessoa);
insert into enfermeiro_aplica_pessoa
values(820,50,1,'12/06/2021');
insert into enfermeiro_aplica_pessoa
values(821,51,2,'12/12/2021');
insert into enfermeiro_aplica_pessoa
values(822,52,3,'27/05/2021');
insert into enfermeiro_aplica_pessoa
values(823,53,4,'18/08/2021');
insert into enfermeiro_aplica_pessoa
values(824,54,5,'12/05/2021');
insert into enfermeiro_aplica_pessoa
values(825,55,6,'02/04/2021');
insert into enfermeiro_aplica_pessoa
values(826,56,7,'30/06/2021');
insert into enfermeiro_aplica_pessoa
values(827,57,8,'12/09/2021');
insert into enfermeiro_aplica_pessoa
values(828,58,9,'07/06/2021');
insert into enfermeiro_aplica_pessoa
values(829,59,10,'10/07/2021');


create table enfermeiro_trabalha_hospital(id_eth int primary key not null,fkid_enfermeiro
int not null,fkid_posto int not null,horas time not null);
alter table enfermeiro_trabalha_hospital
add foreign key (fkid_enfermeiro)
references enfermeiro(id_enfermeiro);
alter table enfermeiro_trabalha_hospital
add foreign key (fkid_posto)
references posto_de_saude(id_posto);
insert into enfermeiro_trabalha_hospital
values(901,50,10,'12:00:00');
insert into enfermeiro_trabalha_hospital
values(902,51,11,'11:00:00');
insert into enfermeiro_trabalha_hospital
values(903,52,12,'09:00:00');
insert into enfermeiro_trabalha_hospital
values(904,53,13,'04:00:00');
insert into enfermeiro_trabalha_hospital
values(905,54,14,'05:00:00');
insert into enfermeiro_trabalha_hospital
values(906,55,15,'08:00:00');
insert into enfermeiro_trabalha_hospital
values(907,56,16,'09:00:00');
insert into enfermeiro_trabalha_hospital
values(908,57,17,'10:00:00');
insert into enfermeiro_trabalha_hospital
values(909,58,18,'09:00:00');
insert into enfermeiro_trabalha_hospital
values(910,59,19,'07:00:00');
