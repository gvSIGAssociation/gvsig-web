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

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

import javax.persistence.TypedQuery;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;

import es.gva.dgti.gvgeoportal.comparator.OrdenarCapasServicioWebPorNombreCapa;
import es.gva.dgti.gvgeoportal.domain.AgrupadorCapa;
import es.gva.dgti.gvgeoportal.domain.CapasServicioWeb;
import es.gva.dgti.gvgeoportal.domain.ServicioWeb;
import es.gva.dgti.gvgeoportal.domain.SistemaCoordenadas;
import es.gva.dgti.gvgeoportal.domain.enumerated.TipoServicio;
import es.gva.dgti.gvgeoportal.service.domain.CapasServicioWebService;
import es.gva.dgti.gvgeoportal.service.domain.ServicioWebService;
import es.gva.dgti.gvgeoportal.service.domain.SistemaCoordenadasService;

public class ServicioWebServiceImpl implements ServicioWebService {

    @Autowired
    SistemaCoordenadasService sistemaCoordenadasService;

    @Autowired(required = false)
    CapasServicioWebService capasServicioWebService;

    /*
     * (non-Javadoc)
     * @see
     * es.gva.dgti.gvgeoportal.service.domain.ServicioWebService#findServicesByNoGroup
     * (es.gva.dgti.gvgeoportal.domain.AgrupadorCapa)
     */
    public TypedQuery<ServicioWeb> findServicesByNoGroup(
            AgrupadorCapa agrupadorCapa) {
        return ServicioWeb.findServicesByNoGroup(agrupadorCapa);
    }

    /*
     * (non-Javadoc)
     * @see
     * es.gva.dgti.gvgeoportal.service.domain.ServicioWebService#findServicesInIdList
     * (java.util.List)
     */
    public TypedQuery<ServicioWeb> findServicesInIdList(List<Long> idList) {
        return ServicioWeb.findServicesInIdList(idList);
    }

    /*
     * (non-Javadoc)
     * @see es.gva.dgti.gvgeoportal.service.domain.ServicioWebService#
     * findServicesNotInIdListAndNoGroup(java.util.List, V)
     */
    public TypedQuery<ServicioWeb> findServicesNotInIdListAndNoGroup(
            List<Long> idList, AgrupadorCapa agrupadorCapa) {
        return ServicioWeb.findServicesNotInIdListAndNoGroup(idList,
                agrupadorCapa);
    }

    /*
     * (non-Javadoc)
     * @see es.gva.dgti.gvgeoportal.service.domain.ServicioWebService#
     * getSelectedLayersAndStyles(java.lang.String, java.lang.String)
     */
    public Set<CapasServicioWeb> getSelectedLayersAndStyles(
            String capasSeleccionadas, String tituloCapasSeleccionadas,
            String estiloCapasSeleccionadas, String tipo, ServicioWeb servicioWeb) {
        Set<CapasServicioWeb> listaCapasServicioWeb = new HashSet<CapasServicioWeb>();
        if (tipo.equals(TipoServicio.WMTS.name())) {
            CapasServicioWeb capasServicioWeb = new CapasServicioWeb();
            // capasServicioWeb.setEstiloCapa(estiloCapasSeleccionadas);
            capasServicioWeb.setNombreCapa(capasSeleccionadas);
            capasServicioWeb.setTituloCapa(tituloCapasSeleccionadas);
            capasServicioWeb.setServicioWeb(servicioWeb);
            listaCapasServicioWeb.add(capasServicioWeb);

        }
        else {

            // obtenemos listado de capas
            List<String> capas = Arrays.asList(capasSeleccionadas.split(","));

            // obtenemos listado de titulos capas
            List<String> tituloCapas = Arrays.asList(tituloCapasSeleccionadas
                    .split("#"));

            // obtenemos listado de estilos
            List<String> estilos = Arrays.asList(estiloCapasSeleccionadas
                    .split(","));

            // recorremos capas para quedarnos con el nombre
            for (int i = 0; i < capas.size(); i++) {
                String nombreCapa = capas.get(i);
                if (!nombreCapa.isEmpty()) {

                    // buscamos estilo asociado a la capa
                    String nombreEstilo = findStyleLayer(estilos, nombreCapa);
                    if (!nombreEstilo.isEmpty()) {
                        // si el estilo es undefined o contiene esta palabra,
                        // almacenamos vacio.
                        if (nombreEstilo.contains("undefined")) {
                            nombreEstilo = "";
                        }
                    }else{
                        nombreEstilo = "";
                    }
                    // buscamo titulo asociado a la capa
                    String tituloCapa = findTitleLayer(tituloCapas, nombreCapa);

                    CapasServicioWeb capasServicioWeb = new CapasServicioWeb();
                    capasServicioWeb.setEstiloCapa(nombreEstilo);
                    capasServicioWeb.setTituloCapa(tituloCapa);
                    capasServicioWeb.setNombreCapa(nombreCapa);
                    capasServicioWeb.setServicioWeb(servicioWeb);
                    listaCapasServicioWeb.add(capasServicioWeb);
                }
            }
        }

        return listaCapasServicioWeb;
    }

