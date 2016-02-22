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

import java.net.MalformedURLException;
import java.net.URL;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.persistence.TypedQuery;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;

import es.gva.dgti.gvgeoportal.comparator.OrdenarCapasServicioWebPorNombreCapa;
import es.gva.dgti.gvgeoportal.domain.AgrupadorCapa;
import es.gva.dgti.gvgeoportal.domain.AgrupadorCapaServicioWeb;
import es.gva.dgti.gvgeoportal.domain.CapasServicioWeb;
import es.gva.dgti.gvgeoportal.domain.Componentes;
import es.gva.dgti.gvgeoportal.domain.GeoPortal;
import es.gva.dgti.gvgeoportal.domain.ServicioWeb;
import es.gva.dgti.gvgeoportal.domain.components.ConfAyudaBuscador;
import es.gva.dgti.gvgeoportal.domain.components.ConfCapasTematicas;
import es.gva.dgti.gvgeoportal.domain.components.ConfMiniMapa;
import es.gva.dgti.gvgeoportal.domain.components.ConfVistasPredefinidas;
import es.gva.dgti.gvgeoportal.domain.enumerated.TipoComponente;
import es.gva.dgti.gvgeoportal.service.domain.CapasServicioWebService;
import es.gva.dgti.gvgeoportal.service.domain.ComponentesService;
import es.gva.dgti.gvgeoportal.service.domain.ConfCapasTematicasService;
import es.gva.dgti.gvgeoportal.service.domain.ConfVistasPredefinidasService;
import es.gva.dgti.gvgeoportal.service.domain.GeoPortalService;
import es.gva.dgti.gvgeoportal.service.domain.ServicioWebService;
import es.gva.dgti.gvgeoportal.util.Constants;

public class GeoPortalServiceImpl implements GeoPortalService {

    @Autowired(required = false)
    ComponentesService componentesService;

    @Autowired(required = false)
    ServicioWebService servicioWebService;

    @Autowired(required = false)
    CapasServicioWebService capasServicioWebService;

    @Autowired(required = false)
    ConfVistasPredefinidasService confVistasPredefinidasService;

    @Autowired(required = false)
    ConfCapasTematicasService confCapasTematicasService;

    @SuppressWarnings("unused")
    private static final Logger LOGGER = Logger
            .getLogger(GeoPortalServiceImpl.class);

    /*
     * (non-Javadoc)
     * @see es.gva.dgti.gvgeoportal.service.domain.GeoPortalService#
     * findGeoPortalesByUrlEquals(String)
     */
    public TypedQuery<GeoPortal> findGeoPortalesByUrlEquals(String url) {
        return GeoPortal.findGeoportalesByUrlAndPublic(url, false);
    }

    /*
     * (non-Javadoc)
     * @see es.gva.dgti.gvgeoportal.service.domain.GeoPortalService#
     * findPublicGeoPortalesByUrlEquals(String)
     */
    public TypedQuery<GeoPortal> findPublicGeoPortalesByUrlEquals(String url) {
        return GeoPortal.findGeoportalesByUrlAndPublic(url, true);
    }

    /*
     * (non-Javadoc)
     * @see es.gva.dgti.gvgeoportal.service.domain.GeoPortalService#
     * findGeoPortalesByUrlEquals(String, String, String)
     */
    public TypedQuery<GeoPortal> findGeoPortalesByUrlEquals(String url,
            String sortFieldName, String sortOrder) {
        return GeoPortal.findGeoPortalesByUrlEquals(url, sortFieldName,
                sortOrder);
    }

    /*
     * (non-Javadoc)
     * @see es.gva.dgti.gvgeoportal.service.domain.GeoPortalService#
     * countFindGeoPortalesByUrlEquals(String)
     */
    public Long countFindGeoPortalesByUrlEquals(String url) {
        return GeoPortal.countFindGeoPortalesByUrlEquals(url);
    }

