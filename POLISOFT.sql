-- Generado por Oracle SQL Developer Data Modeler 4.2.0.932
--   en:        2017-05-07 22:50:54 COT
--   sitio:      Oracle Database 11g
--   tipo:      Oracle Database 11g



CREATE TABLE activo (
    id_activo        INTEGER NOT NULL,
    ca_activo        VARCHAR2(50 BYTE) NOT NULL,
    ca_serial        VARCHAR2(100 BYTE) NOT NULL,
    ca_descripcion   VARCHAR2(2000 BYTE) NOT NULL,
    ca_estado        VARCHAR2(20 BYTE) NOT NULL,
    id_tipo_activo   INTEGER NOT NULL
);

ALTER TABLE activo ADD CONSTRAINT activo_pk PRIMARY KEY ( id_activo );

CREATE TABLE activo_baja (
    fe_baja     DATE NOT NULL,
    ca_lugar    VARCHAR2(200 BYTE) NOT NULL,
    id_activo   INTEGER NOT NULL
);

CREATE TABLE activo_mantenimiento (
    fe_mantenimiento   DATE NOT NULL,
    ca_responsable     VARCHAR2(100 BYTE),
    id_activo          INTEGER NOT NULL,
    id_tercero         INTEGER NOT NULL
);

CREATE TABLE activo_stock (
    nu_disponible    INTEGER NOT NULL,
    ca_ubicacion     VARCHAR2(100 BYTE) NOT NULL,
    id_tipo_activo   INTEGER NOT NULL
);

CREATE TABLE activo_tipo (
    id_tipo_activo   INTEGER NOT NULL,
    ca_tipo_activo   VARCHAR2(50 BYTE) NOT NULL
);

ALTER TABLE activo_tipo ADD CONSTRAINT activo_tipo_pk PRIMARY KEY ( id_tipo_activo );

CREATE TABLE activo_usuario (
    fe_entrega      DATE NOT NULL,
    fe_devolucion   DATE,
    id_personal     INTEGER NOT NULL,
    id_activo       INTEGER NOT NULL
);

ALTER TABLE activo_usuario ADD CONSTRAINT activo_usuario_pk PRIMARY KEY ( id_personal,id_activo );

CREATE TABLE activo_valor (
    fe_compra        DATE NOT NULL,
    fe_adquisicion   DATE,
    nu_precio        NUMBER(10,2) NOT NULL,
    id_activo        INTEGER NOT NULL,
    id_tercero       INTEGER NOT NULL
);

ALTER TABLE activo_valor ADD CONSTRAINT activo_valor_pk PRIMARY KEY ( id_activo );

CREATE TABLE cliente (
    id_cliente     INTEGER NOT NULL,
    ca_cliente     VARCHAR2(200 BYTE) NOT NULL,
    ca_direccion   VARCHAR2(200 BYTE) NOT NULL,
    ca_estado      VARCHAR2(20 BYTE) NOT NULL
);

ALTER TABLE cliente ADD CONSTRAINT cliente_pk PRIMARY KEY ( id_cliente );

CREATE TABLE cliente_contacto (
    ca_contacto   VARCHAR2(200 BYTE) NOT NULL,
    ca_cargo      VARCHAR2(100 BYTE) NOT NULL,
    ca_telefono   VARCHAR2(30 BYTE) NOT NULL,
    ca_email      VARCHAR2(50 BYTE) NOT NULL,
    id_cliente    INTEGER NOT NULL
);

CREATE TABLE cliente_seguimiento (
    ca_motivo        VARCHAR2(30 BYTE) NOT NULL,
    fe_seguimiento   DATE NOT NULL,
    ca_seguimiento   VARCHAR2(4000 BYTE) NOT NULL,
    id_cliente       INTEGER NOT NULL
);

CREATE TABLE cliente_transaccion (
    fe_transaccion   DATE NOT NULL,
    nu_monto         NUMBER(10,2) NOT NULL,
    ca_descripcion   VARCHAR2(4000 BYTE) NOT NULL,
    id_cliente       INTEGER NOT NULL
);

