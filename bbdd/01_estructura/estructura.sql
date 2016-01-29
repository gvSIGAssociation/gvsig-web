-- *****************************************************************************
--  gvGeoportal is sponsored by the General Directorate for Information
--  Technologies (DGTI) of the Regional Ministry of Finance and Public
--  Administration of the Generalitat Valenciana (Valencian Community,
--  Spain), managed by gvSIG Association and led by DISID Corporation.
--
--  Copyright (C) 2016 DGTI - Generalitat Valenciana
--
--  This program is free software: you can redistribute it and/or modify
--  it under the terms of the GNU Affero General Public License as
--  published by the Free Software Foundation, either version 3 of the
--  License, or (at your option) any later version.
--
--  This program is distributed in the hope that it will be useful,
--  but WITHOUT ANY WARRANTY; without even the implied warranty of
--  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
--  GNU Affero General Public License for more details.
--
--  You should have received a copy of the GNU Affero General Public License
--  along with this program.  If not, see <http://www.gnu.org/licenses/>.
-- *****************************************************************************

-- Create Database Lock Table
CREATE TABLE owgvgeoportal.databasechangeloglock (ID INT NOT NULL, LOCKED BOOLEAN NOT NULL, LOCKGRANTED TIMESTAMP WITHOUT TIME ZONE, LOCKEDBY VARCHAR(255), CONSTRAINT PK_DATABASECHANGELOGLOCK PRIMARY KEY (ID));

-- Initialize Database Lock Table
DELETE FROM owgvgeoportal.databasechangeloglock;

INSERT INTO owgvgeoportal.databasechangeloglock (ID, LOCKED) VALUES (1, FALSE);

-- Lock Database
UPDATE owgvgeoportal.databasechangeloglock SET LOCKED = TRUE, LOCKEDBY = '172.31.18.150 (172.31.18.150)', LOCKGRANTED = '2016-01-27 09:05:12.292' WHERE ID = 1 AND LOCKED = FALSE;

-- Create Database Change Log Table
CREATE TABLE owgvgeoportal.databasechangelog (ID VARCHAR(255) NOT NULL, AUTHOR VARCHAR(255) NOT NULL, FILENAME VARCHAR(255) NOT NULL, DATEEXECUTED TIMESTAMP WITHOUT TIME ZONE NOT NULL, ORDEREXECUTED INT NOT NULL, EXECTYPE VARCHAR(10) NOT NULL, MD5SUM VARCHAR(35), DESCRIPTION VARCHAR(255), COMMENTS VARCHAR(255), TAG VARCHAR(255), LIQUIBASE VARCHAR(20), CONTEXTS VARCHAR(255), LABELS VARCHAR(255));

-- Changeset target/classes/db/db.changelog-v000-schema.xml::schema-seq-0::omorro
CREATE SEQUENCE "owgvgeoportal"."hibernate_sequence";

INSERT INTO owgvgeoportal.databasechangelog (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE) VALUES ('schema-seq-0', 'omorro', 'target/classes/db/db.changelog-v000-schema.xml', NOW(), 1, '7:afe897bea20bc08d1681087c94d0967d', 'createSequence', '', 'EXECUTED', NULL, NULL, '3.4.0');

-- Changeset target/classes/db/db.changelog-v000-schema.xml::schema-seq-1::omorro
CREATE SEQUENCE owgvgeoportal.agrupador_capa_id_seq START WITH 300;

INSERT INTO owgvgeoportal.databasechangelog (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE) VALUES ('schema-seq-1', 'omorro', 'target/classes/db/db.changelog-v000-schema.xml', NOW(), 2, '7:93c0922deb673a543e6562be17ebd6de', 'createSequence', '', 'EXECUTED', NULL, NULL, '3.4.0');

-- Changeset target/classes/db/db.changelog-v000-schema.xml::schema-seq-2::omorro
CREATE SEQUENCE owgvgeoportal.servicio_web_id_seq START WITH 300;

INSERT INTO owgvgeoportal.databasechangelog (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE) VALUES ('schema-seq-2', 'omorro', 'target/classes/db/db.changelog-v000-schema.xml', NOW(), 3, '7:163cc2a2ef5af8ea9dbce10ad81f80a3', 'createSequence', '', 'EXECUTED', NULL, NULL, '3.4.0');

