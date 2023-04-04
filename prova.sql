create database prova1;
uscreatee prova1;

create table cliente(
id_cliente int not null auto_increment primary key,
nome_cliente varchar(50),
rg_cliente varchar(50),
cpf_cliente varchar(50),
endereco_cliente varchar(50)
)default charset=utf8;

desc cliente;

create table editora(
id_editora int not null auto_increment primary key,
nome_editora varchar (50),
razaosocial_editora varchar (50),
endereco_editora varchar (50),
telefone_editora varchar (50)
)default charset=utf8;

desc editora;

create table livro(
id_livro int not null auto_increment primary key,
ISBN_livro varchar (50),
titulo_livro varchar (50),
preco_livro varchar (50),
categoria_livro varchar (50),
cod_editora int
)default charset=utf8;

desc livro;

alter table livro add constraint fk_editora foreign key (cod_editora) references editora(id_editora);

create table pedido(
id_pedido int not null auto_increment primary key,
cod_livro int,
qtd_pedido int
)default charset=utf8;

desc pedido;

alter table pedido add constraint fk_livro foreign key (cod_livro) references livro(id_livro);

create table venda(
id_venda int not null auto_increment primary key,
cod_pedido int,
cod_cliente int,
data_venda date,
desconto varchar (3),
valor_bruto float
)default charset=utf8;

desc venda;

alter table venda add constraint fk_pedido foreign key (cod_pedido) references pedido(id_pedido);
alter table venda add constraint fk_cliente foreign key (cod_cliente) references cliente(id_cliente);

insert into cliente(nome_cliente,rg_cliente,cpf_cliente,endereco_cliente)values
('Fabio','123456789','123456789','Curitiba');

insert into editora(nome_editora,razaosocial_editora,endereco_editora,telefone_editora)values
('Vida','Vida','Sao Paulo','011956897678');

insert into livro(ISBN_livro, titulo_livro, preco_livro, categoria_livro,cod_editora)values
('157','Pega Fogo', '50.00', 'Cronica','1');

insert into pedido(cod_livro, qtd_pedido)values
('1','1');

insert into venda(cod_pedido,cod_cliente, data_venda, desconto, valor_bruto)values
('1','1','2002-10-20','50%','50.00');

select * from cliente;
select * from editora;
select * from livro;
select * from pedido;
select * from venda;