    /*
     * (non-Javadoc)
     * @see
     * es.gva.dgti.gvgeoportal.service.domain.GeoPortalService#clone(es.gva.dgti
     * .gvgeoportal.domain.GeoPortal)
     */
    public GeoPortal clone(GeoPortal geoPortal) {

        // creamos objeto nuevo
        GeoPortal newGeoPortal = new GeoPortal();

        // seteamos valores
        newGeoPortal.setTitulo(geoPortal.getTitulo());
        newGeoPortal.setUrl(geoPortal.getUrl() + Constants.COPIA);
        newGeoPortal.setSubtitulo(geoPortal.getSubtitulo());
        newGeoPortal.setDescripcion(geoPortal.getDescripcion());
        newGeoPortal.setAlias(geoPortal.getAlias());
        newGeoPortal.setCoordenadas(geoPortal.getCoordenadas());

        // seteamos agrupador de capa. Debo crear nuevo set para evitar problema
        // de referencias compartidas.
        Set<AgrupadorCapa> agrupadorCapaViejo = geoPortal.getAgrupadorCapa();
        Set<AgrupadorCapa> agrupadorCapa = new HashSet<AgrupadorCapa>();
        agrupadorCapa.addAll(agrupadorCapaViejo);

        newGeoPortal.setAgrupadorCapa(agrupadorCapa);
        newGeoPortal.setCentro(geoPortal.getCentro());
        newGeoPortal.setZoom(geoPortal.getZoom());
        newGeoPortal.setLogo(geoPortal.getLogo());
        // seteamos siempre a false
        newGeoPortal.setPublicado(false);
        newGeoPortal.setFechaAlta(geoPortal.getFechaAlta());
        newGeoPortal.setFechaBaja(geoPortal.getFechaBaja());
        return newGeoPortal;
    }

    /*
     * (non-Javadoc)
     * @see es.gva.dgti.gvgeoportal.service.domain.GeoPortalService#
     * checkSelectedComponentes(javax.servlet.http.HttpServletRequest)
     */
    public List<TipoComponente> checkSelectedComponentes(
            HttpServletRequest request) {
        List<TipoComponente> listadoComponentes = new ArrayList<TipoComponente>();
        for (TipoComponente componente : TipoComponente.values()) {
            String conf = request.getParameter(componente.toString());
            if (conf != null && !conf.isEmpty()) {
                listadoComponentes.add(componente);
            }

        }
        return listadoComponentes;
    }

