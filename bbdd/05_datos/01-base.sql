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

-- Lock Database
UPDATE owgvgeoportal.databasechangeloglock SET LOCKED = TRUE, LOCKEDBY = '172.31.18.150 (172.31.18.150)', LOCKGRANTED = '2016-01-27 09:07:13.094' WHERE ID = 1 AND LOCKED = FALSE;

-- Changeset db.changelog-v000-seed.xml::seed-data-v000::omorro
INSERT INTO owgvgeoportal.sistema_coordenadas (id, codigo, nombre, descripcion, version) VALUES ('1', 'EPSG:3857', 'EPSG:3857', 'Proyección WGS84 / Pseudo-Mercator', '0'),('2', 'EPSG:4326', 'EPSG:4326', 'Coordenadas Geográficas WGS84', '0'),('3', 'EPSG:23029', 'EPSG:23029', 'Proyección UTM ED50 Huso 29 N', '0'),('4', 'EPSG:23030', 'EPSG:23030', 'Proyección UTM ED50 Huso 30 N', '0'),('5', 'EPSG:23031', 'EPSG:23031', 'Proyección UTM ED50 Huso 31 N', '0'),('6', 'EPSG:25830', 'EPSG:25830', 'Proyección UTM ETRS89 Huso 30 N', '0'),('7', 'EPSG:900913', 'EPSG:900913', 'Proyección Google Mercator', '0');

INSERT INTO owgvgeoportal.gestor_catalogo (id, nombre, url, version) VALUES ('1', 'ICV – Instituto Cartográfico Valenciano', 'http://catalogo.icv.gva.es/geonetwork/srv/spa/csw', '0'),('2', 'IGN – Instituto Geográfico Nacional', 'http://www.ign.es/csw-inspire/srv/spa/csw', '0');

INSERT INTO owgvgeoportal.databasechangelog (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE) VALUES ('seed-data-v000', 'omorro', 'db.changelog-v000-seed.xml', NOW(), 41, '7:e4e02a83dbe8bc95bef987f03accf8f8', 'loadData (x2)', '', 'EXECUTED', NULL, NULL, '3.4.0');

-- Changeset db.changelog-v000-seed.xml::seed-data-recreate-sequenceseed::omorro
DROP SEQUENCE owgvgeoportal.hibernate_sequence CASCADE;

CREATE SEQUENCE owgvgeoportal.hibernate_sequence START WITH 1600;

INSERT INTO owgvgeoportal.databasechangelog (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE) VALUES ('seed-data-recreate-sequenceseed', 'omorro', 'db.changelog-v000-seed.xml', NOW(), 42, '7:8391d7ca1d3f6a01eac0d939cb44d0e0', 'dropSequence, createSequence', '', 'EXECUTED', NULL, NULL, '3.4.0');

-- Changeset db.changelog-v000-seed.xml::v000-seed-data-tag::omorro
INSERT INTO owgvgeoportal.databasechangelog (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, TAG) VALUES ('v000-seed-data-tag', 'omorro', 'db.changelog-v000-seed.xml', NOW(), 43, '7:7d638c37474befa65d0c228c51046fdd', 'tagDatabase', '', 'EXECUTED', NULL, NULL, '3.4.0', 'v000-seed');

-- Release Database Lock
UPDATE owgvgeoportal.databasechangeloglock SET LOCKED = FALSE, LOCKEDBY = NULL, LOCKGRANTED = NULL WHERE ID = 1;
