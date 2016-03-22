--////////////////////////////////////////////////////////////////////////////
-- DEFINICION DEL MODELO DE DATOS FORMARCA  PARA EQUIPOS Y COMPETICIONES
-- - Definicion del modelo al 20001227
-- - Definicion para SQLServer
--////////////////////////////////////////////////////////////////////////////

--////////////////////////////////////////////////////////////////////////////
-- DESTRUCCION DE TABLAS
--////////////////////////////////////////////////////////////////////////////

-- Nivel 5.
drop table PuntosCompeticionEst
drop table PuntosCompeticion
drop table PartidoFutbol
drop table ProbabilidadPuesto

-- Nivel 4.
drop table EquipoCompite

-- Nivel 3.
drop table FuerzaEquipo
drop table RivalidadEquipo
drop table CompeticionFutbol

-- Nivel 2.
drop table EquipoFutbol
drop table ClaseCompeticionFutbol

-- Nivel 1.
drop table Jornada
drop table TipoCompeticionFutbol
drop table CategoriaCompeticion
drop table TipoEquipo
drop table Nacion

--////////////////////////////////////////////////////////////////////////////
-- Equipos y competiciones
--////////////////////////////////////////////////////////////////////////////

--////////////////////////////////////////////////////////////////////////////
-- Nivel 1 (Dominios, no mantienen integridad referencial con otras tablas)
--////////////////////////////////////////////////////////////////////////////

--////////////////////////////////////////////////////////////////////////////
   create table Nacion
--
-- PURPOSE: Definicion de la tabla de naciones, que no hay que confundir con
--          paises, por ejemplo, Escocia es una nacion que tiene una
--          seleccion, pero no es un pais.
--
--////////////////////////////////////////////////////////////////////////////
(
  codigo      char(12),
  descripcion char(40),
  constraint  pk_nacion primary key (codigo)
)


--////////////////////////////////////////////////////////////////////////////
   create table TipoEquipo
--
-- PURPOSE: Definicion de la tabla con la taxonomia de equipos, por ejemplo,
--          clubes y selecciones.
--
--////////////////////////////////////////////////////////////////////////////
(
  codigo      char(12),
  descripcion char(40),
  constraint  pk_tipoEquipo primary key (codigo)
)


--////////////////////////////////////////////////////////////////////////////
   create table CategoriaCompeticion
--
-- PURPOSE: Definicion de la tabla de categorias en las competiciones, por
--          ejemplo, primera division, segunda division o categoria unica.
--
--////////////////////////////////////////////////////////////////////////////
(
  codigo      char(12),
  descripcion char(40),
  constraint  pk_categoriaCompeticion primary key (codigo)
)


--////////////////////////////////////////////////////////////////////////////
   create table TipoCompeticionFutbol
--
-- PURPOSE: Definicion de la tabla de los tipos de competiciones de futbol,
--          por ejemplo, de tipo liga, de tipo copa u otras.
--
--////////////////////////////////////////////////////////////////////////////
(
  codigo      char(12),
  descripcion char(80),
  constraint  pk_tipoCompeticionFutbol primary key (codigo)
)


--////////////////////////////////////////////////////////////////////////////
   create table Jornada
--
-- PURPOSE: Definicion de la tabla de jornadas de las competiciones.
--
--////////////////////////////////////////////////////////////////////////////
(
  codigo      char(12),
  descripcion char(40),
  constraint  pk_jornada primary key (codigo)
)


--////////////////////////////////////////////////////////////////////////////
-- Nivel 2.
--////////////////////////////////////////////////////////////////////////////

--////////////////////////////////////////////////////////////////////////////
   create table ClaseCompeticionFutbol
--
-- PURPOSE: Definicion de la tabla de las clases de competiciones de futbol,
--          cada clase competicion pertenece a un tipo (liga, copa, etc.) y
--          son ejemplos, la liga (codigo) italiana (dominio) de primera 
--          division (categoria) o la liga (codigo) española (dominio) de
--          segunda division (categoria), cuando hay una sola categoria es
--          categoria unica, por ejemplo la Copa del Rey (codigo) española
--          (dominio).
--
--////////////////////////////////////////////////////////////////////////////
(
  competicion char(12),
  dominio     char(12),
  categoria   char(12),
  descripcion char(100),
  foreign key (competicion) references TipoCompeticionFutbol,
  foreign key (dominio)     references Nacion,
  foreign key (categoria)   references CategoriaCompeticion,
  constraint  pk_claseCompeticionFutbol primary key
              (competicion,dominio,categoria)
)


--////////////////////////////////////////////////////////////////////////////
   create table EquipoFutbol
--
-- PURPOSE: Definicion de la tabla de los equipos de futbol.
--
--////////////////////////////////////////////////////////////////////////////
(
  codigo        char(12),
  tipoEquipo    char(12) not null,
  nacion        char(12) not null,
  fuerzaInicial float    not null,
  descripcion   char(40),
  foreign key   (nacion)     references Nacion,
  foreign key   (tipoEquipo) references TipoEquipo,
  constraint    pk_equipo primary key (codigo)
)


--////////////////////////////////////////////////////////////////////////////
-- Nivel 3.
--////////////////////////////////////////////////////////////////////////////

--////////////////////////////////////////////////////////////////////////////
   create table CompeticionFutbol
