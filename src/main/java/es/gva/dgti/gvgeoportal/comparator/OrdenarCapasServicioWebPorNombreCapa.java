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
package es.gva.dgti.gvgeoportal.comparator;

import java.io.Serializable;
import java.util.Comparator;

import es.gva.dgti.gvgeoportal.domain.ServicioWeb.CapasServicioWeb;

/**
 * Se usa para ordenar las capas del servicio web por nombre de capa usando
 * Collections.sort(list, new OrdenarCapasServicioWebPorNombreCapa())
 *
 */
public class OrdenarCapasServicioWebPorNombreCapa implements Comparator<CapasServicioWeb>, Serializable {

    /**
     * Compara dos capas dadas devolviendo un int con el resultado
     */
    @Override
    public int compare(CapasServicioWeb capaServicioWeb1,CapasServicioWeb capaServicioWeb2) {
        return capaServicioWeb1.getNombreCapa().compareTo(capaServicioWeb2.getNombreCapa());
    }
}
