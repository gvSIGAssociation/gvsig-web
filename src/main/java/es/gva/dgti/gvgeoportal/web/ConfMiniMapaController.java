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

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.apache.commons.lang3.StringUtils;
import org.gvnix.addon.datatables.annotations.GvNIXDatatables;
import org.gvnix.addon.loupefield.annotations.GvNIXLoupeController;
import org.gvnix.addon.web.mvc.annotations.batch.GvNIXWebJpaBatch;
import org.gvnix.addon.web.mvc.annotations.jquery.GvNIXWebJQuery;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import es.gva.dgti.gvgeoportal.domain.GeoPortal;
import es.gva.dgti.gvgeoportal.domain.ServicioWeb;
import es.gva.dgti.gvgeoportal.domain.components.ConfMiniMapa;
import es.gva.dgti.gvgeoportal.domain.enumerated.TipoComponente;
import es.gva.dgti.gvgeoportal.service.batch.ConfMiniMapaBatchService;
import es.gva.dgti.gvgeoportal.service.domain.GeoPortalService;
import es.gva.dgti.gvgeoportal.service.domain.ServicioWebService;

@RequestMapping("/confminimapas")
@Controller
@RooWebScaffold(path = "confminimapas",
        formBackingObject = ConfMiniMapa.class,
        update = false,
        delete = false,
        create = false)
@GvNIXWebJQuery
@GvNIXWebJpaBatch(service = ConfMiniMapaBatchService.class)
@GvNIXDatatables(ajax = true)
@GvNIXLoupeController
public class ConfMiniMapaController {

    @Autowired
    ServicioWebService servicioWebService;

    @Autowired
    GeoPortalService geoPortalService;

    /**
     * Tengo que hacer push-in de este metodo por error gnix al no comprobar que
     * no esta creado update
     */
    @RequestMapping(produces = "text/html",
            method = RequestMethod.PUT,
            params = "datatablesRedirect")
    public String updateDatatablesDetail(
            @RequestParam(value = "datatablesRedirect", required = true) String redirect,
            @Valid ConfMiniMapa confminimapa, BindingResult bindingResult,
            Model uiModel, RedirectAttributes redirectModel,
            HttpServletRequest httpServletRequest) {

        return null;
    }

    /**
     * Tengo que hacer push-in de este metodo por error gnix al no comprobar que
     * no esta creado delete
     */
    @RequestMapping(produces = "text/html",
            method = RequestMethod.DELETE,
            params = "datatablesRedirect",
            value = "/{id}")
    public String deleteDatatablesDetail(
            @RequestParam(value = "datatablesRedirect", required = true) String redirect,
            @PathVariable("id") Long id, @RequestParam(value = "page",
                    required = false) Integer page,
            @RequestParam(value = "size", required = false) Integer size,
            Model uiModel) {

        return null;
    }

    /**
     * Tengo que hacer push-in de este metodo por error gnix al no comprobar que
     * no esta creado create
     */
    @RequestMapping(produces = "text/html",
            method = RequestMethod.POST,
            params = "datatablesRedirect")
    public String createDatatablesDetail(
            @RequestParam(value = "datatablesRedirect", required = true) String redirect,
            @Valid ConfMiniMapa confminimapa, BindingResult bindingResult,
            Model uiModel, RedirectAttributes redirectModel,
            HttpServletRequest httpServletRequest) {

        return null;
    }

    @RequestMapping(value = "componentes/cargarMiniMapa",
            method = RequestMethod.GET,
            produces = "text/html")
    public String loadSearchFromComponent(Model uiModel,
            HttpServletRequest request) {
        Map<String, String> params = populateParametersMap(request);

        ConfMiniMapa confMiniMapa = null;

        if (params.containsKey("geoPortal")) {
            String idGeoPortal = params.get("geoPortal");
            if (!StringUtils.isBlank(idGeoPortal)) {
                GeoPortal geoPortal = geoPortalService.findGeoPortal(Long
                        .parseLong(idGeoPortal));
                uiModel.addAttribute("geoPortal", geoPortal);
                confMiniMapa = confMiniMapaService
                        .findConfMiniMapasByGeoPortal(geoPortal);
            }
        }
        if (confMiniMapa == null) {
            confMiniMapa = new ConfMiniMapa();
        }
        uiModel.addAttribute("confMiniMapa", confMiniMapa);

        ServicioWeb servicioWeb = confMiniMapa.getServicioWeb();

        String layersSelected = "";
        String stylesSelected = "";

        // obtenemos informacion sobre las capas y estilos
        if (servicioWeb != null && servicioWeb.getCapasServicioWeb() != null
                && servicioWeb.getCapasServicioWeb().size() > 0) {
            layersSelected = servicioWebService.getSelectedInfoLayersNames(
                    confMiniMapa.getServicioWeb().getCapasServicioWeb(), true);
            stylesSelected = servicioWebService.getStylesNames(confMiniMapa
                    .getServicioWeb().getCapasServicioWeb());
        }
        // String con las capas seleccionadas
        uiModel.addAttribute("layersSelected", layersSelected);
        // String con los estilos seleccionadas
        uiModel.addAttribute("stylesSelected", stylesSelected);

        return "confminimapas/search";
    }

    @RequestMapping(value = "componentes/guardarMiniMapa",
            method = RequestMethod.GET,
            produces = "text/html")
    public String create(Model uiModel, HttpServletRequest request) {

        Map<String, String> params = populateParametersMap(request);
        String idGeoPortal = params.get("geoPortal");
        String idServicioWeb = params.get("servicioWeb");
        // si vienen los dos parametros informados procedemos a borrar el
        // servicioWeb previamente borrado y anyadir el nuevo
        if (!StringUtils.isBlank(idGeoPortal)
                && !StringUtils.isBlank(idServicioWeb)) {

            GeoPortal geoPortal = geoPortalService.findGeoPortal(Long
                    .parseLong(idGeoPortal));
            ServicioWeb servicioWeb = servicioWebService.findServicioWeb(Long
                    .parseLong(idServicioWeb));

            // borramos si existe configuracion de mini mapa

            ConfMiniMapa confMiniMapaAntiguo = confMiniMapaService
                    .findConfMiniMapasByGeoPortal(geoPortal);
            if (confMiniMapaAntiguo != null) {
                confMiniMapaService.deleteConfMiniMapa(confMiniMapaAntiguo);
            }

            ConfMiniMapa confMiniMapa = new ConfMiniMapa();
            confMiniMapa.setGeoPortal(geoPortal);
            confMiniMapa.setTipo(TipoComponente.minimapa);
            confMiniMapa.setServicioWeb(servicioWeb);
            confMiniMapaService.saveConfMiniMapa(confMiniMapa);
        }
        return "redirect:/geoportales";
    }

}
