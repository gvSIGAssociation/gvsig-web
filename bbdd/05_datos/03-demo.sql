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
UPDATE owgvgeoportal.databasechangeloglock SET LOCKED = TRUE, LOCKEDBY = '172.31.18.150 (172.31.18.150)', LOCKGRANTED = '2016-01-27 09:14:26.483' WHERE ID = 1 AND LOCKED = FALSE;

-- Changeset db.changelog-demo-data.xml::demo-agrupador-capa-v000::omorro
INSERT INTO owgvgeoportal.agrupador_capa (id, nombre, descripcion, version) VALUES ('30', 'IGN y OpenStreetMap ', 'Agrupación de capas de la IGN y OpenStreetMap.', '0'),('31', 'Servicios WMTS de ICV', 'Agrupación de capas de servicios WMTS de ICV', '0'),('32', 'Cartociudad y PNOA', 'Agrupación de capas de Cartociudad y PNOA', '0');

INSERT INTO owgvgeoportal.databasechangelog (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE) VALUES ('demo-agrupador-capa-v000', 'omorro', 'db.changelog-demo-data.xml', NOW(), 58, '7:51fb7ddfb8f16a4e92912d688c8986cb', 'loadData', '', 'EXECUTED', 'dev,DESA', NULL, '3.4.0');

-- Changeset db.changelog-demo-data.xml::demo-servicio-web-v000::omorro
INSERT INTO owgvgeoportal.servicio_web (id, nombre, descripcion, url, tipo, version_protocolo, formato_imagen, tile_matrix_set, version) VALUES ('200', 'OpenStreepMap', 'OpenStreetMap', 'http://{s}.tile.osm.org/{z}/{x}/{y}.png?bar', 'TILE', '', '', '', '0'),('201', 'Mapa base del IGN', 'WMTS Mapa Base del IGN', 'http://www.ign.es/wmts/ign-base', 'WMTS', '1.0.0', 'image/png', '', '0'),('202', 'Mapa de sombras - Servicio WMTS', 'Mapa de sombras - Servicio WMTS', 'http://terramapas.icv.gva.es/isohipsas/wmts', 'WMTS', '1.0.0', 'image/jpeg', '', '0'),('203', 'Topográfico Tilecached Service -Servicio WMTS', 'Topográfico Tilecached Service -Servicio WMTS', 'http://terramapas.icv.gva.es/topografico/wmts', 'WMTS', '1.0.0', 'image/png', '', '0'),('204', 'ORTOFOTO Actual Servicio WMTS', 'ORTOFOTO Actual Servicio WMTS', 'http://terramapas.icv.gva.es/ortoactualidad/wmts', 'WMTS', '1.0.0', 'image/jpeg', '', '0'),('205', 'PNOA', 'Ortofotos PNOA máxima actualidad', 'http://www.ign.es/wms-inspire/pnoa-ma', 'WMS', '1.3.0', 'image/png', '', '0'),('206', 'Cartociudad', 'Servicio de visualización de mapas de Cartociudad', 'http://www.cartociudad.es/wms/CARTOCIUDAD/CARTOCIUDAD', 'WMS', '1.3.0', 'image/png', '', '0'),('207', 'Caza y Pesca', 'Conselleria d''Infraestructures, Territori i Medi Ambient GVA - Servicio WMS de Caza y Pesca', 'http://cartoweb.cma.gva.es/arcgis/services/cazaypesca/MapServer/WMSServer', 'WMS', '1.3.0', 'image/png', '', '0');

INSERT INTO owgvgeoportal.databasechangelog (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE) VALUES ('demo-servicio-web-v000', 'omorro', 'db.changelog-demo-data.xml', NOW(), 59, '7:d6669175170e23e1ee5b29b40feb54a0', 'loadData', '', 'EXECUTED', 'dev,DESA', NULL, '3.4.0');

-- Changeset db.changelog-demo-data.xml::demo-geoPortal-v000::omorro
INSERT INTO owgvgeoportal.geo_portal (id, titulo, url, descripcion, subtitulo, coordenadas, logo, alias, publicado, centro, zoom, fecha_alta, fecha_baja, version) VALUES ('4', 'Geoportal Sanidad', 'geoSanidad', 'Geoportal de Sanidad.', '', '6', NULL, 'Sanidad', 'false', '39.28621800351745,-0.7096321550830622', '1', '20/10/15', '20/10/25', '0'),('2', 'GeoPortal AAMA', 'geoAama', 'Geoportal de Agricultura Alimentación y Medio Ambiente.', 'Agricultura Alimentación y Medio Ambiente', '6', NULL, 'AAMA', 'false', '39.28621800351745,-0.7096321550830622', '1', '20/10/15', '20/10/25', '0'),('3', 'GeoPortal ITMA', 'geoItma', 'Geoportal de Infraestructuras Territorio y Medio Ambiente.', 'Infraestructuras Territorio y Medio Ambiente', '6', NULL, 'ITMA', 'false', '39.332594664575986,-0.7519249997980231', '2', '20/10/15', '20/10/25', '0');