-- Changeset target/classes/db/db.changelog-v000-schema.xml::schema-seq-3::omorro
CREATE SEQUENCE owgvgeoportal.sistema_coordenadas_id_seq START WITH 300;

INSERT INTO owgvgeoportal.databasechangelog (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE) VALUES ('schema-seq-3', 'omorro', 'target/classes/db/db.changelog-v000-schema.xml', NOW(), 4, '7:063c5b9e446401327325a4ca717273a9', 'createSequence', '', 'EXECUTED', NULL, NULL, '3.4.0');

-- Changeset target/classes/db/db.changelog-v000-schema.xml::schema-seq-4::omorro
CREATE SEQUENCE owgvgeoportal.geoportal_id_seq START WITH 300;

INSERT INTO owgvgeoportal.databasechangelog (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE) VALUES ('schema-seq-4', 'omorro', 'target/classes/db/db.changelog-v000-schema.xml', NOW(), 5, '7:5e5584b4765216e47d0a4ccee25324ea', 'createSequence', '', 'EXECUTED', NULL, NULL, '3.4.0');

-- Changeset target/classes/db/db.changelog-v000-schema.xml::schema-seq-5::omorro
CREATE SEQUENCE owgvgeoportal.componentes_id_seq START WITH 300;

INSERT INTO owgvgeoportal.databasechangelog (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE) VALUES ('schema-seq-5', 'omorro', 'target/classes/db/db.changelog-v000-schema.xml', NOW(), 6, '7:c656485ef46345f87a0f26ed271fd617', 'createSequence', '', 'EXECUTED', NULL, NULL, '3.4.0');

-- Changeset target/classes/db/db.changelog-v000-schema.xml::schema-1::omorro
CREATE TABLE "owgvgeoportal"."geo_portal" ("id" BIGINT NOT NULL, "titulo" VARCHAR(255) NOT NULL, "url" VARCHAR(255) NOT NULL, "descripcion" VARCHAR(255), "subtitulo" VARCHAR(255), "logo" BYTEA, "alias" VARCHAR(255), "publicado" BOOLEAN NOT NULL, "centro" VARCHAR(255), "zoom" INT, "fecha_alta" TIMESTAMP WITHOUT TIME ZONE, "fecha_baja" TIMESTAMP WITHOUT TIME ZONE, "coordenadas" BIGINT, "version" INT, "audit_created_by" VARCHAR(255), "audit_creation" TIMESTAMP WITHOUT TIME ZONE, "audit_last_update" TIMESTAMP WITHOUT TIME ZONE, "audit_last_updated_by" VARCHAR(255), CONSTRAINT "geoPortal_pkey" PRIMARY KEY ("id"), CONSTRAINT "url_geoPortal_key" UNIQUE ("url"));

INSERT INTO owgvgeoportal.databasechangelog (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE) VALUES ('schema-1', 'omorro', 'target/classes/db/db.changelog-v000-schema.xml', NOW(), 7, '7:f6ef8428465076f6f0e1d88f0824b126', 'createTable', '', 'EXECUTED', NULL, NULL, '3.4.0');

-- Changeset target/classes/db/db.changelog-v000-schema.xml::schema-2::omorro
CREATE TABLE "owgvgeoportal"."componentes" ("id" BIGINT NOT NULL, "tipo" VARCHAR(255), "geo_portal" BIGINT, "version" INT, "audit_created_by" VARCHAR(255), "audit_creation" TIMESTAMP WITHOUT TIME ZONE, "audit_last_update" TIMESTAMP WITHOUT TIME ZONE, "audit_last_updated_by" VARCHAR(255), CONSTRAINT "componentes_pkey" PRIMARY KEY ("id"));

INSERT INTO owgvgeoportal.databasechangelog (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE) VALUES ('schema-2', 'omorro', 'target/classes/db/db.changelog-v000-schema.xml', NOW(), 8, '7:e688e5a33e44f2a370632e42891af7c3', 'createTable', '', 'EXECUTED', NULL, NULL, '3.4.0');

