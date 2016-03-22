--////////////////////////////////////////////////////////////////////////////
-- DEFINICION DEL MODELO DE DATOS FORMARCA  PARA EQUIPOS Y COMPETICIONES
-- - Definicion del modelo al 20001227
-- - Definicion para SQLServer
--////////////////////////////////////////////////////////////////////////////

--////////////////////////////////////////////////////////////////////////////
-- DESTRUCCION DE TABLAS
--////////////////////////////////////////////////////////////////////////////

-- Nivel 5.
drop table fn2PuntosCompeticionEst;
drop table fn2PuntosCompeticion;
drop table fn2PartidoFutbol;
drop table fn2ProbabilidadPuesto;

-- Nivel 4.
drop table fn2EquipoCompite;

-- Nivel 3.
drop table fn2FuerzaEquipo;
drop table fn2RivalidadEquipo;
drop table fn2CompeticionFutbol;

-- Nivel 2.
drop table fn2EquipoFutbol;
drop table fn2ClaseCompeticionFutbol;

-- Nivel 1.
drop table fn2Jornada;
drop table fn2TipoCompeticionFutbol;
drop table fn2CategoriaCompeticion;
drop table fn2TipoEquipo;
drop table fn2Nacion;

--////////////////////////////////////////////////////////////////////////////
-- Equipos y competiciones
--////////////////////////////////////////////////////////////////////////////

--////////////////////////////////////////////////////////////////////////////
-- Nivel 1 (Dominios, no mantienen integridad referencial con otras tablas)
--////////////////////////////////////////////////////////////////////////////

--////////////////////////////////////////////////////////////////////////////
   create table fn2Nacion
--
-- PURPOSE: Definicion de la tabla de naciones, que no hay que confundir con
--          paises, por ejemplo, Escocia es una nacion que tiene una
--          seleccion, pero no es un pais.
--
--////////////////////////////////////////////////////////////////////////////
(
  codigo      char(12),
  descripcion char(40),
  constraint  nacionPK primary key (codigo)
                             using index tablespace Marca_IDX
)
  pctfree 10
  pctused 40
  tablespace Marca
  storage (  initial 50K
             next 50K
             maxextents 249
             pctincrease 50);

--////////////////////////////////////////////////////////////////////////////
   create table fn2TipoEquipo
--
-- PURPOSE: Definicion de la tabla con la taxonomia de equipos, por ejemplo,
--          clubes y selecciones.
--
--////////////////////////////////////////////////////////////////////////////
(
  codigo      char(12),
  descripcion char(40),
  constraint  tipoEquipoPK primary key (codigo)
                             using index tablespace Marca_IDX
)
  pctfree 10
  pctused 40
  tablespace Marca
  storage (  initial 50K
             next 50K
             maxextents 249
             pctincrease 50);

--////////////////////////////////////////////////////////////////////////////
   create table fn2CategoriaCompeticion
--
-- PURPOSE: Definicion de la tabla de categorias en las competiciones, por
--          ejemplo, primera division, segunda division o categoria unica.
--
--////////////////////////////////////////////////////////////////////////////
(
  codigo      char(12),
  descripcion char(40),
  constraint  categoriaCompeticionPK primary key (codigo)
                             using index tablespace Marca_IDX
)
  pctfree 10
  pctused 40
  tablespace Marca
  storage (  initial 50K
             next 50K
             maxextents 249
             pctincrease 50);

--////////////////////////////////////////////////////////////////////////////
   create table fn2TipoCompeticionFutbol
--
-- PURPOSE: Definicion de la tabla de los tipos de competiciones de futbol,
--          por ejemplo, de tipo liga, de tipo copa u otras.
--
--////////////////////////////////////////////////////////////////////////////
(
  codigo      char(12),
  descripcion char(80),
  constraint  tipoCompeticionFutbolPK primary key (codigo)
                             using index tablespace Marca_IDX
)
  pctfree 10
  pctused 40
  tablespace Marca
  storage (  initial 50K
             next 50K
             maxextents 249
             pctincrease 50);

--////////////////////////////////////////////////////////////////////////////
   create table fn2Jornada
--
-- PURPOSE: Definicion de la tabla de jornadas de las competiciones.
--
--////////////////////////////////////////////////////////////////////////////
(
  codigo      char(12),
  descripcion char(40),
  constraint  jornadaPK primary key (codigo)
                             using index tablespace Marca_IDX
)
  pctfree 10
  pctused 40
  tablespace Marca
  storage (  initial 50K
             next 50K
             maxextents 249
             pctincrease 50);

