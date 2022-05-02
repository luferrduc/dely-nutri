
drop database delynutri;

create database delynutri;

use delynutri;

create table ejercicios(
id_ejercicio int not null auto_increment primary key,
nombre_ejercicio varchar(100) not null,
descripcion varchar(250) not null,
link_video varchar(300) not null);

create table tipo_usuario(
id_tipo int not null auto_increment primary key,
nombre_tipo varchar(200) not null,
descripcion varchar(250) not null);

create table marca(
id_marca int not null auto_increment primary key,
nombre_marca varchar(200) not null
);

create table local_comida(
idLocal int not null auto_increment primary key,
nombre_local varchar(100) not null,
direccion varchar(250) not null);

create table categoria(
id_categoria int not null auto_increment primary key,
nombre_categoria varchar(200) not null,
descripcion varchar(250) not null);

create table usuarios(
idUsuario int not null auto_increment primary key,
usuario varchar(200) not null unique,
email varchar(100) not null unique,
contrasena varchar(100) not null unique,
direccion varchar(350) default('No ha especificado direccion'),
tipo_usuario int not null,
foreign key (tipo_usuario) references tipo_usuario(id_tipo));

create table producto(
id_producto int not null auto_increment primary key,
nombre_producto varchar(100) not null,
calorias int not null,
precio int not null,
id_categoria int not null,
id_marca int not null,
foreign key (id_categoria) references categoria(id_categoria),
foreign key (id_marca) references marca(id_marca));

create table pedido(
id_pedido int not null auto_increment primary key,
direccion_entregar varchar(250) not null,
direccion_buscar varchar(250) not null,
nombre_repartidor varchar(100) not null,
fecha_pedido time not null,
idLocal int not null,
idUsuario int not null,
idRepartidor int not null,
foreign key (idLocal) references local_comida(idLocal),
foreign key (idUsuario) references usuarios(idUsuario),
foreign key (idRepartidor) references usuarios(idUsuario));

create table detalle_pedido(
num_detalle int not null,
id_pedido int not null,
precio int not null,
cantidad int not null,
id_producto int not null,
nombre_producto varchar(100) not null,
primary key(num_detalle,id_pedido),
foreign key(id_producto) references producto(id_producto),
foreign key(id_pedido) references pedido(id_pedido));

/* Local comida*/

insert into local_comida values(1,'McDonals','Parcelina #234, Santiago, RM');
insert into local_comida values(2,'Burger King','Parcelina #235, Santiago, RM');
insert into local_comida values(3,'Dominos Pizza','Parcelina #236, Santiago, RM');
insert into local_comida values(4,'KFC','Parcelina #276, Santiago, RM');
insert into local_comida values(5,'Subway','Parcelina #295, Santiago, RM');

/* Tipo usuario */

insert into tipo_usuario values(1, 'Cliente', 'sera quien comprara productos');
insert into tipo_usuario values(2, 'Repartidor', 'sera quien repartira los productos');
insert into tipo_usuario values(3, 'Administrador', 'sera quien administrara la aplicacion web');

/* Categorias */

insert into categoria values('1','Comida sana','En esta categoria se encontrara todo tipo de comida sana');
insert into categoria values('2','Comida rapida','En esta categoria se encontrara todo tipo de comida rapida');

/* Marcas */

insert into marca values ('1','McDonals');
insert into marca values ('2','Burger King');
insert into marca values ('3','Dominos Pizza');
insert into marca values ('4','KFC');
insert into marca values ('5','Subway');

/* Productos */