INSERT INTO owgvgeoportal.databasechangelog (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE) VALUES ('demo-geoPortal-v000', 'omorro', 'db.changelog-demo-data.xml', NOW(), 60, '7:9bf7136d78f6b29fd0d6447ca5d2dcc9', 'loadData', '', 'EXECUTED', 'dev,DESA', NULL, '3.4.0');

-- Changeset db.changelog-demo-data.xml::demo-capas_servicio_web-v000::omorro
INSERT INTO owgvgeoportal.capas_servicio_web (id_capa_servicio_web, nombre_capa, estilo_capa, titulo_capa) VALUES ('201', 'IGNBaseTodo', '', ''),('202', 'isohipsas', '', ''),('203', 'topografico', '', ''),('204', 'ortoactualidad', '', ''),('205', 'OI.MosaicElement', 'default', ''),('205', 'OI.OrthoimageCoverage', 'default', ''),('206', 'FondoUrbano', 'nucleos_poligonos', ''),('206', 'SeccionCensal', 'distrito_censal', ''),('206', 'Callejero', 'pais', ''),('206', 'CodigoPostal', 'codigo_postal', ''),('206', 'Vial', 'vial', ''),('206', 'Portal', 'portal_pk', ''),('206', 'Toponimo', 'toponimo', ''),('207', 'caype_reserva_anguila_pol', 'default', ''),('207', 'caype_pesca_calidad_rios_truch', 'default', ''),('207', 'caype_caza_arrui', 'default', ''),('207', 'caype_caza_danyos_conejo', 'afec_default', ''),('207', 'caype_invasoras_oncorhynchus', 'default', ''),('207', 'caype_reserva_anguila_lin', 'default', ''),('207', 'caype_caza_eecc_ext', 'default', ''),('207', 'caype_invasoras_micropterus', 'default', ''),('207', 'caype_caza_danyos_conejo_afec', 'default', ''),('207', 'caype_invasoras_procambarus', 'default', ''),('207', 'caype_pesca', 'default', ''),('207', 'caype_caza_eencc_ext', 'default', '');

INSERT INTO owgvgeoportal.databasechangelog (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE) VALUES ('demo-capas_servicio_web-v000', 'omorro', 'db.changelog-demo-data.xml', NOW(), 61, '7:0c90f171165b4b414fa0088fb89037b4', 'loadData', '', 'EXECUTED', 'dev,DESA', NULL, '3.4.0');

-- Changeset db.changelog-demo-data.xml::demo-coordenadas_servicio_web-v000::omorro
INSERT INTO owgvgeoportal.coordenadas_servicio_web (servicios_web, coordenadas) VALUES ('200', '1'),('200', '2'),('200', '3'),('200', '4'),('200', '5'),('200', '6'),('200', '7'),('201', '1'),('201', '2'),('201', '6'),('202', '1'),('202', '6'),('203', '1'),('203', '2'),('203', '6'),('204', '1'),('204', '6'),('205', '1'),('205', '6'),('205', '2'),('205', '5'),('205', '4'),('205', '3'),('206', '7'),('206', '2'),('206', '1'),('206', '4'),('206', '6'),('206', '3'),('206', '5'),('207', '4'),('207', '2'),('207', '6');

INSERT INTO owgvgeoportal.databasechangelog (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE) VALUES ('demo-coordenadas_servicio_web-v000', 'omorro', 'db.changelog-demo-data.xml', NOW(), 62, '7:029222c2db6a5e2e211c03af297def68', 'loadData', '', 'EXECUTED', 'dev,DESA', NULL, '3.4.0');

-- Changeset db.changelog-demo-data.xml::demo-agrupador_capa_geo_portales-v000::omorro
INSERT INTO owgvgeoportal.agrupador_capa_geo_portales (geo_portal, agrupador_capa) VALUES ('3', '30'),('3', '31'),('3', '32');

INSERT INTO owgvgeoportal.databasechangelog (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE) VALUES ('demo-agrupador_capa_geo_portales-v000', 'omorro', 'db.changelog-demo-data.xml', NOW(), 63, '7:316c36b6374d82e215d2819f93496636', 'loadData', '', 'EXECUTED', 'dev,DESA', NULL, '3.4.0');