    /*
     * (non-Javadoc)
     * @see
     * es.gva.dgti.gvgeoportal.service.domain.ServicioWebService#getSelectedCrs
     * (java.lang.String)
     */
    public Set<SistemaCoordenadas> getSelectedCrs(
            String coordenadasSeleccionadas) {
        Set<SistemaCoordenadas> coordenadas = new HashSet<SistemaCoordenadas>();

        // sacamos listado de coordenadas seleccionadas en la creacion
        List<String> listadoCoordenadas = Arrays
                .asList(coordenadasSeleccionadas.split(","));

        // comprobamos si el sistema de coordenadas recibido lo tenemos
        // almacenado en nuestra entidad Sistema de coordenadas
        for (int i = 0; i < listadoCoordenadas.size(); i++) {
            String sistemaCoordenada = listadoCoordenadas.get(i);
            if (!sistemaCoordenada.isEmpty()) {

                // comprobamos si existe algun sistema coordenadas con ese
                // codigo
                SistemaCoordenadas sistemaCoordenadas = sistemaCoordenadasService
                        .findSistemaCoordenadasByCodigoEquals(sistemaCoordenada);

                // anyadimos al set si existe
                if (sistemaCoordenadas != null) {
                    coordenadas.add(sistemaCoordenadas);
                }
            }
        }
        return coordenadas;
    }

    /*
     * (non-Javadoc)
     * @see
     * es.gva.dgti.gvgeoportal.service.domain.ServicioWebService#getSelectedCrsNames
     * (java.util.Set)
     */
    public String getSelectedCrsNames(
            Collection<SistemaCoordenadas> sistemasCoordenadas) {
        StringBuilder nombresCoordenadas = new StringBuilder();
        Iterator<SistemaCoordenadas> iterator = sistemasCoordenadas.iterator();
        while (iterator.hasNext()) {
            SistemaCoordenadas sistemaCoordenadas = iterator.next();
            nombresCoordenadas.append(sistemaCoordenadas.getNombre());

            // comprobamos si no es el ultimo elemento y anyadimos coma
            if (iterator.hasNext()) {
                nombresCoordenadas.append(",");
            }
        }
        return nombresCoordenadas.toString();

    }

    /*
     * (non-Javadoc)
     * @see
     * es.gva.dgti.gvgeoportal.service.domain.ServicioWebService#getFirstCrsName
     * (java.util.Set)
     */
    public String getFirstCrsName(
            Collection<SistemaCoordenadas> sistemasCoordenadas) {
        if (sistemasCoordenadas == null || sistemasCoordenadas.size() == 0) {
            return null;
        }
        else {
            Iterator<SistemaCoordenadas> iter = sistemasCoordenadas.iterator();
            SistemaCoordenadas sistemaCoordenadas = (SistemaCoordenadas) iter
                    .next();
            return sistemaCoordenadas.getNombre();
        }
    }

    /*
     * (non-Javadoc)
     * @see
     * es.gva.dgti.gvgeoportal.service.domain.ServicioWebService#containsCrs(java
     * .util.Set, java.lang.String)
     */
    public boolean containsCrs(
            Collection<SistemaCoordenadas> sistemasCoordenadas, String crs) {
        if (sistemasCoordenadas == null || sistemasCoordenadas.size() == 0) {
            return false;
        }
        else {
            Iterator<SistemaCoordenadas> iter = sistemasCoordenadas.iterator();
            while (iter.hasNext()) {
                SistemaCoordenadas sistemaCoordenadas = (SistemaCoordenadas) iter
                        .next();
                String codigo = sistemaCoordenadas.getCodigo();
                if (codigo.equalsIgnoreCase(crs)) {
                    return true;
                }
            }
            return false;
        }
    }