CREATE TABLE documento_area (
    id_area   INTEGER NOT NULL,
    ca_area   VARCHAR2(45 BYTE) NOT NULL
);

ALTER TABLE documento_area ADD CONSTRAINT documento_area_pk PRIMARY KEY ( id_area );

CREATE TABLE documento_auditoria (
    fe_fecha_accion   DATE NOT NULL,
    ca_motivo         VARCHAR2(100 BYTE) NOT NULL,
    id_documento      INTEGER NOT NULL,
    id_usuario        INTEGER NOT NULL
);

CREATE TABLE documento_categoria (
    id_categoria     INTEGER NOT NULL,
    ca_categoria     VARCHAR2(45 BYTE) NOT NULL,
    ca_relevancia    VARCHAR2(45 BYTE),
    ca_descripcion   VARCHAR2(4000 BYTE)
);

ALTER TABLE documento_categoria ADD CONSTRAINT documento_categoria_pk PRIMARY KEY ( id_categoria );

CREATE TABLE documento_detalle (
    ca_documento   VARCHAR2(100 BYTE) NOT NULL,
    ca_ruta        VARCHAR2(200 BYTE) NOT NULL,
    nu_peso        NUMBER(4,2) NOT NULL,
    ca_formato     VARCHAR2(20 BYTE) NOT NULL,
    id_categoria   INTEGER NOT NULL,
    id_area        INTEGER NOT NULL,
    id_idioma      INTEGER NOT NULL,
    id_documento   INTEGER NOT NULL
);

ALTER TABLE documento_detalle ADD CONSTRAINT documento_detalle_pk PRIMARY KEY ( id_idioma,id_documento );

CREATE TABLE documento_idioma (
    id_idioma   INTEGER NOT NULL,
    ca_idioma   VARCHAR2(45 BYTE) NOT NULL
);

ALTER TABLE documento_idioma ADD CONSTRAINT documento_idioma_pk PRIMARY KEY ( id_idioma );

CREATE TABLE documento_usuario (
    id_documento   INTEGER NOT NULL,
    fe_creacion    DATE NOT NULL,
    id_personal    INTEGER NOT NULL
);

ALTER TABLE documento_usuario ADD CONSTRAINT documento_usuario_pk PRIMARY KEY ( id_documento );

CREATE TABLE perfil (
    id_perfil   INTEGER NOT NULL,
    ca_perfil   VARCHAR2(40 BYTE) NOT NULL
);

ALTER TABLE perfil ADD CONSTRAINT perfil_pk PRIMARY KEY ( id_perfil );

CREATE TABLE perfil_permiso (
    id_perfil    INTEGER NOT NULL,
    id_permiso   INTEGER NOT NULL
);

ALTER TABLE perfil_permiso ADD CONSTRAINT perfil_permiso_pk PRIMARY KEY ( id_perfil,id_permiso );

CREATE TABLE permiso (
    id_permiso   INTEGER NOT NULL,
    ca_permiso   VARCHAR2(50 BYTE) NOT NULL
);

ALTER TABLE permiso ADD CONSTRAINT permiso_pk PRIMARY KEY ( id_permiso );

CREATE TABLE personal_avance (
    fe_avance     DATE NOT NULL,
    ca_avance     VARCHAR2(4000 BYTE) NOT NULL,
    id_personal   INTEGER NOT NULL
);

CREATE TABLE personal_proyecto (
    id_personal      INTEGER NOT NULL,
    ca_descripcion   VARCHAR2(4000 BYTE) NOT NULL,
    id_usuario       INTEGER NOT NULL,
    id_rol           INTEGER NOT NULL,
    id_proyecto      INTEGER NOT NULL
);

ALTER TABLE personal_proyecto ADD CONSTRAINT personal_proyecto_pk PRIMARY KEY ( id_personal );

CREATE TABLE producto (
    id_producto     INTEGER NOT NULL,
    ca_producto     VARCHAR2(500 BYTE) NOT NULL,
    nu_costo_base   NUMBER(10,2) NOT NULL,
    ca_estado       VARCHAR2(20 BYTE) NOT NULL
);

ALTER TABLE producto ADD CONSTRAINT producto_pk PRIMARY KEY ( id_producto );