--////////////////////////////////////////////////////////////////////////////
-- Nivel 2.
--////////////////////////////////////////////////////////////////////////////

--////////////////////////////////////////////////////////////////////////////
   create table fn2ClaseCompeticionFutbol
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
  foreign key (competicion) references fn2TipoCompeticionFutbol,
  foreign key (dominio)     references fn2Nacion,
  foreign key (categoria)   references fn2CategoriaCompeticion,
  constraint  claseCompeticionFutbolPK primary key
              (competicion,dominio,categoria)
                             using index tablespace Marca_IDX
)
  pctfree 10
  pctused 40
  tablespace Marca
  storage (  initial 50K
             next 50K
             maxextents 249
             pctincrease 50);


--////////////////////////////////////////////////////////////////////////////
   create table fn2EquipoFutbol
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
  foreign key   (nacion)     references fn2Nacion,
  foreign key   (tipoEquipo) references fn2TipoEquipo,
  constraint    equipoFutbolPK primary key (codigo)
                             using index tablespace Marca_IDX
)
  pctfree 10
  pctused 40
  tablespace Marca
  storage (  initial 50K
             next 50K
             maxextents 249
             pctincrease 50);

--////////////////////////////////////////////////////////////////////////////
-- Nivel 3.
--////////////////////////////////////////////////////////////////////////////

--////////////////////////////////////////////////////////////////////////////
   create table fn2CompeticionFutbol
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
  fechaInicio date,
  fechaFin    date,
  foreign key (competicion, dominio, categoria)
              references fn2ClaseCompeticionFutbol,
  constraint  competicionFutbolPK primary key
              (competicion, dominio, categoria, fechaInicio)
                             using index tablespace Marca_IDX
)
  pctfree 10
  pctused 40
  tablespace Marca
  storage (  initial 50K
             next 50K
             maxextents 249
             pctincrease 50);

--////////////////////////////////////////////////////////////////////////////
   create table fn2RivalidadEquipo
--
-- PURPOSE: Tabla para asociar dos equipos tradicionalmente rivales.
--
--////////////////////////////////////////////////////////////////////////////
(
  equipo      char(12),
  equipoRival char(12),
  rivalidad   float     not null,
  foreign key (equipo)      references fn2EquipoFutbol,
  foreign key (equipoRival) references fn2EquipoFutbol,
  constraint  rivalidadEquipoPK primary key (equipo, equipoRival)
                             using index tablespace Marca_IDX
)
  pctfree 10
  pctused 40
  tablespace Marca
  storage (  initial 50K
             next 50K
             maxextents 249
             pctincrease 50);

--////////////////////////////////////////////////////////////////////////////
   create table fn2FuerzaEquipo
--
-- PURPOSE: Definicion de la tabla de la fuerza de los equipos.
--
--////////////////////////////////////////////////////////////////////////////
(
  equipo      char(12),
  fecha       date,
  fuerza      float    not null,
  foreign key (equipo) references fn2EquipoFutbol,
  constraint  fuerzaEquipoPK primary key (equipo, fecha)
                             using index tablespace Marca_IDX
)
  pctfree 10
  pctused 40
  tablespace Marca
  storage (  initial 50K
             next 50K
             maxextents 249
             pctincrease 50);

--////////////////////////////////////////////////////////////////////////////
-- Nivel 4.
--////////////////////////////////////////////////////////////////////////////

--////////////////////////////////////////////////////////////////////////////
   create table fn2EquipoCompite
--
-- PURPOSE: Definicion de la tabla de los equipos que participan en una
--          competicion.
--
--////////////////////////////////////////////////////////////////////////////
(
  competicion char(12),
  dominio     char(12),
  categoria   char(12),
  fechaInicio date,
  equipo      char(12),
  relevancia  float     not null,
  foreign key (competicion, dominio, categoria, fechaInicio)
               references fn2CompeticionFutbol,
  foreign key (equipo) references fn2EquipoFutbol,
  constraint  equipoCompitePK primary key
              (competicion, dominio, categoria, fechaInicio, equipo)
                             using index tablespace Marca_IDX
)
  pctfree 10
  pctused 40
  tablespace Marca
  storage (  initial 50K
             next 50K
             maxextents 249
             pctincrease 50);