insert into producto values ('1','Big Mac','580','3390','2','1');
insert into producto values ('2','Pollo Italiano','344','3290','2','1');
insert into producto values ('3','Papas Fritas','461','1550','2','1');
insert into producto values ('4','Ensalada Junior','24','4500','1','1');
insert into producto values ('5','Whopper','640','4150','2','2');
insert into producto values ('6','SteakHouse','896','5350','2','2');
insert into producto values ('7','Papas Fritas','417','1800','2','2');
insert into producto values ('8','Ensalada Delight','41','4700','1','2');
insert into producto values ('9','Pizza Pepperoni Mediana','366','10800','2','3');
insert into producto values ('10','Pizza Campesina Mediana','295','11800','2','3');
insert into producto values ('11','Pizza Hawaiana Mediana','380','10800','2','3');
insert into producto values ('12','3 piezas de pollo','623','3600','2','4');
insert into producto values ('13','3 Alitas Picantes','243','2400','2','4');
insert into producto values ('14','Pechuga de pollo','915','2490','2','4');
insert into producto values ('15','Ensalada Coronel','374','3700','1','4');
insert into producto values ('16','Sub Jamon de pavo','288','4200','2','5');
insert into producto values ('17','Sub Pechuga de pollo','319','4850','2','5');
insert into producto values ('18','Sub Pollo Teriyaki','322','6500','2','5');
insert into producto values ('19','Ensalada de atun','55','5650','1','5');

/* Ejercicios */

insert into ejercicios values ('1','Fondo de triceps con apoyo','5 minutos, 2 veces, ideal para desarrollar musculatura en brazos.','https://www.youtube.com/watch?v=PYapgguXgT8');
insert into ejercicios values ('2','Plancha','1 minuto y medio, 3 veces, ayuda a desarrollar hombros y piernas, ademas de fuerza y resistencia.','https://www.youtube.com/watch?v=zfY5XXa26ug');
insert into ejercicios values ('3','Mountain Climber','3 minutos cada pie, ayuda a los abdominales oblicuos, hombros, y abdomen.','https://www.youtube.com/watch?v=lD_gfTofg4A');
insert into ejercicios values ('4','Skipping','5 minutos, 2 veces, pone en marcha nuestros musculos y tendones.','https://www.youtube.com/watch?v=j8XGysKsPFc');
insert into ejercicios values ('5','Jumping Jacks','5 minutos, trabaja en las piernas','https://www.youtube.com/watch?v=95j1mH27eXc');
insert into ejercicios values ('6','Burpees','3 minutos, 2 veces, se trabaja fuerza, resistencia y coordinacion. ','https://www.youtube.com/watch?v=auBLPXO8Fww');
insert into ejercicios values ('7','Flexiones con rodillas apoyadas','3 minutos, 3 veces, es un ejercicio para gente que recien comienza en el mundo fitness, ayuda en triceps y hombros.','https://www.youtube.com/watch?v=jXrEgCvMMzw');
insert into ejercicios values ('8','Donkey Kicks','3 minutos cada pie, ideal para trabajar gluteos, se puede complementar con el Fire Hydrant.','https://www.youtube.com/watch?v=SJ1Xuz9D-ZQ');
insert into ejercicios values ('9','Toque de talon','4 minutos, ejercita el musculo recto abdominal.','https://www.youtube.com/watch?v=FKzs34SjBuc');
insert into ejercicios values ('10','Fire Hydrant','3 minutos cada pie, fortalece los gluteos junto con los Donkey Kicks.','https://www.youtube.com/watch?v=La3xYT8MGks');
insert into ejercicios values ('11','Zancadas','5 minutos, trabaja la parte trasera de las piernas y el musculo gluteo mayor y tambien los cuadriceps.','https://www.youtube.com/watch?v=qfKHl9_EvWc&t=17s');
insert into ejercicios values ('12','Superman','3 minutos, 2 veces, proporciona apoyo a la columna vertebral, ayuda a tener una buena postura.','https://www.youtube.com/watch?v=pooU6myuK7E');
insert into ejercicios values ('13','Salto Lateral','7 minutos, Ideal para calentar musculos y prevenir lesiones, entrena las caderas, gluetos, muslos y piernas','https://www.youtube.com/watch?v=1mStIPjEYqA');
insert into ejercicios values ('14','Russian Twist','2 minutos, 2 veces, trabajan los musculos externos e internos del abdomen.','https://www.youtube.com/watch?v=JyUqwkVpsi8');

/*select * from ejercicios;
select * from marca;
select * from producto;
select * from categoria;
select * from local_comida;*/