    /*
     * (non-Javadoc)
     * @see es.gva.dgti.gvgeoportal.service.domain.GeoPortalService#
     * getComponentsAndInformationByGeoportal
     * (es.gva.dgti.gvgeoportal.domain.GeoPortal)
     */
    public Map<String, Object> getComponentsAndInformationByGeoportal(
            GeoPortal geoportal) {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("geoportal", geoportal);
        List<Componentes> componentes = componentesService
                .findComponentesByGeoPortal(geoportal);
        for (Componentes componente : componentes) {
            TipoComponente tipo = componente.getTipo();
            if (tipo != null) {
                map.put(tipo.name(), true);
                switch (tipo) {
                case anyadir_grupo_capas:

                    LinkedHashMap<String, List<Map<String, Object>>> grupos = new LinkedHashMap<String, List<Map<String, Object>>>();

                    // Recorremos todas las agrupaciones de capas vinculadas al
                    // geoportal
                    Set<AgrupadorCapa> agrupadoresCapa = geoportal
                            .getAgrupadorCapa();
                    for (AgrupadorCapa agrupadorCapa : agrupadoresCapa) {
                        List<Map<String, Object>> capas = new ArrayList<Map<String, Object>>();
                        grupos.put(agrupadorCapa.getNombre(), capas);
                        // Recorremos los servicios web cartográficos de cada
                        // agrupación
                        Set<AgrupadorCapaServicioWeb> relAgrupadorServiciosWeb = agrupadorCapa
                                .getServicios();
                        for (AgrupadorCapaServicioWeb relAgrupadorServicioWeb : relAgrupadorServiciosWeb) {
                            ServicioWeb servicioWeb = relAgrupadorServicioWeb
                                    .getServicioWeb();
                            if (servicioWeb.getCoordenadas().contains(
                                    geoportal.getCoordenadas())) {

                                // Obtenemos los datos necesarios del servicio web
                                // para usarlo en el geoportal
                                Map<String, Object> capa = obtainInfoForGeoportal(servicioWeb);
                                capas.add(capa);
                            }
                        }
                    }
                    map.put("grupos", grupos);
                    break;
                case minimapa:

                    // Hacemos cast para obtener la configuración del minimapa.
                    ConfMiniMapa configuracionMinimapa = (ConfMiniMapa) componente;

                    // Obtenemos los datos necesarios del servicio web para usarlo
                    // en el geoportal
                    Map<String, Object> capaMinimapa = obtainInfoForGeoportal(configuracionMinimapa
                            .getServicioWeb());
                    map.put("capaMinimapa", capaMinimapa);

                    break;
                case vistas_predefinidas:

                    List<Map<String, Object>> vistasPredefinidas = new ArrayList<Map<String,Object>>();
                    List<ConfVistasPredefinidas> confVistasPredefinidas = confVistasPredefinidasService
                            .findConfVistasPredefinidasesByGeoPortal(geoportal);
                    for (ConfVistasPredefinidas confVistasPredefinida : confVistasPredefinidas) {
                        Map<String, Object> vistaPredefinida = new HashMap<String, Object>();
                        List<Map<String, Object>> capas = new ArrayList<Map<String, Object>>();

                        vistaPredefinida.put("identificador", StringUtils.replace(confVistasPredefinida.getNombre(), " ", "_"));
                        vistaPredefinida.put("nombre", confVistasPredefinida.getNombre());

                        String idCapasCSV = "";
                        Set<ServicioWeb> serviciosWeb = confVistasPredefinida.getServiciosWeb();
                        for (ServicioWeb servicioWeb : serviciosWeb) {
                            if (servicioWeb.getCoordenadas().contains(geoportal.getCoordenadas())) {
                                if (StringUtils.isNotBlank(idCapasCSV)) {
                                    idCapasCSV = idCapasCSV.concat(",");
                                }
                                idCapasCSV = idCapasCSV.concat(
                                        servicioWeb.getId().toString());

                                Map<String, Object> capa = obtainInfoForGeoportal(servicioWeb);
                                capas.add(capa);
                            }
                        }
                        vistaPredefinida.put("idCapas", idCapasCSV);

                        vistaPredefinida.put("capas", capas);
                        vistasPredefinidas.add(vistaPredefinida);
                    }
                    map.put("vistasPredefinidas", vistasPredefinidas);
                    break;
                case ayuda_buscador:
                    ConfAyudaBuscador ayudaBuscador = (ConfAyudaBuscador) componente;
                    String textoAyuda = ayudaBuscador.getTextoAyuda();
                    map.put("textoAyuda", textoAyuda);
                    break;
                case cargar_tematicos:
                    // Declaramos la variable que contendrá los grupos temáticos del geoportal para cargarlos en la vista
                    List<Map<String, Object>> gruposTematicos = new ArrayList<Map<String, Object>>();

                    // Obtenemos los grupos temáticos del geoportal
                    List<ConfCapasTematicas> confCapasTematicas = confCapasTematicasService.findConfCapasTematicasesByGeoPortal(geoportal);

                    // Para cada grupo temático añadimos sus atributos
                    for (ConfCapasTematicas confCapaTematica : confCapasTematicas) {
                        Map<String, Object> grupoTematico = new HashMap<String, Object>();
                        grupoTematico.put("identificador", StringUtils.replace(confCapaTematica.getNombre(), " ", "_"));
                        grupoTematico.put("nombre", confCapaTematica.getNombre());

                        // Buscamos los servicios web relacionados con el grupo temático
                        AgrupadorCapa agrupacion = confCapaTematica.getGrupo();
                        Set<AgrupadorCapaServicioWeb> relAgrupadorServiciosWeb = agrupacion.getServicios();

                        // Declaramos la variable que contendrá las capas de cada grupo temático
                        List<Map<String, Object>> capas = new ArrayList<Map<String, Object>>();
                        for (AgrupadorCapaServicioWeb relAgrupadorServicioWeb : relAgrupadorServiciosWeb) {
                            ServicioWeb servicioWeb = relAgrupadorServicioWeb.getServicioWeb();
                            if (servicioWeb.getCoordenadas().contains(geoportal.getCoordenadas())) {

                                // Obtenemos los datos necesarios del servicio web para usarlo en el geoportal
                                Map<String, Object> capa = obtainInfoForGeoportal(servicioWeb);

                                // Añadimos cada capa a la variable de capas de cada grupo temático
                                capas.add(capa);
                            }
                        }

                        // Añadimos la variable capas a su grupo temático
                        grupoTematico.put("capas", capas);

                        // Añadimos el grupo temático a los que se deben mostrar
                        gruposTematicos.add(grupoTematico);
                    }

                    // Añadimos los grupos temáticos al mapa
                    map.put("gruposTematicos", gruposTematicos);
                    break;
                default:
                    break;
                }
            }
        }
        return map;
    }

