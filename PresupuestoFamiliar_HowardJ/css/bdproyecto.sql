

/**

- Usuario:  email, idusuario,tipousuario, clave
- Personas: id, cedula, Nombre, Apellido1, Apellido2, Direccion, telefono
- Transaccion: id, idtipotransaccion, email, Descripcion, Monto, Fecha
- Tipo_trasaccion: id, Descripcion, TipoContable
- TipoUsuario: id, Descripcion
- TipoUsuario_Auditoria: id, Descripcion, usuario, Tipo, fecha

**/

Create database UHPRESUPUESTO

use UHPRESUPUESTO

CREATE table persona
(
   Id int identity(1,1),
   Cedula varchar(20) not null,
   Nombre varchar(50) not null,
   Apellido1 Varchar(50),
   Direccion nvarchar(100),
   telefono varchar(20),
   constraint PK_ID PRIMARY KEY(ID),
   CONSTRAINT UQ_Cedula Unique (Cedula)
)

Create table TipoUsuario
(
  Id int identity(1,1),
  Descripcion varchar(50) not null,
   constraint PK_IDtipousuario PRIMARY KEY(ID)
)

insert into TipoUsuario values ('Administrador'),('Regular')
select * from TipoUsuario

Create table TipoTransaccion
(
  Id int identity(1,1),
  Descripcion varchar(50) not null,
  TipoContable Varchar(10) not null
   constraint PK_IDtipotransaccion PRIMARY KEY(ID)
)
insert into TipoTransaccion values ('Ingresos','debe'),('Salidas','Haber')
select * from TipoTransaccion

Create table Usuario
(
   email varchar(20),
   idusuario int, 
   tipousuario int,
   Clave Varchar(30),
   constraint pk_emailusuario PRIMARY KEY (email),
   constraint fk_tipousuario Foreign key (idusuario) REFERENCES PERSONA (ID),
   constraint fk_tipousuarioid Foreign Key (tipousuario) REFERENCES TipoUsuario(ID)

)

Select * from Usuario
insert into Usuario 

Create table transaccion
(
  id int identity,
  idtipotransaccion int,
  email varchar(20),
  Descripcion varchar(50),
  monto money,
  Fecha datetime,
  constraint pk_idtransaccion primary key(id),
  constraint fk_idtipotransaccion foreign key(idtipotransaccion) references tipotransaccion(id),
  constraint fk_idemail foreign key (email) references Usuario(email)
)

--TipoUsuario_Auditoria: id, Descripcion, usuario, Tipo, fecha

CREATE TABLE TipoUsuario_Auditoria
(
  Id int,
  Descripcion varchar(50),
  usuario varchar(30),
  tipo varchar(10),
  fecha datetime

)


CREATE TRIGGER Trigger_Auditoria_TipoUsuario
  on TipoUsuario
  After Insert, Delete
   
    as -- obligatorio
	 begin -- obligatorio
	
	 insert into TipoUsuario_Auditoria  (id, Descripcion, usuario, Tipo, Fecha)
	 select i.id, i.Descripcion, 'DBA','Ingreso',GETDATE() from inserted i
	 union all
	 select d.id, d.Descripcion, 'DBA','Borrado',GETDATE() from deleted d
	
	 end -- obligatorio

	 insert into TipoUsuario values ('Configuracion del sistema')
	 select * from TipoUsuario_Auditoria
	 select * from tipousuario
	 delete TipoUsuario where id = 7



insert into transaccion values (1,'Catalina@gmail.com','Salario quincenal',500000,'2022/07/26')
select * from transaccion

insert into usuario values ('Luis@gmail.com',1,2,'456')
select * from persona
select * from Usuario
select * from TipoUsuario

select * from persona
insert into persona values ('1-56-96','Luis','Carmona','Los Angeles, Barrio Sol','55523-635')

Create procedure Registro
@cedula varchar (20),
@Nombre varchar (50),
@Apellido varchar (50),
@email varchar (20),
@clave varchar (20)

as 
	begin
		insert into persona (cedula, Nombre, Apellido1) values (@cedula, @Nombre, @Apellido)
		insert into Usuario (email, idusuario, tipousuario, Clave)
		select @email, id, 1, @clave from persona where Cedula = @cedula

	end