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

import javax.persistence.TypedQuery;

import org.springframework.roo.addon.layers.service.RooService;

import es.gva.dgti.gvgeoportal.domain.AgrupadorCapa;
import es.gva.dgti.gvgeoportal.domain.AgrupadorCapaServicioWeb;
import es.gva.dgti.gvgeoportal.domain.ServicioWeb;

@RooService(domainTypes = { es.gva.dgti.gvgeoportal.domain.AgrupadorCapaServicioWeb.class })
public interface AgrupadorCapaServicioWebService {

    /**
     * Devuelve una consulta para localizar los {@link ServicioWeb} que están en
     * el agrupador de capa indicado.
     *
     * @param agrupadorCapaId identificador del agrupador de capa por el que se
     *        quiere filtrar
     * @return la consulta
     */
    public TypedQuery<Long> findServicesByGroup(Long agrupadorCapaId);

    /**
     * Devuelve una consulta para localizar los {@link AgrupadorCapaServicioWeb}
     * que tienen el el agrupador de capa indicado.
     *
     * @param agrupadorCapa agrupador de capa por el que se quiere filtrar
     * @return la consulta
     */
    public TypedQuery<AgrupadorCapaServicioWeb> findAgrupadorCapaServicioWebByGroup(
            AgrupadorCapa agrupadorCapa);

    /**
     * Devuelve una consulta para localizar los {@link AgrupadorCapaServicioWeb}
     * que están en la lista de ids (idList) pasada.
     *
     * @param idList la lista de ids de los {@link AgrupadorCapaServicioWeb}.
     * @return la consulta
     */
    public TypedQuery<AgrupadorCapaServicioWeb> findAgrupadorCapaServicioWebInIdList(
            List<Long> idList);

    /**
     * Devuelve una consulta para localizar los {@link AgrupadorCapaServicioWeb}
     * que no están en la lista de ids (idList) pasada y con el agrupador de
     * capa indicado.
     *
     * @param idList la lista de ids de los {@link AgrupadorCapaServicioWeb}.
     * @param agrupadorCapa agrupador de capa por el que se quiere filtrar.
     * @return la consulta
     */
    public TypedQuery<AgrupadorCapaServicioWeb> findAgrupadorCapaServicioWebNotInIdListAndGroup(
            List<Long> idList, AgrupadorCapa agrupadorCapa);
}