-- Changeset target/classes/db/db.changelog-v000-schema.xml::schema-3::omorro
CREATE TABLE "owgvgeoportal"."sistema_coordenadas" ("id" BIGINT NOT NULL, "codigo" VARCHAR(255) NOT NULL, "nombre" VARCHAR(255) NOT NULL, "descripcion" VARCHAR(255), "version" INT, "audit_created_by" VARCHAR(255), "audit_creation" TIMESTAMP WITHOUT TIME ZONE, "audit_last_update" TIMESTAMP WITHOUT TIME ZONE, "audit_last_updated_by" VARCHAR(255), CONSTRAINT "sistema_coordenadas_pkey" PRIMARY KEY ("id"));

INSERT INTO owgvgeoportal.databasechangelog (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE) VALUES ('schema-3', 'omorro', 'target/classes/db/db.changelog-v000-schema.xml', NOW(), 9, '7:3de43a9e18467ee06eb6132b4c277cb9', 'createTable', '', 'EXECUTED', NULL, NULL, '3.4.0');

-- Changeset target/classes/db/db.changelog-v000-schema.xml::schema-4::omorro
CREATE TABLE "owgvgeoportal"."agrupador_capa" ("id" BIGINT NOT NULL, "nombre" VARCHAR(255) NOT NULL, "descripcion" VARCHAR(255) NOT NULL, "version" INT, "audit_created_by" VARCHAR(255), "audit_creation" TIMESTAMP WITHOUT TIME ZONE, "audit_last_update" TIMESTAMP WITHOUT TIME ZONE, "audit_last_updated_by" VARCHAR(255), CONSTRAINT "agrupador_capa_pkey" PRIMARY KEY ("id"));

INSERT INTO owgvgeoportal.databasechangelog (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE) VALUES ('schema-4', 'omorro', 'target/classes/db/db.changelog-v000-schema.xml', NOW(), 10, '7:001adc456e1842d8474ee35782bfb483', 'createTable', '', 'EXECUTED', NULL, NULL, '3.4.0');

-- Changeset target/classes/db/db.changelog-v000-schema.xml::schema-5::omorro
CREATE TABLE "owgvgeoportal"."servicio_web" ("id" BIGINT NOT NULL, "nombre" VARCHAR(255) NOT NULL, "descripcion" VARCHAR(255) NOT NULL, "url" VARCHAR(255) NOT NULL, "tipo" VARCHAR(255) NOT NULL, "version_protocolo" VARCHAR(255), "formato_imagen" VARCHAR(255), "tile_matrix_set" VARCHAR(255), "version" INT, "audit_created_by" VARCHAR(255), "audit_creation" TIMESTAMP WITHOUT TIME ZONE, "audit_last_update" TIMESTAMP WITHOUT TIME ZONE, "audit_last_updated_by" VARCHAR(255), CONSTRAINT "servicio_web_pkey" PRIMARY KEY ("id"));

INSERT INTO owgvgeoportal.databasechangelog (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE) VALUES ('schema-5', 'omorro', 'target/classes/db/db.changelog-v000-schema.xml', NOW(), 11, '7:e9ea39ddadb2395417abc90dedb4bc92', 'createTable', '', 'EXECUTED', NULL, NULL, '3.4.0');

-- Changeset target/classes/db/db.changelog-v000-schema.xml::schema-6::omorro
CREATE TABLE "owgvgeoportal"."capas_servicio_web" ("id_capa_servicio_web" BIGINT NOT NULL, "estilo_capa" VARCHAR(255), "nombre_capa" VARCHAR(255) NOT NULL, "titulo_capa" VARCHAR(255));

INSERT INTO owgvgeoportal.databasechangelog (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE) VALUES ('schema-6', 'omorro', 'target/classes/db/db.changelog-v000-schema.xml', NOW(), 12, '7:cbe6c7c579657957be1271a54a2ec7ba', 'createTable', '', 'EXECUTED', NULL, NULL, '3.4.0');

-- Changeset target/classes/db/db.changelog-v000-schema.xml::schema-7::omorro
CREATE TABLE "owgvgeoportal"."coordenadas_servicio_web" ("servicios_web" BIGINT NOT NULL, "coordenadas" BIGINT NOT NULL);

INSERT INTO owgvgeoportal.databasechangelog (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE) VALUES ('schema-7', 'omorro', 'target/classes/db/db.changelog-v000-schema.xml', NOW(), 13, '7:1f576a5e2961fcec5b62bdb595e73498', 'createTable', '', 'EXECUTED', NULL, NULL, '3.4.0');

