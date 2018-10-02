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
Cedula char(9) primary key FOREIGN KEY (Cedula) REFERENCES Estudiante on delete cascade,
NumHoras int 
);


Create table Curso(
Sigla char(7) PRIMARY KEY,
Nombre varchar(20),
Créditos int
);

Create table Grupo(
SiglaCurso char(7) not null FOREIGN KEY (SiglaCurso) references Curso,
 NumGrupo int,
 Semestre int check (1 <= Semestre  and semestre >= 2),
 Año int
 primary key(SiglaCurso,NumGrupo,Semestre,Año),
 CedProf char(9) foreign key (CedProf) references Profesor on update cascade not null,
 Carga int,
 CedAsistente char(9) foreign key (CedAsistente) references Asistente on delete no action
);

drop table Lleva
Create table Lleva (
CedEstudiante char(9) foreign key (CedEstudiante) references Estudiante,
SiglaCurso char(7),
NumGrupo int,
Semestre int check (1 <= Semestre  and Semestre >= 2),
Año int
primary key(CedEstudiante,SiglaCurso,NumGrupo, Semestre, Año),
foreign key(SiglaCurso,NumGrupo, Semestre, Año) references Grupo(SiglaCurso,NumGrupo,Semestre,Año)
);


create table Requiere_De(
SiglaCursoRequeridor char(7) foreign key (SiglaCursoRequeridor) references Curso,
SiglaCursoRequisito char(7) foreign key (SiglaCursoRequisito) references Curso,
primary key(SiglaCursoRequeridor,SiglaCursoRequisito)
);

create table Carrera(
Codigo varchar(10) constraint PKCodigo primary key,
Nombre varchar(15),
AñoCreacion int default 1995
);


create table Pertence_A(
SiglaCurso char(7) constraint FKSiglaCurso Foreign key (SiglaCurso) references Curso,
CodCarrera varchar(10) constraint FKCodigoCarrera Foreign key (CodCarrera) references Carrera,
NivelPlanEstudios varchar(15),
primary key(SiglaCurso,CodCarrera)
);

----------------------------------------------------------------------------------------------------------

--punto 4:

insert into Estudiante
values ('111222333', 'josef@gmail.com', 'Josefo', 'Martinez','Gauss',
'm','1991-11-21', null, '88118811' , 'B01991', 'Grad');