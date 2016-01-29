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

import java.util.Collection;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.persistence.TypedQuery;

import org.springframework.roo.addon.layers.service.RooService;

import es.gva.dgti.gvgeoportal.domain.AgrupadorCapa;
import es.gva.dgti.gvgeoportal.domain.ServicioWeb;
import es.gva.dgti.gvgeoportal.domain.ServicioWeb.CapasServicioWeb;
import es.gva.dgti.gvgeoportal.domain.SistemaCoordenadas;

@RooService(domainTypes = { es.gva.dgti.gvgeoportal.domain.ServicioWeb.class })
public interface ServicioWebService {

    /**
     * Devuelve una consulta para localizar los {@link ServicioWeb} que no están
     * en el agrupador de capa indicado.
     *
     * @param agrupadorCapa agrupador de capa por el que se quiere filtrar
     * @return la consulta
     */
    public TypedQuery<ServicioWeb> findServicesByNoGroup(
            AgrupadorCapa agrupadorCapa);

    /**
     * Devuelve una consulta para localizar los {@link ServicioWeb} que están en
     * la lista de ids (idList) pasada.
     *
     * @param idList la lista de ids de los servicios.
     * @return la consulta
     */
    public TypedQuery<ServicioWeb> findServicesInIdList(List<Long> idList);

    /**
     * Devuelve una consulta para localizar los {@link ServicioWeb} que no están
     * en la lista de ids (idList) pasada y en agrupador indicado.
     *
     * @param idList la lista de ids de los servicios.
     * @param agrupadorCapa el {@code AgrupadorCapa}.
     * @return la consulta
     */
    public TypedQuery<ServicioWeb> findServicesNotInIdListAndNoGroup(
            List<Long> idList, AgrupadorCapa agrupadorCapa);

    /**
     * Dadas las capas seleccionadas, sus titulos y los estilos, crea el set de
     * CapasServiciosWeb para el servicioWeb
     *
     * @param capasSeleccionadas
     * @param tituloCapasSeleccionadas
     * @param estiloCapasSeleccionadas
     * @return
     */
    public Set<CapasServicioWeb> getSelectedLayersAndStyles(
            String capasSeleccionadas, String tituloCapasSeleccionadas, String estiloCapasSeleccionadas,
            String tipo);


    /**
     * Dado los sistemas de coordenadas seleccionados, se obtiene el listado de
     * objetos SistemaCoordenadas
     *
     * @param coordenadasSeleccionadas
     * @return
     */
    public Set<SistemaCoordenadas> getSelectedCrs(
            String coordenadasSeleccionadas);

    /**
     * Obtiene un String con los nombres de los sistemas de coordenadas
     * seleccionados.
     *
     * @param sistemasCoordenadas
     * @return
     */
    public String getSelectedCrsNames(
            Collection<SistemaCoordenadas> sistemasCoordenadas);

    /**
     * Dado un set de todos los sistemas de coordenadas, devuelve el nombre del
     * primero de ellos.
     *
     * @param sistemasCoordenadas
     * @return
     */
    public String getFirstCrsName(
            Collection<SistemaCoordenadas> sistemasCoordenadas);

    /**
     * Dado el listado de CRS soportados por una capa y un String de un CRS
     * devuelve true si dicho CRS se encuentra entre los CRS soportados por la
     * capa
     *
     * @param sistemasCoordenadas
     * @return
     */
    public boolean containsCrs(
            Collection<SistemaCoordenadas> sistemasCoordenadas, String crs);

    /**
     * Dado el listado de CapasServicioWeb, en funcion del parametro isLayerName
     * devuelve a informacion asociada al nombre de la capa o al nombre del
     * estilo
     *
     * @param listadoCapasServicioWeb
     * @param isLayerName
     * @return
     */
    public String getSelectedInfoLayersNames(
            Collection<CapasServicioWeb> listadoCapasServicioWeb,
            boolean isLayerName);

    /**
     * Busca el estilo asociado al nombre de capa dado
     *
     * @param estilos. Array de estilos del servicio web
     * @param nombreCapa. Nombre de la capa que hace de id.
     * @return
     */
    public String findStyleLayer(List<String> estilos, String nombreCapa);

    /**
     * Busca el titulo asociado al nombre de capa dado.
     *
     * @param tituloCapas. Array con los titulos de las capas
     * @param nombreCapa.  Nombre de la capa que hace de id.
     * @return
     */
    public String findTitleLayer(List<String> tituloCapas, String nombreCapa);

    /**
     * Devuelve String separado por comas con el nombre de los estilos
     *
     * @param listadoCapasServicioWeb
     * @return
     */
    public String getStylesNames(
            Collection<CapasServicioWeb> listadoCapasServicioWeb);

    /**
     * Dado un commaSeparatedString con los CRS con el formato para capas WMTS,
     * devuelve un String con los CRS con el formato estandar
     *
     * @param selectedCrs
     * @return
     */
    public String transformCrsWmts(String selectedCrs);

    /**
     * Devuelve en un mapa los "nombresCapas" y "estilosCapas" ordenados por
     * nombre de capa.
     *
     * @param servicioWeb instancia del {@code ServicioWeb}.
     * @return map con "nombresCapas" y "estilosCapas" ordenadas por nombre de
     *         Capa.
     */
    public Map<String, String> getLayersAndStylesOrderByLayersName(
            ServicioWeb servicioWeb);

}