    /*
     * (non-Javadoc)
     * @see es.gva.dgti.gvgeoportal.service.domain.GeoPortalService#
     * saveGeoPortal(es.gva.dgti.gvgeoportal.domain.GeoPortal)
     */
    public void saveGeoPortal(GeoPortal geoPortal) {
        geoPortal.persist();

        // Se activan por defecto los componentes "Mostrar TOC" y
        // "Herramienta de zoom"
        Componentes componente = new Componentes();
        componente.setGeoPortal(geoPortal);
        componente.setTipo(TipoComponente.ver_toc);
        componentesService.saveComponentes(componente);

        componente = new Componentes();
        componente.setGeoPortal(geoPortal);
        componente.setTipo(TipoComponente.regla_zoom);
        componentesService.saveComponentes(componente);
    }

    /**
     * Obtiene los datos necesarios de un servicio web cartográfico (tipo,
     * nombre, URL, etc.) para poder utilizarlo en un geoportal.
     *
     * @param servicioWeb el ServicioWeb.
     * @return un map con los datos necesarios.
     */
    private Map<String, Object> obtainInfoForGeoportal(ServicioWeb servicioWeb) {
        Map<String, Object> capa = new HashMap<String, Object>();
        capa.put("identificador", Long.toString(servicioWeb.getId()));
        capa.put("nombreCapa", servicioWeb.getNombre());
        capa.put("url", servicioWeb.getUrl());
        capa.put("tipo", servicioWeb.getTipo());
        capa.put("versionProtocolo", servicioWeb.getVersionProtocolo());

        List<CapasServicioWeb> capasServicioWeb = capasServicioWebService.findCapasServicioWebsByServicioWeb(servicioWeb);
        Collections.sort(capasServicioWeb,
                new OrdenarCapasServicioWebPorNombreCapa());
        capa.put("capasServicioWeb", capasServicioWeb);
        capa.put("capas", servicioWebService.getSelectedInfoLayersNames(
                capasServicioWeb, true));
        capa.put("estilos", servicioWebService.getSelectedStyles(capasServicioWeb));
        return capa;
    }

    /*
     * (non-Javadoc)
     * @see es.gva.dgti.gvgeoportal.service.domain.GeoPortalService#getFullUrlPortal(java.lang.String, java.lang.String, java.lang.String, int, java.lang.String)
     */
    public String getFullUrlPortal(String url, String scheme, String serverName, int port, String contextPath){

        String urlCompleta = "";
        URL serverURL = null;

        //si son los puertos por defecto se setea a -1 para que no aparezca en la url
        if (scheme.equals("http") && port == 80) {
            port = -1;
        } else if (scheme.equals("https") && port == 443) {
            port = -1;
        }

        try {
            serverURL = new URL(scheme, serverName, port, contextPath.concat("/map/").concat(url));
            urlCompleta = serverURL.toString();
        }
        catch (MalformedURLException e) {
            // si da algun error, creamos nosotros la url de forma manual
            urlCompleta = scheme.concat("://").concat(serverName).concat(":").concat(""+port).concat(contextPath).concat("/map/").concat(url);
        }

        return urlCompleta;

    }
}
