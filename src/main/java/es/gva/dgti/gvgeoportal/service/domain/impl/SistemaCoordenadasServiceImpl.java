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

import java.util.Iterator;
import java.util.List;

import javax.persistence.NoResultException;
import javax.persistence.TypedQuery;

import org.springframework.dao.EmptyResultDataAccessException;

import es.gva.dgti.gvgeoportal.domain.SistemaCoordenadas;
import es.gva.dgti.gvgeoportal.service.domain.SistemaCoordenadasService;

public class SistemaCoordenadasServiceImpl implements SistemaCoordenadasService {

    public SistemaCoordenadas findSistemaCoordenadasByCodigoEquals(String codigo) {

        SistemaCoordenadas sistemaCoordenadas = null;
        TypedQuery<SistemaCoordenadas> result = SistemaCoordenadas
                .findSistemaCoordenadasByCodigoEquals(codigo);

        try {
            sistemaCoordenadas = result.getSingleResult();
        }
        catch (NoResultException exception) {
            // no hay resultados
            return null;
        }
        catch (EmptyResultDataAccessException ex) {
            // no hay resultados
            return null;
        }

        return sistemaCoordenadas;
    }

    public String getListCrsName() {
        // obtenemos sistemas de coordenadas
        List<SistemaCoordenadas> listaSistemasCoordenadas = findAllSistemaCoordenadas();

        // creamos string
        StringBuilder nombresCoordenadas = new StringBuilder();

        Iterator<SistemaCoordenadas> iterator = listaSistemasCoordenadas
                .iterator();
        while (iterator.hasNext()) {
            SistemaCoordenadas sistemaCoordenadas = iterator.next();
            nombresCoordenadas.append(sistemaCoordenadas.getCodigo());
            // comprobamos si no es el ultimo elemento y anyadimos coma
            if (iterator.hasNext()) {
                nombresCoordenadas.append(",");
            }
        }
        return nombresCoordenadas.toString();
    }
}