    /*
     * (non-Javadoc)
     * @see es.gva.dgti.gvgeoportal.service.domain.ServicioWebService#
     * getSelectedInfoLayersNames(java.util.Set, boolean)
     */
    public String getSelectedInfoLayersNames(
            Collection<CapasServicioWeb> listadoCapasServicioWeb,
            boolean isLayerName) {
        String result = "";
        StringBuilder nombresCapas = new StringBuilder();
        StringBuilder nombresEstilos = new StringBuilder();
        Iterator<CapasServicioWeb> iterator = listadoCapasServicioWeb
                .iterator();
        while (iterator.hasNext()) {
            CapasServicioWeb capaServicioWeb = iterator.next();

            // actualizamos el String en funcion del dato que queremos devolver
            if (isLayerName) {
                nombresCapas.append(capaServicioWeb.getNombreCapa());

                // comprobamos si no es el ultimo elemento y anyadimos coma
                if (iterator.hasNext()) {
                    nombresCapas.append(",");
                }
            }
            else {
                nombresEstilos.append(capaServicioWeb.getNombreCapa() + "_"
                        + capaServicioWeb.getEstiloCapa());

                // comprobamos si no es el ultimo elemento y anyadimos coma
                if (iterator.hasNext()) {
                    nombresEstilos.append(",");
                }
            }

        }

        // dependiendo de si queremos informacion de la capa o estilo devolvemos
        // un dato u otro
        if (isLayerName) {
            result = nombresCapas.toString();
        }
        else {
            result = nombresEstilos.toString();
        }

        return result;
    }

    /*
     * (non-Javadoc)
     * @see es.gva.dgti.gvgeoportal.service.domain.ServicioWebService#getSelectedStyles(java.util.Collection)
     */
    public String getSelectedStyles(
            Collection<CapasServicioWeb> listadoCapasServicioWeb) {
        String result = "";
        StringBuilder nombresEstilos = new StringBuilder();
        Iterator<CapasServicioWeb> iterator = listadoCapasServicioWeb
                .iterator();
        while (iterator.hasNext()) {
            CapasServicioWeb capaServicioWeb = iterator.next();
                nombresEstilos.append(capaServicioWeb.getEstiloCapa());

                // comprobamos si no es el ultimo elemento y anyadimos coma
                if (iterator.hasNext()) {
                    nombresEstilos.append(",");
                }
        }

        result = nombresEstilos.toString();
        return result;
    }

    /*
     * (non-Javadoc)
     * @see
     * es.gva.dgti.gvgeoportal.service.domain.ServicioWebService#getStylesNames
     * (java.util.Set)
     */
    public String getStylesNames(
            Collection<CapasServicioWeb> listadoCapasServicioWeb) {
        String result = "";
        StringBuilder nombresEstilos = new StringBuilder();
        Iterator<CapasServicioWeb> iterator = listadoCapasServicioWeb
                .iterator();
        while (iterator.hasNext()) {
            CapasServicioWeb capaServicioWeb = iterator.next();
            nombresEstilos.append(capaServicioWeb.getEstiloCapa());

            // comprobamos si no es el ultimo elemento y anyadimos coma
            if (iterator.hasNext()) {
                nombresEstilos.append(",");
            }
        }
        result = nombresEstilos.toString();
        return result;
    }

    /*
     * (non-Javadoc)
     * @see
     * es.gva.dgti.gvgeoportal.service.domain.ServicioWebService#findStyleLayer
     * (java.util.List, java.lang.String)
     */
    public String findStyleLayer(List<String> estilos, String nombreCapa) {
        String nombreEstilo = "";
        for (int i = 0; i < estilos.size(); i++) {
            String estilo = estilos.get(i);
            // obtenemos nombre capa del estilo
            String nombreCapaEstilo = estilo.substring(0,
                    estilo.lastIndexOf("_"));
            if (nombreCapaEstilo.equals(nombreCapa)) {
                nombreEstilo = estilo.substring(estilo.lastIndexOf("_") + 1,
                        estilo.length());
                break;
            }
        }
        return nombreEstilo;
    }

    /*
     * (non-Javadoc)
     * @see es.gva.dgti.gvgeoportal.service.domain.ServicioWebService#findTitleLayer(java.util.List, java.lang.String)
     */
    public String findTitleLayer(List<String> tituloCapas, String nombreCapa) {
        String tituloCapa = "";
        for (int i = 0; i < tituloCapas.size(); i++) {
            String title = tituloCapas.get(i);
            // obtenemos id capa
            String idCapa = title.substring(0, title.lastIndexOf("_"));
            if (idCapa.equals(nombreCapa)) {
                tituloCapa = title.substring(title.lastIndexOf("_") + 1,
                        title.length());
                break;
            }
        }
        return tituloCapa;
    }