-- Changeset db.changelog-demo-data.xml::demo-gestor_catalogo-v000::lalonso
INSERT INTO owgvgeoportal.gestor_catalogo (id, nombre, url, version) VALUES ('3', 'Ministerio de Agricultura, Alimentación y Medio Ambiente', 'http://www.magrama.gob.es/ide/metadatos/srv/spa/csw', '0');

INSERT INTO owgvgeoportal.databasechangelog (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE) VALUES ('demo-gestor_catalogo-v000', 'lalonso', 'db.changelog-demo-data.xml', NOW(), 64, '7:ab6c715a302c9938d935547b981ad442', 'loadData', '', 'EXECUTED', 'dev,DESA', NULL, '3.4.0');

-- Changeset db.changelog-demo-data.xml::demo-componentes-v000::lalonso
INSERT INTO owgvgeoportal.componentes (id, tipo, geo_portal, version) VALUES ('30', 'escala_grafica', '3', '0'),('31', 'leyenda', '3', '0'),('32', 'visualizar_coordenadas', '3', '0'),('33', 'callejero', '3', '0'),('34', 'desplazar', '3', '0'),('35', 'regla_zoom', '3', '0'),('36', 'zoom_ventana', '3', '0'),('37', 'historico_de_encuadres', '3', '0'),('38', 'informacion_capas', '3', '0'),('39', 'calcular_distancia', '3', '0'),('40', 'calcular_area', '3', '0'),('41', 'imprimir', '3', '0'),('42', 'anyadir_grupo_capas', '3', '0'),('43', 'ver_toc', '3', '0');

INSERT INTO owgvgeoportal.databasechangelog (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE) VALUES ('demo-componentes-v000', 'lalonso', 'db.changelog-demo-data.xml', NOW(), 65, '7:8582be9f99e9f945635071fd865579a2', 'loadData', '', 'EXECUTED', 'dev,DESA', NULL, '3.4.0');

-- Changeset db.changelog-demo-data.xml::demo-agrupador_capa_servicio_web-v000::lalonso
INSERT INTO owgvgeoportal.agrupador_capa_servicio_web (id, agrupador, servicio_web, version) VALUES ('150', '30', '200', '0'),('151', '30', '201', '0'),('152', '31', '202', '0'),('153', '31', '203', '0'),('154', '31', '204', '0'),('155', '32', '205', '0'),('156', '32', '206', '0');

INSERT INTO owgvgeoportal.databasechangelog (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE) VALUES ('demo-agrupador_capa_servicio_web-v000', 'lalonso', 'db.changelog-demo-data.xml', NOW(), 66, '7:effa06cfba676d28ace942e588229061', 'loadData', '', 'EXECUTED', 'dev,DESA', NULL, '3.4.0');

-- Changeset db.changelog-demo-data.xml::demo-geoportal_servicio_web-v000::lalonso
INSERT INTO owgvgeoportal.geoportal_servicio_web (id, geoportal, servicio_web, opacidad, activo, habilitado, posicion, version) VALUES ('6', '3', '206', '0.6', 'true', 'true', '1', '0'),('7', '3', '205', '1', 'true', 'true', '2', '0');

INSERT INTO owgvgeoportal.databasechangelog (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE) VALUES ('demo-geoportal_servicio_web-v000', 'lalonso', 'db.changelog-demo-data.xml', NOW(), 67, '7:ea1d4b73b0e0cd8bb83850fa954799d7', 'loadData', '', 'EXECUTED', 'dev,DESA', NULL, '3.4.0');

-- Changeset db.changelog-demo-data.xml::demo-data-recreate-sequencedemo::omorro
DROP SEQUENCE owgvgeoportal.hibernate_sequence CASCADE;

CREATE SEQUENCE owgvgeoportal.hibernate_sequence START WITH 2200;

INSERT INTO owgvgeoportal.databasechangelog (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE) VALUES ('demo-data-recreate-sequencedemo', 'omorro', 'db.changelog-demo-data.xml', NOW(), 68, '7:ae63b1e91e06637a473579b8ff9ba37f', 'dropSequence, createSequence', '', 'EXECUTED', 'dev,DESA', NULL, '3.4.0');

-- Changeset db.changelog-demo-data.xml::demo-data-tag::omorro
INSERT INTO owgvgeoportal.databasechangelog (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, TAG) VALUES ('demo-data-tag', 'omorro', 'db.changelog-demo-data.xml', NOW(), 69, '7:a611c5d17cdbb54896c6390963041db1', 'tagDatabase', '', 'EXECUTED', 'dev,DESA', NULL, '3.4.0', 'demo-data');

-- Release Database Lock
UPDATE owgvgeoportal.databasechangeloglock SET LOCKED = FALSE, LOCKEDBY = NULL, LOCKGRANTED = NULL WHERE ID = 1;
