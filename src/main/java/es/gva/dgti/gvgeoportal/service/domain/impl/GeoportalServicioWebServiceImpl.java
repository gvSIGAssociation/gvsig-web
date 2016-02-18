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

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.persistence.TypedQuery;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.transaction.annotation.Transactional;

import com.itextpdf.text.log.Logger;
import com.itextpdf.text.log.LoggerFactory;

import es.gva.dgti.gvgeoportal.domain.GeoPortal;
import es.gva.dgti.gvgeoportal.domain.GeoportalServicioWeb;
import es.gva.dgti.gvgeoportal.domain.ServicioWeb;
import es.gva.dgti.gvgeoportal.service.domain.ConfVistasPredefinidasService;
import es.gva.dgti.gvgeoportal.service.domain.GeoPortalService;
import es.gva.dgti.gvgeoportal.service.domain.GeoportalServicioWebService;
import es.gva.dgti.gvgeoportal.service.domain.ServicioWebService;
import es.gva.dgti.gvgeoportal.web.MapaEdicionController;

public class GeoportalServicioWebServiceImpl implements
        GeoportalServicioWebService {

    @Autowired(required = false)
    ServicioWebService servicioWebService;

    @Autowired(required = false)
    GeoPortalService geoPortalService;

    @Autowired(required = false)
    ConfVistasPredefinidasService confVistasPredefinidasService;

    private static final Logger LOGGER = LoggerFactory
            .getLogger(MapaEdicionController.class);

    /* (non-Javadoc)
     * @see es.gva.dgti.gvgeoportal.service.domain.GeoportalServicioWebService#findGeoportalServicioWebByGeoportalAndServicioWeb(es.gva.dgti.gvgeoportal.domain.GeoPortal, es.gva.dgti.gvgeoportal.domain.ServicioWeb)
     */
    public TypedQuery<GeoportalServicioWeb> findGeoportalServicioWebByGeoportalAndServicioWeb(
            GeoPortal geoportal, ServicioWeb servicioWeb) {
        return GeoportalServicioWeb
                .findGeoportalServicioWebByGeoportalAndServicioWeb(geoportal,
                        servicioWeb);
    }

    /* (non-Javadoc)
     * @see es.gva.dgti.gvgeoportal.service.domain.GeoportalServicioWebService#updateTocByGeoportal(es.gva.dgti.gvgeoportal.domain.GeoPortal, java.util.Map)
     */
    @Transactional
    public ResponseEntity<Map<String, Boolean>> updateTocByGeoportal(
            GeoPortal geoportal, Map<String, Object> jsonMapEditionStatus) {
        Map<String, Boolean> response = new HashMap<String, Boolean>();

        Integer posicionLayer = 0;
        boolean updateGeoportal = false;
        for (Entry<String, Object> entry : jsonMapEditionStatus.entrySet()) {
            String key = entry.getKey();
            boolean remove = false;
            boolean create = false;

            // Cambia el centro y el zoom del geoportal si se ha modificado.
            if (key.contentEquals("center_point")) {
                String newCenter = (String) entry.getValue();
                String centerBD = geoportal.getCentro();
                if (centerBD == null || newCenter.compareTo(centerBD) != 0) {
                    geoportal.setCentro(newCenter);
                    updateGeoportal = true;
                }
            }
            if (key.contentEquals("zoom_level")) {
                Integer newZoom = (Integer) entry.getValue();
                Integer zoomBD = geoportal.getZoom();
                if (zoomBD == null || newZoom.compareTo(zoomBD) != 0) {
                    geoportal.setZoom(newZoom);
                    updateGeoportal = true;
                }
            }

            // Configuración de las capas del TOC
            if (key.endsWith("_layer") && !key.equals("current_active_layer")) {
                String servicioWebIdString = null;
                if (key.contains("predefined_layer")) {
                    servicioWebIdString = key
                            .substring(
                                    ("ps_es_gva_dgti_gvgeoportal_web_Mapaedicion_predefined_layer"
                                            .length()) + 1).split("_")[0];
                }
                else {
                    servicioWebIdString = key.substring(
                            ("ps_es_gva_dgti_gvgeoportal_web_Mapaedicion_toc"
                                    .length()) + 1).split("_")[0];
                }
                try {
                    Long servicioWebId = Long.parseLong(servicioWebIdString);
                    ServicioWeb servicioWeb = null;
                    if (servicioWebId != null) {
                        servicioWeb = servicioWebService
                                .findServicioWeb(servicioWebId);
                    }
                    else {
                        response.put("update", false);
                        return new ResponseEntity<Map<String, Boolean>>(
                                response, HttpStatus.INTERNAL_SERVER_ERROR);
                    }

                    GeoportalServicioWeb geoportalServicioWeb = null;
                    if (key.contains("predefined_layer")
                            && !entry.getValue().toString().equals("remove")) {
                        if (entry.getValue().toString().equals("remove")) {
                            remove = true;
                        }
                        else {
                            // Añade nuevas capas al TOC
                            create = true;
                            geoportalServicioWeb = new GeoportalServicioWeb();
                            geoportalServicioWeb.setGeoportal(geoportal);
                            geoportalServicioWeb.setServicioWeb(servicioWeb);
                        }
                    }
                    else {
                        List<GeoportalServicioWeb> geoportalesServiciosWeb = findGeoportalServicioWebByGeoportalAndServicioWeb(
                                geoportal, servicioWeb).getResultList();
                        if (!geoportalesServiciosWeb.isEmpty()) {
                            geoportalServicioWeb = geoportalesServiciosWeb
                                    .get(0);

                            // Borra las capas seleccionadas del TOC
                            if (entry.getValue().toString().equals("remove")) {
                                remove = true;
                                deleteGeoportalServicioWeb(geoportalServicioWeb);
                                confVistasPredefinidasService.deleteConfVistasPredefinidasServicioWebByGeoPortal(geoportalServicioWeb);
                            }
                        }else {
                            LOGGER.debug("No se hace nada.");
                            continue;
                        }
                    }
                    if (!remove) {
                        boolean activo = Boolean.parseBoolean((String) entry
                                .getValue());
                        if (create) {
                            geoportalServicioWeb.setActivo(activo);
                        }
                        else {
                            boolean activoBD = geoportalServicioWeb.isActivo();
                            if (activo != activoBD) {
                                geoportalServicioWeb.setActivo(activo);
                            }
                        }

                        // Habilitado: actualmente no configurable.
                        // Siempre
                        // habilitado.
                        if (create) {
                            geoportalServicioWeb.setHabilitado(true);
                        }

                        if (jsonMapEditionStatus.containsKey(key
                                .concat("_position"))) {
                            try {
                                Integer posicion = (Integer) jsonMapEditionStatus
                                        .get(key.concat("_position"));

                                if (create) {
                                    geoportalServicioWeb.setPosicion(posicion);
                                }
                                else {
                                    Integer posicionBD = geoportalServicioWeb
                                            .getPosicion();
                                    if (posicionBD == null
                                            || posicion.compareTo(posicionBD) != 0) {
                                        geoportalServicioWeb
                                                .setPosicion(posicion);
                                    }
                                }
                            }
                            catch (NumberFormatException ex) {
                                LOGGER.error(ex.getLocalizedMessage(), ex);
                                if (create) {
                                    geoportalServicioWeb
                                            .setPosicion(posicionLayer);
                                }
                                else {
                                    Integer posicionBD = geoportalServicioWeb
                                            .getPosicion();
                                    if (posicionBD == null
                                            || posicionLayer
                                                    .compareTo(posicionBD) != 0) {
                                        geoportalServicioWeb
                                                .setPosicion(posicionLayer);
                                    }
                                }
                                posicionLayer = posicionLayer + 1;
                            }
                        }
                        else {
                            if (create) {
                                geoportalServicioWeb.setPosicion(posicionLayer);
                            }
                            else {
                                Integer posicionBD = geoportalServicioWeb
                                        .getPosicion();
                                if (posicionBD == null
                                        || posicionLayer.compareTo(posicionBD) != 0) {
                                    geoportalServicioWeb
                                            .setPosicion(posicionLayer);
                                }
                            }
                            posicionLayer = posicionLayer + 1;
                        }

                        if (jsonMapEditionStatus.containsKey(key.replace(
                                "layer", "opacity_level"))) {
                            try {
                                BigDecimal opacidad = new BigDecimal(
                                        String.valueOf(jsonMapEditionStatus
                                                .get(key.replace("layer",
                                                        "opacity_level"))));

                                if (create) {
                                    geoportalServicioWeb.setOpacidad(opacidad);
                                }
                                else {
                                    BigDecimal opacidadBD = geoportalServicioWeb
                                            .getOpacidad();
                                    if (opacidadBD == null
                                            || opacidad.compareTo(opacidadBD) != 0) {
                                        geoportalServicioWeb
                                                .setOpacidad(opacidad);
                                    }
                                }
                            }
                            catch (Exception ex) {
                                LOGGER.error(ex.getLocalizedMessage(), ex);
                                if (create) {
                                    geoportalServicioWeb
                                            .setOpacidad(new BigDecimal(1));
                                }
                            }
                        }
                        else {
                            if (create) {
                                geoportalServicioWeb
                                        .setOpacidad(new BigDecimal(1));
                            }
                        }
                        // Se crea un geoportalServicioWeb si no
                        // existe. Si
                        // existe se actualizan los campos si han cambiado.
                        saveGeoportalServicioWeb(geoportalServicioWeb);
                    }
                }
                catch (NumberFormatException ex) {
                    LOGGER.error(ex.getLocalizedMessage(), ex);
                    response.put("update", false);
                    return new ResponseEntity<Map<String, Boolean>>(response,
                            HttpStatus.INTERNAL_SERVER_ERROR);
                }
            }
        }
        if (updateGeoportal) {
            geoPortalService.saveGeoPortal(geoportal);
        }
        response.put("update", true);
        return new ResponseEntity<Map<String, Boolean>>(response, HttpStatus.OK);
    }

    /*
     * (non-Javadoc)
     * @see es.gva.dgti.gvgeoportal.service.domain.GeoportalServicioWebService#findGeoportalServicioWebsByGeoportal(es.gva.dgti.gvgeoportal.domain.GeoPortal)
     */
    public List<GeoportalServicioWeb> findGeoportalServicioWebsByGeoportal(
            GeoPortal geoPortal) {
        List<GeoportalServicioWeb> result = null;
        TypedQuery<GeoportalServicioWeb> geoportalServicioWebResult = null;
        geoportalServicioWebResult = GeoportalServicioWeb
                .findGeoportalServicioWebsByGeoportal(geoPortal);

        if (geoportalServicioWebResult != null
                && geoportalServicioWebResult.getResultList().size() > 0) {
            result = geoportalServicioWebResult.getResultList();
        }

        return result;
    }
}
