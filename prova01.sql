create database prova01;
use prova01;

create table cliente(
id_cliente int not null auto_increment,
nome_cliente varchar(50),
rg varchar(20),
cpf varchar(20),
endereco_cliente varchar(50),
primary key (id_cliente)
)default charset=utf8;

desc cliente;

create table editora(
id_editora int not null auto_increment,
nome_fantasia varchar (50),
razao_social varchar(50),
endereco_editora varchar(50),
telefone_editora varchar(50),
primary key (id_editora)
)default charset=utf8;

desc editora;

create table livro(
id_livro int not null auto_increment,
isbn varchar(5),
titulo varchar(50),
preco float,
categoria varchar(50),
cod_editora int,
primary key (id_livro)
)default charset=utf8;

desc livro;

alter table livro add constraint fk_editora foreign key (cod_editora) references editora(id_editora);

create table pedido(
id_pedido int not null auto_increment,
cod_livro int,
qtd_pedido int,
primary key (id_pedido)
)default charset=utf8;

desc pedido;

alter table pedido add constraint fk_livro foreign key (cod_livro) references livro(id_livro);

create table venda(
id_venda int not null auto_increment,
cod_pedido int,
cod_cliente int,
data_venda date,
desconto varchar(3),
valor_bruto float,
primary key (id_venda)
)default charset=utf8;

desc venda;

alter table venda add constraint fk_pedido foreign key (cod_pedido) references pedido(id_pedido);

alter table venda add constraint fk_cliente foreign key (cod_cliente) references cliente(id_cliente);

insert into cliente(nome_cliente,rg ,cpf ,endereco_cliente )values
('Fabio','123456789','123456789','Curitiba');

insert into editora(nome_fantasia,razao_social,endereco_editora,telefone_editora)values
('Vida','Vida','Sao Paulo','011956897678');

insert into livro(isbn , titulo , preco , categoria ,cod_editora)values
('157','Pega Fogo', '50.00', 'Cronica','1');

insert into pedido(cod_livro, qtd_pedido)values
('1','1');

insert into venda(cod_pedido,cod_cliente, data_venda, desconto, valor_bruto)values
('1','1','2002-10-20','50%','50.00');
  

select * from cliente;
select * from venda;
select * from pedido;
select * from livro;
select * from editora;

select editora.nome_fantasia as NomeEditora, cliente.nome_cliente as NomeCliente, livro.titulo as TituloLivro, livro.preco as PreçoLivro,
 qtd_pedido as QuantidadeLivro, venda.desconto as DescontoVenda, venda.valor_bruto as ValorTotal from cliente 
inner join venda on cliente.id_cliente = venda.cod_cliente
inner join pedido on pedido.id_pedido = venda.cod_pedido
inner join livro on livro.id_livro = pedido.cod_livro
inner join editora on editora.id_editora = livro.cod_editora
order by editora.nome_fantasia, cliente.nome_cliente, livro.titulo;