-- Changeset target/classes/db/db.changelog-v000-schema.xml::schema-7-pk::omorro
ALTER TABLE owgvgeoportal.coordenadas_servicio_web ADD CONSTRAINT coordenadas_servicio_web_pkey PRIMARY KEY (servicios_web, coordenadas);

INSERT INTO owgvgeoportal.databasechangelog (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE) VALUES ('schema-7-pk', 'omorro', 'target/classes/db/db.changelog-v000-schema.xml', NOW(), 14, '7:3f60bf4e2d1bd9d8bb11045021810cc0', 'addPrimaryKey', '', 'EXECUTED', NULL, NULL, '3.4.0');

-- Changeset target/classes/db/db.changelog-v000-schema.xml::schema-8::omorro
CREATE TABLE "owgvgeoportal"."agrupador_capa_geo_portales" ("geo_portal" BIGINT NOT NULL, "agrupador_capa" BIGINT NOT NULL);

INSERT INTO owgvgeoportal.databasechangelog (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE) VALUES ('schema-8', 'omorro', 'target/classes/db/db.changelog-v000-schema.xml', NOW(), 15, '7:9a41c35845e1b6de5eaf1aae8a79a6d0', 'createTable', '', 'EXECUTED', NULL, NULL, '3.4.0');

-- Changeset target/classes/db/db.changelog-v000-schema.xml::schema-8-pk::omorro
ALTER TABLE owgvgeoportal.agrupador_capa_geo_portales ADD CONSTRAINT agrupador_capa_geo_portales_pkey PRIMARY KEY (geo_portal, agrupador_capa);

INSERT INTO owgvgeoportal.databasechangelog (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE) VALUES ('schema-8-pk', 'omorro', 'target/classes/db/db.changelog-v000-schema.xml', NOW(), 16, '7:cd9dc57a91e70009fb797df4eedac901', 'addPrimaryKey', '', 'EXECUTED', NULL, NULL, '3.4.0');

-- Changeset target/classes/db/db.changelog-v000-schema.xml::schema-9::lalonso
CREATE TABLE "owgvgeoportal"."gestor_catalogo" ("id" BIGSERIAL NOT NULL, "nombre" VARCHAR(255) NOT NULL, "url" VARCHAR(255) NOT NULL, "version" INT, "audit_created_by" VARCHAR(255), "audit_creation" TIMESTAMP WITHOUT TIME ZONE, "audit_last_update" TIMESTAMP WITHOUT TIME ZONE, "audit_last_updated_by" VARCHAR(255), CONSTRAINT "gestor_catalogo_pkey" PRIMARY KEY ("id"));

INSERT INTO owgvgeoportal.databasechangelog (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE) VALUES ('schema-9', 'lalonso', 'target/classes/db/db.changelog-v000-schema.xml', NOW(), 17, '7:5111c5a921e25b2a691d3410b5e809d4', 'createTable', '', 'EXECUTED', NULL, NULL, '3.4.0');

-- Changeset target/classes/db/db.changelog-v000-schema.xml::schema-10::omorro
CREATE TABLE "owgvgeoportal"."conf_ayuda_buscador" ("id" BIGSERIAL NOT NULL, "texto_ayuda" VARCHAR(2000), "version" INT, "audit_created_by" VARCHAR(255), "audit_creation" TIMESTAMP WITHOUT TIME ZONE, "audit_last_update" TIMESTAMP WITHOUT TIME ZONE, "audit_last_updated_by" VARCHAR(255), CONSTRAINT "conf_ayuda_buscador_pkey" PRIMARY KEY ("id"));

INSERT INTO owgvgeoportal.databasechangelog (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE) VALUES ('schema-10', 'omorro', 'target/classes/db/db.changelog-v000-schema.xml', NOW(), 18, '7:57395d6e44237a4bd56ded9da6dbb04b', 'createTable', '', 'EXECUTED', NULL, NULL, '3.4.0');

-- Changeset target/classes/db/db.changelog-v000-schema.xml::schema-11::lalonso
CREATE TABLE "owgvgeoportal"."agrupador_capa_servicio_web" ("id" BIGSERIAL NOT NULL, "agrupador" BIGINT NOT NULL, "servicio_web" BIGINT NOT NULL, "version" INT, "audit_created_by" VARCHAR(255), "audit_creation" TIMESTAMP WITHOUT TIME ZONE, "audit_last_update" TIMESTAMP WITHOUT TIME ZONE, "audit_last_updated_by" VARCHAR(255), CONSTRAINT "agrup_serv_pkey" PRIMARY KEY ("id"));