--
-- PURPOSE: Definicion de la tabla de las competiciones de futbol, una 
--          competicion pertenece a una categoria (ClaseCompeticionFutbol) y
--          ocurre en una fecha determinada.
--
--////////////////////////////////////////////////////////////////////////////
(
  competicion char(12),
  dominio     char(12),
  categoria   char(12),
  fechaInicio datetime,
  fechaFin    datetime,
  foreign key (competicion, dominio, categoria)
              references ClaseCompeticionFutbol,
  constraint  pk_competicionFutbol primary key
              (competicion, dominio, categoria, fechaInicio)
)


--////////////////////////////////////////////////////////////////////////////
   create table RivalidadEquipo
--
-- PURPOSE: Tabla para asociar dos equipos tradicionalmente rivales.
--
--////////////////////////////////////////////////////////////////////////////
(
  equipo      char(12),
  equipoRival char(12),
  rivalidad   float     not null,
  foreign key (equipo)      references EquipoFutbol,
  foreign key (equipoRival) references EquipoFutbol,
  constraint  pk_rivalidadEquipo primary key (equipo, equipoRival)
)


--////////////////////////////////////////////////////////////////////////////
   create table FuerzaEquipo
--
-- PURPOSE: Definicion de la tabla de la fuerza de los equipos.
--
--////////////////////////////////////////////////////////////////////////////
(
  equipo      char(12),
  fecha       datetime,
  fuerza      float    not null,
  foreign key (equipo) references EquipoFutbol,
  constraint  pk_fuerzaEquipo primary key (equipo, fecha)
)


--////////////////////////////////////////////////////////////////////////////
-- Nivel 4.
--////////////////////////////////////////////////////////////////////////////

--////////////////////////////////////////////////////////////////////////////
   create table EquipoCompite
--
-- PURPOSE: Definicion de la tabla de los equipos que participan en una
--          competicion.
--
--////////////////////////////////////////////////////////////////////////////
(
  competicion char(12),
  dominio     char(12),
  categoria   char(12),
  fechaInicio datetime,
  equipo      char(12),
  relevancia  float     not null,
  foreign key (competicion, dominio, categoria, fechaInicio)
               references CompeticionFutbol,
  foreign key (equipo) references EquipoFutbol,
  constraint  pk_equipoCompite primary key
              (competicion, dominio, categoria, fechaInicio, equipo)
)


--////////////////////////////////////////////////////////////////////////////
-- Nivel 5.
--////////////////////////////////////////////////////////////////////////////

--////////////////////////////////////////////////////////////////////////////
   create table ProbabilidadPuesto
--
-- PURPOSE: Definicion de la tabla de las probabilidades de que un
--          equipo gane una competicion.
--
--////////////////////////////////////////////////////////////////////////////
(
  competicion  char(12),
  dominio      char(12),
  categoria    char(12),
  fechaInicio  datetime,
  equipo       char(12),
  puesto       integer   not null,
  fechaCalculo datetime,
  probabilidad float     not null,
  foreign key (competicion, dominio, categoria, fechaInicio, equipo)
               references EquipoCompite,
  constraint  pk_probabilidadGanar primary key
              (competicion, dominio, categoria, fechaInicio, equipo,
               puesto, fechaCalculo)
)


--////////////////////////////////////////////////////////////////////////////
   create table PartidoFutbol
--
-- PURPOSE: Definicion de la tabla de los partidos. Cuando un partido no esta
--          todavia jugado los goles de uno y otro equipo son Null.
--
--////////////////////////////////////////////////////////////////////////////
(
  competicion        char(12),
  dominio            char(12),
  categoria          char(12),
  fechaInicio        datetime,
  jornada            char(12),
  fechaPartido       datetime,
  equipoLocal        char(12) not null,
  equipoVisitante    char(12) not null,
  golesLocal         integer,
  golesVisitante     integer,
  penaltiesLocal     integer,
  penaltiesVisitante integer,
  interes            float,
  foreign key (jornada) references Jornada,
  foreign key (competicion, dominio, categoria, fechaInicio, equipoLocal)
               references EquipoCompite,
  foreign key (competicion, dominio, categoria, fechaInicio, equipoVisitante)
               references EquipoCompite,
  constraint  pk_partido primary key
              (competicion, dominio, categoria, fechaInicio,
               fechaPartido, equipoLocal)
)


--////////////////////////////////////////////////////////////////////////////
   create table PuntosCompeticion
--
-- PURPOSE: Definicion de la tabla para almacenar los puntos que tiene
--          un equipo en una competicion.
--
--////////////////////////////////////////////////////////////////////////////
(
  competicion char(12),
  dominio     char(12),
  categoria   char(12),
  fechaInicio datetime,
  equipo      char(12),
  fecha       datetime,
  puntos      integer not null,
  foreign key (competicion, dominio, categoria, fechaInicio, equipo)
              references EquipoCompite,
  constraint  pk_puntosCompeticion primary key
              (competicion, dominio, categoria, fechaInicio, equipo, fecha)
)


--////////////////////////////////////////////////////////////////////////////
   create table PuntosCompeticionEst
--
-- PURPOSE: Definicion de la tabla para almacenar los puntos que se
--          estiman para un equipo en una competicion.
--
--////////////////////////////////////////////////////////////////////////////
(
  competicion    char(12),
  dominio        char(12),
  categoria      char(12),
  fechaInicio    datetime,
  equipo         char(12),
  fecha          datetime,
  mediaPuntos    float     not null,
  varianzaPuntos float     not null,
  fechaCalculo   datetime,
  foreign key    (competicion, dominio, categoria, fechaInicio, equipo)
                 references EquipoCompite,
  constraint     pk_puntosCompeticionEst primary key
                 (competicion, dominio, categoria, fechaInicio,
                  equipo, fecha, fechaCalculo)
)