    /*
     * (non-Javadoc)
     * @see
     * es.gva.dgti.gvgeoportal.service.domain.ServicioWebService#transformCrsWmts
     * (java.lang.String)
     */
    public String transformCrsWmts(String selectedCrs) {
        String result = "";

        // sacamos listado de coordenadas
        List<String> listadoCoordenadasSeleccionado = Arrays.asList(selectedCrs
                .split(","));

        // sacamos listado de coordenadas
        List<String> listadoCoordenadasAlmacenadas = Arrays
                .asList(sistemaCoordenadasService.getListCrsName().split(","));
        List<String> listadoCrsTransformado = new ArrayList<String>();
        if (!listadoCoordenadasSeleccionado.isEmpty()) {

            // recorremos listado coordenadas almacenadas para obtener listado
            // de expresiones regulares
            if (!listadoCoordenadasAlmacenadas.isEmpty()) {
                Map<String, String> patternList = new HashMap<String, String>();
                for (String crs : listadoCoordenadasAlmacenadas) {
                    String[] crsSplit = crs.split(":");
                    String pattern = "(.*)(:?)".concat(crsSplit[0])
                            .concat("((:)(.*)(:)").concat(crsSplit[1])
                            .concat("|(:)").concat(crsSplit[1]).concat(")");

                    // almacenamos listado expresiones regulares y su crs
                    patternList.put(crs, pattern);
                }

                // recorremos ahora listado crs seleccionados para buscar su
                // equivalencia
                for (int i = 0; i < listadoCoordenadasSeleccionado.size(); i++) {

                    // obtenemos crs seleccionado
                    String crsSeleccionado = listadoCoordenadasSeleccionado
                            .get(i);

                    // buscamos ahora equivalencia de este crs en el listado de
                    // patrones
                    for (Entry<String, String> entry : patternList.entrySet()) {
                        String crsAlmacenado = entry.getKey();
                        String expReg = entry.getValue();

                        // si el crs seleccionado se encuentra se almacena en el
                        // listado el
                        // crs que tenhemos en bbdd
                        if (crsSeleccionado.matches(expReg)) {

                            // sino lo tiene ya, se almacena
                            if (!listadoCrsTransformado.contains(crsAlmacenado)) {
                                listadoCrsTransformado.add(crsAlmacenado);
                            }
                        }
                    }
                }
                result = StringUtils.join(listadoCrsTransformado, ',');
            }
        }
        return result;
    }

    /* (non-Javadoc)
     * @see es.gva.dgti.gvgeoportal.service.domain.ServicioWebService#getLayersAndStylesOrderByLayersName(es.gva.dgti.gvgeoportal.domain.ServicioWeb)
     */
    public Map<String, String> getLayersAndStylesOrderByLayersName(
            ServicioWeb servicioWeb) {
        Map<String, String> map = new HashMap<String, String>();

        List<CapasServicioWeb> capasServicioWeb = capasServicioWebService.findCapasServicioWebsByServicioWeb(servicioWeb);

        Collections.sort(capasServicioWeb,
                new OrdenarCapasServicioWebPorNombreCapa());
        String nombresCapas = "";
        String estilosCapas = "";
        for (CapasServicioWeb capaServicioWeb : capasServicioWeb) {
            String nombreCapa = capaServicioWeb.getNombreCapa();
            if (nombreCapa != null && !nombreCapa.isEmpty()) {
                nombresCapas = nombresCapas.concat(nombreCapa).concat(",");
            }
            String estiloCapa = capaServicioWeb.getEstiloCapa();
            if (estiloCapa != null && !estiloCapa.isEmpty()) {
                estilosCapas = estilosCapas.concat(estiloCapa).concat(",");
            }
        }

        if (!nombresCapas.isEmpty()) {
            nombresCapas = nombresCapas.substring(0, nombresCapas.length() - 1);
        }
        if (!estilosCapas.isEmpty()) {
            estilosCapas = estilosCapas.substring(0, estilosCapas.length() - 1);
        }

        map.put("nombresCapas", nombresCapas);
        map.put("estilosCapas", estilosCapas);
        return map;
    }

}