INSERT INTO owgvgeoportal.databasechangelog (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE) VALUES ('schema-11', 'lalonso', 'target/classes/db/db.changelog-v000-schema.xml', NOW(), 19, '7:6ba6b9de7f8271c0abd855f2f6274c71', 'createTable', '', 'EXECUTED', NULL, NULL, '3.4.0');

-- Changeset target/classes/db/db.changelog-v000-schema.xml::schema-12::omorro
CREATE TABLE "owgvgeoportal"."conf_capas_tematicas" ("id" BIGSERIAL NOT NULL, "grupo" BIGINT, "nombre" VARCHAR(2000), "version" INT, "audit_created_by" VARCHAR(255), "audit_creation" TIMESTAMP WITHOUT TIME ZONE, "audit_last_update" TIMESTAMP WITHOUT TIME ZONE, "audit_last_updated_by" VARCHAR(255), CONSTRAINT "conf_capas_tematicas_pkey" PRIMARY KEY ("id"));

INSERT INTO owgvgeoportal.databasechangelog (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE) VALUES ('schema-12', 'omorro', 'target/classes/db/db.changelog-v000-schema.xml', NOW(), 20, '7:a1c61009148b8f3f84e959609ae18b32', 'createTable', '', 'EXECUTED', NULL, NULL, '3.4.0');

-- Changeset target/classes/db/db.changelog-v000-schema.xml::schema-13::omorro
CREATE TABLE "owgvgeoportal"."conf_vistas_predefinidas" ("id" BIGSERIAL NOT NULL, "grupo" BIGINT, "nombre" VARCHAR(2000), "version" INT, "audit_created_by" VARCHAR(255), "audit_creation" TIMESTAMP WITHOUT TIME ZONE, "audit_last_update" TIMESTAMP WITHOUT TIME ZONE, "audit_last_updated_by" VARCHAR(255), CONSTRAINT "conf_vistas_predefinidas_pkey" PRIMARY KEY ("id"));

INSERT INTO owgvgeoportal.databasechangelog (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE) VALUES ('schema-13', 'omorro', 'target/classes/db/db.changelog-v000-schema.xml', NOW(), 21, '7:c9088b28a75aca168bb854e1508f038e', 'createTable', '', 'EXECUTED', NULL, NULL, '3.4.0');

-- Changeset target/classes/db/db.changelog-v000-schema.xml::schema-14::omorro
CREATE TABLE "owgvgeoportal"."conf_mini_mapa" ("id" BIGSERIAL NOT NULL, "servicio_web" BIGINT, "version" INT, "audit_created_by" VARCHAR(255), "audit_creation" TIMESTAMP WITHOUT TIME ZONE, "audit_last_update" TIMESTAMP WITHOUT TIME ZONE, "audit_last_updated_by" VARCHAR(255), CONSTRAINT "conf_mini_mapa_pkey" PRIMARY KEY ("id"));

INSERT INTO owgvgeoportal.databasechangelog (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE) VALUES ('schema-14', 'omorro', 'target/classes/db/db.changelog-v000-schema.xml', NOW(), 22, '7:c5e69fb684b1bf8f404f5bb9d10868d4', 'createTable', '', 'EXECUTED', NULL, NULL, '3.4.0');

-- Changeset target/classes/db/db.changelog-v000-schema.xml::schema-15::lalonso
CREATE TABLE "owgvgeoportal"."geoportal_servicio_web" ("id" BIGSERIAL NOT NULL, "geoportal" BIGINT NOT NULL, "servicio_web" BIGINT NOT NULL, "opacidad" numeric NOT NULL, "activo" BOOLEAN NOT NULL, "habilitado" BOOLEAN NOT NULL, "posicion" INT NOT NULL, "version" INT, "audit_created_by" VARCHAR(255), "audit_creation" TIMESTAMP WITHOUT TIME ZONE, "audit_last_update" TIMESTAMP WITHOUT TIME ZONE, "audit_last_updated_by" VARCHAR(255), CONSTRAINT "geo_serv_pkey" PRIMARY KEY ("id"));

