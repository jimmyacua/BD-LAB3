/*
 * LAB 3: Jimmy Acuña Díaz - B50060 
*/

use DB_B50060;

--Punto 3:


Create Table Estudiante(
Cedula char(9) PRIMARY KEY,
Email varchar(20),
Nombre varchar(15),
Apellido1 varchar(15),
Apellido2 varchar(15),
sexo char,
FechaNac date,
Direccion varchar(30),
Telefono char(8),
Carné char(6) not null,
Estado VARCHAR(15)
);

Create table Profesor(
Cedula char(9) PRIMARY KEY,
Email varchar(20) not null,
Nombre varchar(15),
Apellido1 varchar(15),
Apellido2 varchar(15),
sexo char,
FechaNac date,
Direccion varchar(30),
Telefono char(8),
Categoría varchar(15),
FechaNom date,
Oficina char(5)
);

Create Table Asistente(
Cedula char(9) FOREIGN KEY (Cedula) REFERENCES Estudiante (Cedula) on delete cascade,
NumHoras int,
primary key (Cedula)
);


Create table Curso(
Sigla char(7) PRIMARY KEY,
Nombre varchar(20),
Créditos int
);

Create table Grupo(
SiglaCurso char(7) FOREIGN KEY (SiglaCurso) references Curso (Sigla) on delete no action,
 NumGrupo int,
 Semestre int check (1 <= Semestre  and semestre >= 2),
 Año int
 primary key(SiglaCurso,NumGrupo,Semestre,Año),
 CedProf char(9) foreign key (CedProf) references Profesor on update cascade not null,
 Carga int,
 CedAsistente char(9) foreign key (CedAsistente) references Asistente (Cedula)
);


Create table Lleva (
CedEstudiante char(9) constraint FKCedEstudiante
 foreign key (CedEstudiante)  references Estudiante (Cedula),
SiglaCurso char(7),
NumGrupo int,
Semestre int check (1 <= Semestre  and Semestre >= 2),
Año int
primary key(CedEstudiante,SiglaCurso,NumGrupo, Semestre, Año),
foreign key(SiglaCurso,NumGrupo, Semestre, Año) references Grupo(SiglaCurso,NumGrupo,Semestre,Año)
);


create table Requiere_De(
SiglaCursoRequeridor char(7) foreign key (SiglaCursoRequeridor) references Curso (Sigla),
SiglaCursoRequisito char(7) foreign key (SiglaCursoRequisito) references Curso (Sigla),
primary key(SiglaCursoRequeridor,SiglaCursoRequisito)
);

create table Carrera(
Codigo varchar(10) constraint PKCodigo primary key,
Nombre varchar(15),
AñoCreacion int default 1995
);

create table Pertence_A(
SiglaCurso char(7) constraint FKSiglaCurso Foreign key (SiglaCurso) references Curso (Sigla),
CodCarrera varchar(10) constraint FKCodigoCarrera Foreign key (CodCarrera) references Carrera,
NivelPlanEstudios varchar(15),
primary key(SiglaCurso,CodCarrera)
);

create table Empadronado_En(
CedEstudiante char(9) constraint FKCedEst foreign key (CedEstudiante) references Estudiante (Cedula),
CodCarrera varchar(10) foreign key (CodCarrera) references Carrera,
FechaIngreso date,
FechaGraducación date,
primary key(CedEstudiante,CodCarrera)
);


create table Comisión(
Nombre varchar(15) primary key,
Tipo varchar(15),
Observ varchar(20)
);


create table Asignado_A(
cedProf char(9) constraint CedProf foreign key (cedProf) references Profesor ON UPDATE CASCADE,
NombComision varchar(15) foreign key (NombComision) references Comisión,
Puesto varchar(15),
Carga int
);

---------------------------------------------------------------------------------------
--Lab 4: omitir en la revisión del lab 3.