CREATE TABLE proyecto (
    id_proyecto           INTEGER NOT NULL,
    ca_proyecto           VARCHAR2(1000 BYTE) NOT NULL,
    fe_inicio             DATE NOT NULL,
    fe_estimada_entrega   DATE NOT NULL,
    ca_estado             VARCHAR2(20 BYTE) NOT NULL,
    id_producto           INTEGER NOT NULL,
    id_cliente            INTEGER NOT NULL
);

ALTER TABLE proyecto ADD CONSTRAINT proyecto_pk PRIMARY KEY ( id_proyecto );

CREATE TABLE proyecto_presupuesto (
    ca_rentabilidad     VARCHAR2(1000 BYTE) NOT NULL,
    ca_retroactividad   VARCHAR2(1000 BYTE) NOT NULL,
    ca_viabilidad       VARCHAR2(1000 BYTE) NOT NULL,
    fe_elaboracion      DATE,
    id_proyecto         INTEGER NOT NULL
);

CREATE TABLE proyecto_tercero (
    ca_descripccion   VARCHAR2(4000 BYTE) NOT NULL,
    id_proyecto       INTEGER NOT NULL,
    id_tercero        INTEGER NOT NULL,
    id_tipo           INTEGER NOT NULL
);

ALTER TABLE proyecto_tercero ADD CONSTRAINT proyecto_tercero_pk PRIMARY KEY ( id_proyecto,id_tercero,id_tipo );

CREATE TABLE proyecto_transaccion (
    fe_transaccion    DATE NOT NULL,
    nu_monto          NUMBER(10,2) NOT NULL,
    ca_descripccion   VARCHAR2(4000 BYTE) NOT NULL,
    id_proyecto       INTEGER NOT NULL
);

CREATE TABLE rol (
    id_rol      INTEGER NOT NULL,
    ca_rol      VARCHAR2(100 BYTE) NOT NULL,
    ca_estado   VARCHAR2(20 BYTE) NOT NULL
);

ALTER TABLE rol ADD CONSTRAINT rol_pk PRIMARY KEY ( id_rol );

CREATE TABLE tercero (
    id_tercero     INTEGER NOT NULL,
    ca_tercero     VARCHAR2(100 BYTE) NOT NULL,
    ca_direccion   VARCHAR2(200 BYTE) NOT NULL,
    ca_estado      VARCHAR2(20 BYTE) NOT NULL
);

ALTER TABLE tercero ADD CONSTRAINT tercero_pk PRIMARY KEY ( id_tercero );

CREATE TABLE tercero_contacto (
    ca_contacto   VARCHAR2(100 BYTE) NOT NULL,
    ca_cargo      VARCHAR2(50 BYTE) NOT NULL,
    ca_telefono   VARCHAR2(30 BYTE) NOT NULL,
    ca_email      VARCHAR2(100 BYTE) NOT NULL,
    id_tercero    INTEGER NOT NULL
);

CREATE TABLE tercero_tipo (
    id_tipo          INTEGER NOT NULL,
    ca_tipo          VARCHAR2(50 BYTE) NOT NULL,
    ca_descripcion   VARCHAR2(4000 BYTE)
);

ALTER TABLE tercero_tipo ADD CONSTRAINT tercero_tipo_pk PRIMARY KEY ( id_tipo );

CREATE TABLE tercero_transaccion (
    fe_transaccion    DATE NOT NULL,
    nu_monto          NUMBER(10,2) NOT NULL,
    ca_descripccion   VARCHAR2(4000 BYTE) NOT NULL,
    id_tercero        INTEGER NOT NULL
);

CREATE TABLE traza (
    id_traza       INTEGER NOT NULL,
    fe_accion      DATE NOT NULL,
    ca_accion      VARCHAR2(100 BYTE) NOT NULL,
    id_registro    INTEGER NOT NULL,
    ca_estado      VARCHAR2(45 BYTE) NOT NULL,
    ca_anterior    VARCHAR2(45 BYTE) NOT NULL,
    ca_posterior   VARCHAR2(45 BYTE) NOT NULL,
    id_usuario     INTEGER NOT NULL
);