INSERT INTO owgvgeoportal.databasechangelog (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE) VALUES ('schema-15', 'lalonso', 'target/classes/db/db.changelog-v000-schema.xml', NOW(), 23, '7:fc593a46310132fdf9fbb0887de4d622', 'createTable', '', 'EXECUTED', NULL, NULL, '3.4.0');

-- Changeset target/classes/db/db.changelog-v000-schema.xml::schema-fk-1::omorro
ALTER TABLE owgvgeoportal.geo_portal ADD CONSTRAINT "FK_geo_portal_sistema_coordenadas" FOREIGN KEY (coordenadas) REFERENCES owgvgeoportal.sistema_coordenadas (id) ON DELETE NO ACTION;

INSERT INTO owgvgeoportal.databasechangelog (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE) VALUES ('schema-fk-1', 'omorro', 'target/classes/db/db.changelog-v000-schema.xml', NOW(), 24, '7:fd58c2fdd1e9f538456613c6944e8045', 'addForeignKeyConstraint', '', 'EXECUTED', NULL, NULL, '3.4.0');

-- Changeset target/classes/db/db.changelog-v000-schema.xml::schema-fk-2::omorro
ALTER TABLE owgvgeoportal.coordenadas_servicio_web ADD CONSTRAINT "FK_coordenadas_servicio_web_servicio_web" FOREIGN KEY (servicios_web) REFERENCES owgvgeoportal.servicio_web (id) ON DELETE CASCADE;

INSERT INTO owgvgeoportal.databasechangelog (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE) VALUES ('schema-fk-2', 'omorro', 'target/classes/db/db.changelog-v000-schema.xml', NOW(), 25, '7:4d7cf4074e7198330be9c6d712bb85e4', 'addForeignKeyConstraint', '', 'EXECUTED', NULL, NULL, '3.4.0');

-- Changeset target/classes/db/db.changelog-v000-schema.xml::schema-fk-3::omorro
ALTER TABLE owgvgeoportal.coordenadas_servicio_web ADD CONSTRAINT "FK_coordenadas_servicio_web_sistema_coordenadas" FOREIGN KEY (coordenadas) REFERENCES owgvgeoportal.sistema_coordenadas (id) ON DELETE CASCADE;

INSERT INTO owgvgeoportal.databasechangelog (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE) VALUES ('schema-fk-3', 'omorro', 'target/classes/db/db.changelog-v000-schema.xml', NOW(), 26, '7:85f66d850d727374912764879fd77dcb', 'addForeignKeyConstraint', '', 'EXECUTED', NULL, NULL, '3.4.0');

-- Changeset target/classes/db/db.changelog-v000-schema.xml::schema-fk-4::omorro
ALTER TABLE owgvgeoportal.agrupador_capa_geo_portales ADD CONSTRAINT "FK_agrupador_capa_geo_portales_agrupador_capa" FOREIGN KEY (agrupador_capa) REFERENCES owgvgeoportal.agrupador_capa (id) ON DELETE CASCADE;

INSERT INTO owgvgeoportal.databasechangelog (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE) VALUES ('schema-fk-4', 'omorro', 'target/classes/db/db.changelog-v000-schema.xml', NOW(), 27, '7:d55e2932dd8f0c133a6b9740377df906', 'addForeignKeyConstraint', '', 'EXECUTED', NULL, NULL, '3.4.0');

-- Changeset target/classes/db/db.changelog-v000-schema.xml::schema-fk-5::omorro
ALTER TABLE owgvgeoportal.agrupador_capa_geo_portales ADD CONSTRAINT "FK_agrupador_capa_geo_portales_geo_portal" FOREIGN KEY (geo_portal) REFERENCES owgvgeoportal.geo_portal (id) ON DELETE CASCADE;

INSERT INTO owgvgeoportal.databasechangelog (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE) VALUES ('schema-fk-5', 'omorro', 'target/classes/db/db.changelog-v000-schema.xml', NOW(), 28, '7:821d19957872b1a1d78d3155285a240a', 'addForeignKeyConstraint', '', 'EXECUTED', NULL, NULL, '3.4.0');

-- Changeset target/classes/db/db.changelog-v000-schema.xml::schema-fk-6::omorro
ALTER TABLE owgvgeoportal.componentes ADD CONSTRAINT "FK_componentes_geoPortal" FOREIGN KEY (geo_portal) REFERENCES owgvgeoportal.geo_portal (id) ON DELETE CASCADE;

