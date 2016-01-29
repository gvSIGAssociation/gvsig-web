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

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.gvnix.addon.datatables.annotations.GvNIXDatatables;
import org.gvnix.addon.loupefield.annotations.GvNIXLoupeController;
import org.gvnix.addon.web.mvc.annotations.batch.GvNIXWebJpaBatch;
import org.gvnix.addon.web.mvc.annotations.jquery.GvNIXWebJQuery;
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
import es.gva.dgti.gvgeoportal.domain.GeoportalServicioWeb;
import es.gva.dgti.gvgeoportal.service.batch.GeoportalServicioWebBatchService;

@RequestMapping("/geoportalserviciowebs")
@Controller
@RooWebScaffold(path = "geoportalserviciowebs",
        formBackingObject = GeoportalServicioWeb.class,
        update = false,
        delete = false,
        create = false)
@GvNIXWebJQuery
@GvNIXWebJpaBatch(service = GeoportalServicioWebBatchService.class)
@GvNIXDatatables(ajax = true)
@GvNIXLoupeController
public class GeoportalServicioWebController {

    /**
     * push-in de este método por error gvNIX al no comprobar que no está creado
     * create.
     *
     * @param redirect redirección
     * @param geoportalServicioWeb instancia del {@code GeoportalServicioWeb}
     * @param bindingResult {@code BindingResult}
     * @param uiModel {@code Model}
     * @param redirectModel {@code RedirectAttributes}
     * @param httpServletRequest {@code HttpServletRequest}
     * @return null
     */
    @RequestMapping(produces = "text/html",
            method = RequestMethod.POST,
            params = "datatablesRedirect")
    public String createDatatablesDetail(
            @RequestParam(value = "datatablesRedirect", required = true) String redirect,
            @Valid GeoportalServicioWeb geoportalServicioWeb,
            BindingResult bindingResult, Model uiModel,
            RedirectAttributes redirectModel,
            HttpServletRequest httpServletRequest) {
        return null;
    }

    /**
     * push-in de este método por error gvNIX al no comprobar que no está creado
     * update.
     *
     * @param redirect redirección
     * @param geoportalServicioWeb instancia del {@code GeoportalServicioWeb}
     * @param bindingResult {@code BindingResult}
     * @param uiModel {@code Model}
     * @param redirectModel {@code RedirectAttributes}
     * @param httpServletRequest {@code HttpServletRequest}
     * @return null
     */
    @RequestMapping(produces = "text/html",
            method = RequestMethod.PUT,
            params = "datatablesRedirect")
    public String updateDatatablesDetail(
            @RequestParam(value = "datatablesRedirect", required = true) String redirect,
            @Valid GeoportalServicioWeb geoportalServicioWeb,
            BindingResult bindingResult, Model uiModel,
            RedirectAttributes redirectModel,
            HttpServletRequest httpServletRequest) {
        return null;
    }

    /**
     * push-in de este método por error gvNIX al no comprobar que no está creado
     * delete.
     *
     * @param redirect redirección
     * @param id identificador
     * @param page página
     * @param size número de registros
     * @param uiModel {@code Model}
     * @return null
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
     * Método que carga el campo lupa para añadir una capa desde la
     * configuración del TOC de la edición de un geoportal.
     *
     * @param uiModel {@code Model}
     * @param request {@code HttpServletRequest}
     * @param geoportal instancia del {@code GeoPortal}
     * @return cadena que representa la ruta relativa del la página que contiene
     *         el campo lupa
     */
    @RequestMapping(value = "dialogoanyadircapa/{geoportal}",
            method = RequestMethod.GET,
            produces = "text/html")
    public String addLayerDialog(Model uiModel, HttpServletRequest request,
            @PathVariable("geoportal") GeoPortal geoportal) {

        uiModel.addAttribute("geoPortal", geoportal);
        uiModel.addAttribute("geoportalServicioWeb", new GeoportalServicioWeb());

        return "geoportalserviciowebs/search";
    }
}
