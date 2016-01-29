/*******************************************************************************
 * gvGeoportal is sponsored by the General Directorate for Information
 * Technologies (DGTI) of the Regional Ministry of Finance and Public
 * Administration of the Generalitat Valenciana (Valencian Community,
 * Spain), managed by gvSIG Association and led by DISID Corporation.
 * 
 * Copyright (C) 2016 DGTI - Generalitat Valenciana
 * 
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Affero General Public License as
 * published by the Free Software Foundation, either version 3 of the
 * License, or (at your option) any later version.
 * 
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Affero General Public License for more details.
 * 
 * You should have received a copy of the GNU Affero General Public License
 *  along with this program.  If not, see <http://www.gnu.org/licenses/>.
 ******************************************************************************/
package es.gva.dgti.gvgeoportal.service.domain;

import java.util.List;
import java.util.Map;

import javax.persistence.TypedQuery;

import org.springframework.http.ResponseEntity;
import org.springframework.roo.addon.layers.service.RooService;

import es.gva.dgti.gvgeoportal.domain.GeoPortal;
import es.gva.dgti.gvgeoportal.domain.GeoportalServicioWeb;
import es.gva.dgti.gvgeoportal.domain.ServicioWeb;

@RooService(domainTypes = { es.gva.dgti.gvgeoportal.domain.GeoportalServicioWeb.class })
public interface GeoportalServicioWebService {

    /**
     * Devuelve la consulta a base de datos necesaria para obtener las
     * relaciones entre geoportales y servicios web en base a un geoportal y
     * servicio web específicos.
     *
     * @param geoportal por el que se quiere filtrar
     * @param servicioWeb por el que se quiere filtrar
     * @return la consulta
     */
    public TypedQuery<GeoportalServicioWeb> findGeoportalServicioWebByGeoportalAndServicioWeb(
            GeoPortal geoportal, ServicioWeb servicioWeb);

    /**
     * Actualiza la configuración del TOC y el encuadre y centro de un
     * geoportal.
     *
     * @param geoportal instancia del {@code GeoPortal}.
     * @param jsonMapEditionStatus map con el estado de la configuración
     *        (localStorage).
     * @return indica si se ha actualizado la configuración o no.
     */
    public ResponseEntity<Map<String, Boolean>> updateTocByGeoportal(
            GeoPortal geoportal, Map<String, Object> jsonMapEditionStatus);

    /**
     * Devuelve el listado de GeoportalServicioWeb dado un geoPortal
     * @param geoPortal por el que se quiere filtrar
     * @return List<GeoportalServicioWeb>
     */
    public List<GeoportalServicioWeb> findGeoportalServicioWebsByGeoportal(GeoPortal geoPortal);

}