INSERT INTO owgvgeoportal.databasechangelog (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE) VALUES ('schema-fk-6', 'omorro', 'target/classes/db/db.changelog-v000-schema.xml', NOW(), 29, '7:ea5911bb8dd895a4fea9f184278bf519', 'addForeignKeyConstraint', '', 'EXECUTED', NULL, NULL, '3.4.0');

-- Changeset target/classes/db/db.changelog-v000-schema.xml::schema-fk-7::omorro
ALTER TABLE owgvgeoportal.conf_ayuda_buscador ADD CONSTRAINT "FK_conf_ayuda_buscador_componentes" FOREIGN KEY (id) REFERENCES owgvgeoportal.componentes (id);

INSERT INTO owgvgeoportal.databasechangelog (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE) VALUES ('schema-fk-7', 'omorro', 'target/classes/db/db.changelog-v000-schema.xml', NOW(), 30, '7:e0d79647dc74c6e62876a392a087493b', 'addForeignKeyConstraint', '', 'EXECUTED', NULL, NULL, '3.4.0');

-- Changeset target/classes/db/db.changelog-v000-schema.xml::schema-fk-8::lalonso
ALTER TABLE owgvgeoportal.agrupador_capa_servicio_web ADD CONSTRAINT "FK_agrupserv_agrupador" FOREIGN KEY (agrupador) REFERENCES owgvgeoportal.agrupador_capa (id) ON DELETE CASCADE;

INSERT INTO owgvgeoportal.databasechangelog (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE) VALUES ('schema-fk-8', 'lalonso', 'target/classes/db/db.changelog-v000-schema.xml', NOW(), 31, '7:fbf8f38db70be5d99eee43b027f1c66a', 'addForeignKeyConstraint', '', 'EXECUTED', NULL, NULL, '3.4.0');

-- Changeset target/classes/db/db.changelog-v000-schema.xml::schema-fk-9::lalonso
ALTER TABLE owgvgeoportal.agrupador_capa_servicio_web ADD CONSTRAINT "FK_agrupserv_servicio" FOREIGN KEY (servicio_web) REFERENCES owgvgeoportal.servicio_web (id) ON DELETE CASCADE;

INSERT INTO owgvgeoportal.databasechangelog (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE) VALUES ('schema-fk-9', 'lalonso', 'target/classes/db/db.changelog-v000-schema.xml', NOW(), 32, '7:88faa62c1645dddc1a6196370839060a', 'addForeignKeyConstraint', '', 'EXECUTED', NULL, NULL, '3.4.0');

-- Changeset target/classes/db/db.changelog-v000-schema.xml::schema-fk-10::omorro
ALTER TABLE owgvgeoportal.conf_capas_tematicas ADD CONSTRAINT "FK_conf_capas_tematicas_componentes" FOREIGN KEY (id) REFERENCES owgvgeoportal.componentes (id);

INSERT INTO owgvgeoportal.databasechangelog (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE) VALUES ('schema-fk-10', 'omorro', 'target/classes/db/db.changelog-v000-schema.xml', NOW(), 33, '7:b032565289a8de032a7d562b4e6a5f1b', 'addForeignKeyConstraint', '', 'EXECUTED', NULL, NULL, '3.4.0');

-- Changeset target/classes/db/db.changelog-v000-schema.xml::schema-fk-11::omorro
ALTER TABLE owgvgeoportal.conf_capas_tematicas ADD CONSTRAINT "FK_conf_capas_tematicas_agrupador_capa" FOREIGN KEY (grupo) REFERENCES owgvgeoportal.agrupador_capa (id) ON DELETE NO ACTION;

INSERT INTO owgvgeoportal.databasechangelog (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE) VALUES ('schema-fk-11', 'omorro', 'target/classes/db/db.changelog-v000-schema.xml', NOW(), 34, '7:040032ca054ce72009ab81580f89aa5a', 'addForeignKeyConstraint', '', 'EXECUTED', NULL, NULL, '3.4.0');

-- Changeset target/classes/db/db.changelog-v000-schema.xml::schema-fk-12::omorro
ALTER TABLE owgvgeoportal.conf_vistas_predefinidas ADD CONSTRAINT "FK_conf_vistas_predefinidas_componentes" FOREIGN KEY (id) REFERENCES owgvgeoportal.componentes (id);