ALTER TABLE traza ADD CONSTRAINT traza_pk PRIMARY KEY ( id_traza );

CREATE TABLE usuario (
    id_usuario      INTEGER NOT NULL,
    ca_nombre       VARCHAR2(100 BYTE) NOT NULL,
    ca_apellido     VARCHAR2(100 BYTE) NOT NULL,
    fe_nacimiento   DATE NOT NULL,
    ca_email        VARCHAR2(200 BYTE) NOT NULL,
    ca_direccion    VARCHAR2(200 BYTE),
    ca_estado       VARCHAR2(20 BYTE) NOT NULL,
    ca_nickname     VARCHAR2(50 BYTE) NOT NULL,
    ca_clave        BLOB NOT NULL
);

ALTER TABLE usuario ADD CONSTRAINT usuario_pk PRIMARY KEY ( id_usuario );

CREATE TABLE usuario_perfil (
    id_usuario   INTEGER NOT NULL,
    id_perfil    INTEGER NOT NULL
);

ALTER TABLE usuario_perfil ADD CONSTRAINT usuario_perfil_pk PRIMARY KEY ( id_usuario,id_perfil );

ALTER TABLE activo_stock ADD CONSTRAINT activo_tipo_fk FOREIGN KEY ( id_tipo_activo )
    REFERENCES activo_tipo ( id_tipo_activo );

ALTER TABLE activo ADD CONSTRAINT activo_tipo_fkv2 FOREIGN KEY ( id_tipo_activo )
    REFERENCES activo_tipo ( id_tipo_activo );

ALTER TABLE activo_valor ADD CONSTRAINT activo_valor_tercero_fk FOREIGN KEY ( id_tercero )
    REFERENCES tercero ( id_tercero );

ALTER TABLE documento_auditoria ADD CONSTRAINT auditoria_usuario_fk FOREIGN KEY ( id_usuario )
    REFERENCES usuario ( id_usuario );

ALTER TABLE activo_baja ADD CONSTRAINT baja_activo_fk FOREIGN KEY ( id_activo )
    REFERENCES activo ( id_activo );

ALTER TABLE cliente_contacto ADD CONSTRAINT contacto_cliente_fk FOREIGN KEY ( id_cliente )
    REFERENCES cliente ( id_cliente );

ALTER TABLE tercero_contacto ADD CONSTRAINT contacto_tercero_fk FOREIGN KEY ( id_tercero )
    REFERENCES tercero ( id_tercero );

ALTER TABLE documento_detalle ADD CONSTRAINT documento_area_fk FOREIGN KEY ( id_area )
    REFERENCES documento_area ( id_area );

ALTER TABLE documento_detalle ADD CONSTRAINT documento_categoria_fk FOREIGN KEY ( id_categoria )
    REFERENCES documento_categoria ( id_categoria );

ALTER TABLE documento_detalle ADD CONSTRAINT documento_idioma_fk FOREIGN KEY ( id_idioma )
    REFERENCES documento_idioma ( id_idioma );

ALTER TABLE documento_detalle ADD CONSTRAINT documento_usuario_fk FOREIGN KEY ( id_documento )
    REFERENCES documento_usuario ( id_documento );

ALTER TABLE documento_auditoria ADD CONSTRAINT documento_usuario_fkv2 FOREIGN KEY ( id_documento )
    REFERENCES documento_usuario ( id_documento );

ALTER TABLE activo_mantenimiento ADD CONSTRAINT mantenimiento_activo_fk FOREIGN KEY ( id_activo )
    REFERENCES activo ( id_activo );

ALTER TABLE activo_mantenimiento ADD CONSTRAINT mantenimiento_tercero_fk FOREIGN KEY ( id_tercero )
    REFERENCES tercero ( id_tercero );

ALTER TABLE perfil_permiso ADD CONSTRAINT perfil_permiso_fk FOREIGN KEY ( id_permiso )
    REFERENCES permiso ( id_permiso );

ALTER TABLE perfil_permiso ADD CONSTRAINT perfil_permiso_fkv2 FOREIGN KEY ( id_perfil )
    REFERENCES perfil ( id_perfil );

