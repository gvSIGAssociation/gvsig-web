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

import es.gva.dgti.gvgeoportal.domain.GestorCatalogo;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.gvnix.addon.web.mvc.annotations.jquery.GvNIXWebJQuery;
import es.gva.dgti.gvgeoportal.service.batch.GestorCatalogoBatchService;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.gvnix.addon.web.mvc.annotations.batch.GvNIXWebJpaBatch;
import org.gvnix.addon.datatables.annotations.GvNIXDatatables;

@RequestMapping("/gestorcatalogos")
@Controller
@RooWebScaffold(path = "gestorcatalogos",
        formBackingObject = GestorCatalogo.class)
@GvNIXWebJQuery
@GvNIXWebJpaBatch(service = GestorCatalogoBatchService.class)
@GvNIXDatatables(ajax = true, inlineEditing = true)
public class GestorCatalogoController {

	@RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String create(@Valid GestorCatalogo gestorCatalogo, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, gestorCatalogo);
            return "gestorcatalogos/create";
        }
        uiModel.asMap().clear();
        gestorCatalogoService.saveGestorCatalogo(gestorCatalogo);
        return "redirect:/gestorcatalogos/" + encodeUrlPathSegment(gestorCatalogo.getId().toString(), httpServletRequest);
    }
}