INSERT INTO owgvgeoportal.databasechangelog (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE) VALUES ('schema-fk-12', 'omorro', 'target/classes/db/db.changelog-v000-schema.xml', NOW(), 35, '7:8a92c0b9d8ccaa0be5fb390119576759', 'addForeignKeyConstraint', '', 'EXECUTED', NULL, NULL, '3.4.0');

-- Changeset target/classes/db/db.changelog-v000-schema.xml::schema-fk-13::omorro
ALTER TABLE owgvgeoportal.conf_vistas_predefinidas ADD CONSTRAINT "FK_conf_vistas_predefinidas_agrupador_capa" FOREIGN KEY (grupo) REFERENCES owgvgeoportal.agrupador_capa (id) ON DELETE NO ACTION;

INSERT INTO owgvgeoportal.databasechangelog (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE) VALUES ('schema-fk-13', 'omorro', 'target/classes/db/db.changelog-v000-schema.xml', NOW(), 36, '7:6ed4bda43df083475220d298e9565e41', 'addForeignKeyConstraint', '', 'EXECUTED', NULL, NULL, '3.4.0');

-- Changeset target/classes/db/db.changelog-v000-schema.xml::schema-fk-14::omorro
ALTER TABLE owgvgeoportal.conf_mini_mapa ADD CONSTRAINT "FK_conf_mini_mapa_componentes" FOREIGN KEY (id) REFERENCES owgvgeoportal.componentes (id);

INSERT INTO owgvgeoportal.databasechangelog (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE) VALUES ('schema-fk-14', 'omorro', 'target/classes/db/db.changelog-v000-schema.xml', NOW(), 37, '7:96709bab3257532fc48ab2089693e376', 'addForeignKeyConstraint', '', 'EXECUTED', NULL, NULL, '3.4.0');

-- Changeset target/classes/db/db.changelog-v000-schema.xml::schema-fk-15::omorro
ALTER TABLE owgvgeoportal.conf_mini_mapa ADD CONSTRAINT "FK_conf_mini_mapa_servicio_web" FOREIGN KEY (servicio_web) REFERENCES owgvgeoportal.servicio_web (id) ON DELETE NO ACTION;

INSERT INTO owgvgeoportal.databasechangelog (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE) VALUES ('schema-fk-15', 'omorro', 'target/classes/db/db.changelog-v000-schema.xml', NOW(), 38, '7:c207df90b6b3e61f64b568ae8819b789', 'addForeignKeyConstraint', '', 'EXECUTED', NULL, NULL, '3.4.0');

-- Changeset target/classes/db/db.changelog-v000-schema.xml::schema-fk-16::lalonso
ALTER TABLE owgvgeoportal.geoportal_servicio_web ADD CONSTRAINT "FK_geoserv_geoportal" FOREIGN KEY (geoportal) REFERENCES owgvgeoportal.geo_portal (id) ON DELETE CASCADE;

INSERT INTO owgvgeoportal.databasechangelog (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE) VALUES ('schema-fk-16', 'lalonso', 'target/classes/db/db.changelog-v000-schema.xml', NOW(), 39, '7:55bd83731981b2360f41e11e10aeb92f', 'addForeignKeyConstraint', '', 'EXECUTED', NULL, NULL, '3.4.0');

-- Changeset target/classes/db/db.changelog-v000-schema.xml::schema-fk-17::lalonso
ALTER TABLE owgvgeoportal.geoportal_servicio_web ADD CONSTRAINT "FK_geoserv_servicio" FOREIGN KEY (servicio_web) REFERENCES owgvgeoportal.servicio_web (id) ON DELETE CASCADE;

INSERT INTO owgvgeoportal.databasechangelog (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE) VALUES ('schema-fk-17', 'lalonso', 'target/classes/db/db.changelog-v000-schema.xml', NOW(), 40, '7:0493353cfc968e12e13cd3b504dff1cd', 'addForeignKeyConstraint', '', 'EXECUTED', NULL, NULL, '3.4.0');

-- Release Database Lock
UPDATE owgvgeoportal.databasechangeloglock SET LOCKED = FALSE, LOCKEDBY = NULL, LOCKGRANTED = NULL WHERE ID = 1;

