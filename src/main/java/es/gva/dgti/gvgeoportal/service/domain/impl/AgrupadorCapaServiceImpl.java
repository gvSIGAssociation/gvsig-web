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
package es.gva.dgti.gvgeoportal.service.domain.impl;

import es.gva.dgti.gvgeoportal.domain.AgrupadorCapa;
import es.gva.dgti.gvgeoportal.service.domain.AgrupadorCapaService;

public class AgrupadorCapaServiceImpl implements AgrupadorCapaService {

    /*
     * (non-Javadoc)
     * @see es.gva.dgti.gvgeoportal.service.domain.AgrupadorCapaService#clone(es.gva.dgti.gvgeoportal.domain.AgrupadorCapa)
     */
    public AgrupadorCapa clone(AgrupadorCapa agrupadorCapa) {
        // creamos objeto nuevo
        AgrupadorCapa newAgrupador = new AgrupadorCapa();
        // seteamos valores
        newAgrupador.setNombre(agrupadorCapa.getNombre());
        newAgrupador.setDescripcion(agrupadorCapa.getDescripcion());
        return newAgrupador;
    }

}
