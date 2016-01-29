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
package es.gva.dgti.gvgeoportal.web;

import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import org.gvnix.addon.geo.annotations.GvNIXMapViewer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.itextpdf.text.log.Logger;
import com.itextpdf.text.log.LoggerFactory;

import es.gva.dgti.gvgeoportal.domain.GeoPortal;
import es.gva.dgti.gvgeoportal.domain.GeoportalServicioWeb;
import es.gva.dgti.gvgeoportal.domain.ServicioWeb;
import es.gva.dgti.gvgeoportal.service.domain.GeoportalServicioWebService;
import es.gva.dgti.gvgeoportal.service.domain.ServicioWebService;

@Controller
@RequestMapping("/mapaedicion")
@GvNIXMapViewer(entityLayers = {}, projection = "EPSG3857")
public class MapaEdicionController {

    @Autowired(required = false)
    GeoportalServicioWebService geoportalServicioWebService;

    @Autowired(required = false)
    ServicioWebService servicioWebService;

    private static final Logger LOGGER = LoggerFactory
            .getLogger(MapaEdicionController.class);

    /**
     * Muestra una página de error de "recurso no encontrado".
     *
     * @param uiModel el {@code Model}.
     * @param request el {@code HttpServletRequest}.
     * @return devuelve la cadena de representación a la página de error.
     */
    @RequestMapping(method = RequestMethod.GET, produces = "text/html")
    public String showMap(Model uiModel, HttpServletRequest request) {
        return "resourceNotFound";
    }

    /**
     * Muestra el geoportal indicado por id en modo edición. Si el geoportal no
     * existe muestra una página de error.
     *
     * @param uiModel el {@code Model}.
     * @param request el {@code HttpServletRequest}.
     * @param id identificador del geoportal en edición que se quiere mostrar.
     * @return la cadena de representación de la ruta a la que redirige.
     */
    @RequestMapping(method = RequestMethod.GET, value = "/{id}")
    public String loadGeoPortalById(Model uiModel, HttpServletRequest request,
            @PathVariable("id") GeoPortal geoportal) {
        if (geoportal != null) {
            Set<GeoportalServicioWeb> serviciosToc = geoportal
                    .getServiciosToc();
            Iterator<GeoportalServicioWeb> iterator = serviciosToc.iterator();
            while (iterator.hasNext()) {
                GeoportalServicioWeb geoportalServicioWeb = iterator.next();
                ServicioWeb servicioWeb = geoportalServicioWeb.getServicioWeb();
                Map<String, String> map = servicioWebService
                        .getLayersAndStylesOrderByLayersName(servicioWeb);
                servicioWeb.setNombresCapas(map.get("nombresCapas"));
                servicioWeb.setEstilosCapas(map.get("estilosCapas"));
            }
            uiModel.addAttribute("geoportal", geoportal);
            return "mapaedicion/show";
        }
        else {
            return "resourceNotFound";
        }
    }

    /**
     * Actualiza la configuración del TOC y el encuadre y centro de un
     * geoportal.
     *
     * @param httpServletRequest {@code HttpServletRequest}.
     * @param jsonMapEditionStatusString json con el estado de la configuración
     *        (localStorage).
     * @param geoportal instancia del {@code GeoPortal}.
     * @return indica si se ha actualizado la configuración o no.
     */
    @RequestMapping(method = RequestMethod.POST,
            value = "/guardartoc",
            params = { "jsonMapEditionStatus", "geoportal" },
            produces = "application/json")
    public ResponseEntity<Map<String, Boolean>> updateToc(
            HttpServletRequest httpServletRequest,
            @RequestParam(value = "jsonMapEditionStatus", required = true) String jsonMapEditionStatusString,
            @RequestParam(value = "geoportal", required = true) GeoPortal geoportal) {

        Map<String, Boolean> response = new HashMap<String, Boolean>();

        ObjectMapper mapper = new ObjectMapper();
        try {
            @SuppressWarnings("unchecked")
            // Se obtiene el localStorage como un map.
            Map<String, Object> jsonMapEditionStatus = mapper.readValue(
                    jsonMapEditionStatusString, Map.class);

            return geoportalServicioWebService.updateTocByGeoportal(geoportal,
                    jsonMapEditionStatus);
        }
        catch (JsonParseException ex) {
            LOGGER.error(ex.getLocalizedMessage(), ex);
            response.put("update", false);
            return new ResponseEntity<Map<String, Boolean>>(response,
                    HttpStatus.INTERNAL_SERVER_ERROR);
        }
        catch (JsonMappingException ex) {
            LOGGER.error(ex.getLocalizedMessage(), ex);
            response.put("update", false);
            return new ResponseEntity<Map<String, Boolean>>(response,
                    HttpStatus.INTERNAL_SERVER_ERROR);
        }
        catch (IOException ex) {
            LOGGER.error(ex.getLocalizedMessage(), ex);
            response.put("update", false);
            return new ResponseEntity<Map<String, Boolean>>(response,
                    HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    /**
     * Devuelve los datos necesarios para añadir una capa, en caso de que
     * todavía no haya sido añadida para un geoportal concreto.
     *
     * @param httpServletRequest {@code HttpServletRequest}.
     * @param servicioWeb instancia del {@code ServicioWeb}.
     * @param geoportal instancia del {@code GeoPortal}.
     * @return datos de una capa.
     */
    @RequestMapping(method = RequestMethod.POST,
            value = "/obtenerinformacionservicioweb",
            params = { "servicioWeb", "geoportal" },
            produces = "application/json")
    public ResponseEntity<Map<String, String>> getServiceWebInformation(
            HttpServletRequest httpServletRequest,
            @RequestParam(value = "servicioWeb", required = true) ServicioWeb servicioWeb,
            @RequestParam(value = "geoportal", required = true) GeoPortal geoportal) {

        Map<String, String> response = new HashMap<String, String>();

        List<GeoportalServicioWeb> geoportalServicioWebList = geoportalServicioWebService
                .findGeoportalServicioWebByGeoportalAndServicioWeb(geoportal,
                        servicioWeb).getResultList();
//        if (geoportalServicioWebList.isEmpty()) {
            response.put("id", servicioWeb.getId().toString());
            response.put("name", servicioWeb.getNombre());
            response.put("type", servicioWeb.getTipo().toString().toLowerCase());
            response.put("url", servicioWeb.getUrl());
            response.put("version", servicioWeb.getVersionProtocolo());
            response.put("imageFormat", servicioWeb.getFormatoImagen());
            response.put("crs", geoportal.getCoordenadas().getCodigo());

            Map<String, String> map = servicioWebService
                    .getLayersAndStylesOrderByLayersName(servicioWeb);

            response.put("layers", map.get("nombresCapas"));
            response.put("styles", map.get("estilosCapas"));

            return new ResponseEntity<Map<String, String>>(response,
                    HttpStatus.OK);
//        }
//        else {
//            return new ResponseEntity<Map<String, String>>(response,
//                    HttpStatus.NOT_ACCEPTABLE);
//        }
    }
}