--////////////////////////////////////////////////////////////////////////////
-- Nivel 5.
--////////////////////////////////////////////////////////////////////////////

--////////////////////////////////////////////////////////////////////////////
   create table fn2ProbabilidadPuesto
--
-- PURPOSE: Definicion de la tabla de las probabilidades de que un
--          equipo gane una competicion.
--
--////////////////////////////////////////////////////////////////////////////
(
  competicion  char(12),
  dominio      char(12),
  categoria    char(12),
  fechaInicio  date,
  equipo       char(12),
  puesto       integer   not null,
  fechaCalculo date,
  probabilidad float     not null,
  foreign key (competicion, dominio, categoria, fechaInicio, equipo)
               references fn2EquipoCompite,
  constraint  probabilidadPuestoPK primary key
              (competicion, dominio, categoria, fechaInicio, equipo,
               puesto, fechaCalculo)
                             using index tablespace Marca_IDX
)
  pctfree 10
  pctused 40
  tablespace Marca
  storage (  initial 50K
             next 50K
             maxextents 249
             pctincrease 50);

--////////////////////////////////////////////////////////////////////////////
   create table fn2PartidoFutbol
--
-- PURPOSE: Definicion de la tabla de los partidos. Cuando un partido no esta
--          todavia jugado los goles de uno y otro equipo son Null.
--
--////////////////////////////////////////////////////////////////////////////
(
  competicion        char(12),
  dominio            char(12),
  categoria          char(12),
  fechaInicio        date,
  jornada            char(12),
  fechaPartido       date,
  equipoLocal        char(12) not null,
  equipoVisitante    char(12) not null,
  golesLocal         integer,
  golesVisitante     integer,
  penaltiesLocal     integer,
  penaltiesVisitante integer,
  interes            float,
  foreign key (jornada) references fn2Jornada,
  foreign key (competicion, dominio, categoria, fechaInicio, equipoLocal)
               references fn2EquipoCompite,
  foreign key (competicion, dominio, categoria, fechaInicio, equipoVisitante)
               references fn2EquipoCompite,
  constraint  partidoFutbolPK primary key
              (competicion, dominio, categoria, fechaInicio,
               fechaPartido, equipoLocal)
                             using index tablespace Marca_IDX
)
  pctfree 10
  pctused 40
  tablespace Marca
  storage (  initial 50K
             next 50K
             maxextents 249
             pctincrease 50);

--////////////////////////////////////////////////////////////////////////////
   create table fn2PuntosCompeticion
--
-- PURPOSE: Definicion de la tabla para almacenar los puntos que tiene
--          un equipo en una competicion.
--
--////////////////////////////////////////////////////////////////////////////
(
  competicion char(12),
  dominio     char(12),
  categoria   char(12),
  fechaInicio date,
  equipo      char(12),
  fecha       date,
  puntos      integer not null,
  foreign key (competicion, dominio, categoria, fechaInicio, equipo)
              references fn2EquipoCompite,
  constraint  puntosCompeticionPK primary key
              (competicion, dominio, categoria, fechaInicio, equipo, fecha)
                             using index tablespace Marca_IDX
)
  pctfree 10
  pctused 40
  tablespace Marca
  storage (  initial 50K
             next 50K
             maxextents 249
             pctincrease 50);

--////////////////////////////////////////////////////////////////////////////
   create table fn2PuntosCompeticionEst
--
-- PURPOSE: Definicion de la tabla para almacenar los puntos que se
--          estiman para un equipo en una competicion.
--
--////////////////////////////////////////////////////////////////////////////
(
  competicion    char(12),
  dominio        char(12),
  categoria      char(12),
  fechaInicio    date,
  equipo         char(12),
  fecha          date,
  mediaPuntos    float     not null,
  varianzaPuntos float     not null,
  fechaCalculo   date,
  foreign key    (competicion, dominio, categoria, fechaInicio, equipo)
                 references fn2EquipoCompite,
  constraint     puntosCompeticionEstPK primary key
                 (competicion, dominio, categoria, fechaInicio,
                  equipo, fecha, fechaCalculo)
                             using index tablespace Marca_IDX
)
  pctfree 10
  pctused 40
  tablespace Marca
  storage (  initial 50K
             next 50K
             maxextents 249
             pctincrease 50);