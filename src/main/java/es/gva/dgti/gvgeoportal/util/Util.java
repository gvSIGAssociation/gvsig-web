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
package es.gva.dgti.gvgeoportal.util;

import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

import es.gva.dgti.gvgeoportal.domain.AgrupadorCapa;

public class Util {

    public static StringBuffer getParamsFinder(Map<String, String> params) {
        StringBuffer paramsFinder = new StringBuffer("");
        Iterator<Entry<String, String>> iter = params.entrySet().iterator();
        while (iter.hasNext()) {
            Entry<String, String> entry = iter.next();
            if (entry.getKey().contains("Finder")) {
                paramsFinder.append("&amp;");
                paramsFinder.append(entry.getKey());
                paramsFinder.append('=');
                paramsFinder.append(entry.getValue());
            }
        }
        return paramsFinder;
    }

    public static boolean checkIfTransparencySelected(String transparencia) {
        return transparencia.equals(Constants.SELECCIONAR_TRANSPARENCIA);
    }

    public static boolean isNumeric(String str) {
        try {
            double d = Double.parseDouble(str);
        }
        catch (NumberFormatException nfe) {
            return false;
        }
        return true;
    }

    /**
     * Dado un Set de AgrupadorCapa devuelve el String necesario para pintar
     * los checks de seleccion en la pagina update de geoPortal
     *
     * @param listadoGeoPortalCapa
     * @return String con listado Grupos capas del GeoPortal
     */
    public static String getSelectedLayersString(Set<AgrupadorCapa> listadoGeoPortalCapa) {

        String selectedGroupLayers = "";
        if (listadoGeoPortalCapa != null && listadoGeoPortalCapa.size() > 0) {
            StringBuffer gruposCapasGeoPortal = new StringBuffer("");
            gruposCapasGeoPortal.append(StringPool.OPEN_CURLY_BRACE);

            Iterator<AgrupadorCapa> iter = listadoGeoPortalCapa.iterator();

            while (iter.hasNext()) {
                AgrupadorCapa agrupadorCapa = iter.next();
                long idGrupo = agrupadorCapa.getId();
                gruposCapasGeoPortal.append(StringPool.QUOTE);
                gruposCapasGeoPortal.append(idGrupo);
                gruposCapasGeoPortal.append(StringPool.QUOTE);
                gruposCapasGeoPortal.append(StringPool.COLON);
                gruposCapasGeoPortal.append(idGrupo);
                // anayado comma si ultimo objeto
                if (iter.hasNext()) {
                    gruposCapasGeoPortal.append(StringPool.COMMA);
                }

            }
            gruposCapasGeoPortal.append(StringPool.CLOSE_CURLY_BRACE);
            selectedGroupLayers = gruposCapasGeoPortal.toString();
        }
        return selectedGroupLayers;
    }
}