ALTER TABLE personal_avance ADD CONSTRAINT personal_avance_fk FOREIGN KEY ( id_personal )
    REFERENCES personal_proyecto ( id_personal );

ALTER TABLE documento_usuario ADD CONSTRAINT personal_proyecto_fk FOREIGN KEY ( id_personal )
    REFERENCES personal_proyecto ( id_personal );

ALTER TABLE activo_usuario ADD CONSTRAINT personal_proyecto_fkv2 FOREIGN KEY ( id_personal )
    REFERENCES personal_proyecto ( id_personal );

ALTER TABLE personal_proyecto ADD CONSTRAINT personal_proyecto_fkv3 FOREIGN KEY ( id_proyecto )
    REFERENCES proyecto ( id_proyecto );

ALTER TABLE personal_proyecto ADD CONSTRAINT personal_proyecto_fkv4 FOREIGN KEY ( id_usuario )
    REFERENCES usuario ( id_usuario );

ALTER TABLE proyecto_presupuesto ADD CONSTRAINT presupuesto_proyecto_fk FOREIGN KEY ( id_proyecto )
    REFERENCES proyecto ( id_proyecto );

ALTER TABLE proyecto ADD CONSTRAINT proyecto_cliente_fk FOREIGN KEY ( id_cliente )
    REFERENCES cliente ( id_cliente );

ALTER TABLE proyecto ADD CONSTRAINT proyecto_producto_fk FOREIGN KEY ( id_producto )
    REFERENCES producto ( id_producto );

ALTER TABLE personal_proyecto ADD CONSTRAINT proyecto_rol_fk FOREIGN KEY ( id_rol )
    REFERENCES rol ( id_rol );

ALTER TABLE proyecto_tercero ADD CONSTRAINT proyecto_tercerofk FOREIGN KEY ( id_tercero )
    REFERENCES tercero ( id_tercero );

ALTER TABLE cliente_seguimiento ADD CONSTRAINT seguimiento_cliente_fk FOREIGN KEY ( id_cliente )
    REFERENCES cliente ( id_cliente );

ALTER TABLE proyecto_tercero ADD CONSTRAINT tercero_proyecto_fk FOREIGN KEY ( id_proyecto )
    REFERENCES proyecto ( id_proyecto );

ALTER TABLE proyecto_tercero ADD CONSTRAINT tercero_tipo_fk FOREIGN KEY ( id_tipo )
    REFERENCES tercero_tipo ( id_tipo );

ALTER TABLE cliente_transaccion ADD CONSTRAINT transaccion_cliente_fk FOREIGN KEY ( id_cliente )
    REFERENCES cliente ( id_cliente );

ALTER TABLE proyecto_transaccion ADD CONSTRAINT transaccion_proyecto_fk FOREIGN KEY ( id_proyecto )
    REFERENCES proyecto ( id_proyecto );

ALTER TABLE tercero_transaccion ADD CONSTRAINT transaccion_tercero_fk FOREIGN KEY ( id_tercero )
    REFERENCES tercero ( id_tercero );

ALTER TABLE traza ADD CONSTRAINT traza_usuario_fk FOREIGN KEY ( id_usuario )
    REFERENCES usuario ( id_usuario );

ALTER TABLE activo_usuario ADD CONSTRAINT usuario_activo_fk FOREIGN KEY ( id_activo )
    REFERENCES activo ( id_activo );

ALTER TABLE usuario_perfil ADD CONSTRAINT usuario_perfil_fk FOREIGN KEY ( id_perfil )
    REFERENCES perfil ( id_perfil );

ALTER TABLE usuario_perfil ADD CONSTRAINT usuario_perfil_fkv2 FOREIGN KEY ( id_usuario )
    REFERENCES usuario ( id_usuario );

ALTER TABLE activo_valor ADD CONSTRAINT valor_activo_fk FOREIGN KEY ( id_activo )
    REFERENCES activo ( id_activo );



-- Informe de Resumen de Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                            35
-- CREATE INDEX                             0
-- ALTER TABLE                             60
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