CREATE TABLE dbo.[Usuarios]
(
cedulaUsuario CHAR (9) NOT NULL ,
nombreUsuario NVARCHAR ( 40 ) NOT NULL PRIMARY KEY ,
PasswordHash BINARY ( 64 ) NOT NULL ,
salt UNIQUEIDENTIFIER,
FOREIGN KEY (cedulaUsuario) REFERENCES ESTUDIANTE (cedula)
);
----------------------------------------------------------------------------------------------------------

--punto 4:

insert into Estudiante
values ('111222333', 'josef@gmail.com', 'Josefo', 'Martinez','Gauss',
'm','1991-11-21', null, '88118811' , 'B01991', 'Graduado');
insert into Estudiante
values ('99888777', 'anrz@gmail.com', 'Antonia', 'Rodriguez','Perez',
'f','1994-07-1', null, '84634210' , 'B28731', 'Activo');

insert into Estudiante
values ('176543219', 'esteb@gmail.com', 'Esteban', 'Madrigal','Soto',
'm','1997-05-29', null, '8901234' , 'B56091', 'Activo');
insert into Estudiante
values ('876543219', 'jen@gmail.com', 'Jenny', 'Cascante','Castro',
'f','1999-03-19', null, '88664422' , 'B71354', 'Activo');



insert into Profesor
values('123456789','alexm@gmail.com', 'Alexandra', 'Martinez',null, 'F', '1986-10-14',
null, '87654321', 'Asociada', '2008-01-01', 'IF502');
insert into Profesor
values('187654321','chiki@gmail.com', 'Francisco', 'Arroyo',null, 'M', '1960-06-23',
null, '86543210', 'Catedratico', '2005-08-13', 'IF210');
insert into Profesor
values('234567890','skikut@gmail.com', 'Sandra', 'Kikut','Valverde', 'F', '1971-01-10',
null, '85437121', 'Catedratico', '2008-06-01', 'IF212');

insert into Asistente
values('111222333', 9);
insert into Asistente
values('99888777', 5);


insert into Curso 
values('ci1310', 'Sistemas Operativos', 4);
insert into Curso 
values('ci1312', 'Bases de Datos 1', 4);
insert into Curso 
values('ci1221', 'Estructuras de datos', 4);


insert into Grupo
values('ci1310', 1, 2, 2018, '187654321',4, '111222333');
insert into Grupo
values('ci1312', 1, 2, 2018, '123456789',4, '99888777');


insert into Lleva 
values('176543219','ci1310', 1, 2,2018);
insert into Lleva 
values('876543219','ci1312', 1, 2,2018);


insert into Requiere_De 
values('ci1310','ci1221');
insert into Requiere_De 
values('ci1312','ci1221');

insert into Carrera 
values('420705','Computación', 1960);
insert into Carrera 
values('420201','Ing Electrica', 1965);
insert into Carrera 
values('000010','Historia', 2001);

select * from Carrera;

--5:
update Carrera
set AñoCreacion = '1975'
where Codigo = '420705';

--6:
delete from Carrera
where Codigo = '000010';

--7:

--7.a:

-- delete cascade
select g.CedAsistente
from Asistente a join Grupo g on g.CedAsistente = a.Cedula;

--delete no action
select g.SiglaCurso
from Grupo g join Curso c on c.Sigla = g.SiglaCurso;

--update cascade
select p.Cedula
from Grupo g join Profesor p on p.Cedula = g.CedProf;

--7.b:
select g.CedAsistente, a.Cedula
from Asistente a join Grupo g on g.CedAsistente = a.Cedula;

select c.Sigla, g.SiglaCurso
from Grupo g join Curso c on c.Sigla = g.SiglaCurso;

select p.Cedula, g.CedProf
from Grupo g join Profesor p on p.Cedula = g.CedProf;

--7.c
delete from Estudiante
where Cedula = '111222333';

select *
from Grupo;


delete from Curso
where Sigla = 'ci1312';

select c.Sigla, g.SiglaCurso
from Grupo g join Curso c on c.Sigla = g.SiglaCurso;


update Profesor
set Cedula = '187654300'
where Cedula = '187654321';
select p.Cedula, g.CedProf
from Grupo g join Profesor p on p.Cedula = g.CedProf;

