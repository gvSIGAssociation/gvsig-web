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

import es.gva.dgti.gvgeoportal.domain.components.ConfCapasTematicas;

import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.apache.commons.lang3.StringUtils;
import org.gvnix.addon.web.mvc.annotations.jquery.GvNIXWebJQuery;

import es.gva.dgti.gvgeoportal.service.batch.ConfCapasTematicasBatchService;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.gvnix.addon.web.mvc.annotations.batch.GvNIXWebJpaBatch;
import org.gvnix.addon.datatables.annotations.GvNIXDatatables;
import org.gvnix.addon.loupefield.annotations.GvNIXLoupeController;

@RequestMapping("/confcapastematicases")
@Controller
@RooWebScaffold(path = "confcapastematicases",
        formBackingObject = ConfCapasTematicas.class)
@GvNIXWebJQuery
@GvNIXWebJpaBatch(service = ConfCapasTematicasBatchService.class)
@GvNIXDatatables(ajax = true, inlineEditing = true)
@GvNIXLoupeController
public class ConfCapasTematicasController {

    @RequestMapping(method = RequestMethod.GET, produces = "text/html")
    public String listDatatables(Model uiModel, HttpServletRequest request) {
        Map<String, String> params = populateParametersMap(request);
        // Get parentId information for details render
        String parentId = params.remove("_dt_parentId");
        if (StringUtils.isNotBlank(parentId)) {
            uiModel.addAttribute("parentId", parentId);
        }
        String parentTableHashId = params.remove("dtt_parent_table_id_hash");
        if (StringUtils.isNotBlank(parentTableHashId)) {
            uiModel.addAttribute("dtt_parent_table_id_hash", parentTableHashId);
        }
        String tableHashId = params.remove("dtt_table_id_hash");
        if (StringUtils.isNotBlank(tableHashId)
                && !uiModel.containsAttribute("dtt_table_id_hash")) {
            uiModel.addAttribute("dtt_table_id_hash", tableHashId);
        }
        String rowOnTopIds = params.remove("dtt_row_on_top_ids");
        if (StringUtils.isNotBlank(rowOnTopIds)) {
            uiModel.addAttribute("dtt_row_on_top_ids", rowOnTopIds);
        }
        if (!params.isEmpty()) {
            uiModel.addAttribute("baseFilter", params);
        }

        return "confcapastematicases/list";
    }

    @RequestMapping(value = "/componentes/cargarTematicas",
            method = RequestMethod.GET,
            produces = "text/html")
    public String listDatatablesFromComponents(Model uiModel,
            HttpServletRequest request) {
        Map<String, String> params = populateParametersMap(request);
        // Get parentId information for details render
        String parentId = params.remove("_dt_parentId");
        if (StringUtils.isNotBlank(parentId)) {
            uiModel.addAttribute("parentId", parentId);
        }
        String parentTableHashId = params.remove("dtt_parent_table_id_hash");
        if (StringUtils.isNotBlank(parentTableHashId)) {
            uiModel.addAttribute("dtt_parent_table_id_hash", parentTableHashId);
        }
        String tableHashId = params.remove("dtt_table_id_hash");
        if (StringUtils.isNotBlank(tableHashId)
                && !uiModel.containsAttribute("dtt_table_id_hash")) {
            uiModel.addAttribute("dtt_table_id_hash", tableHashId);
        }
        String rowOnTopIds = params.remove("dtt_row_on_top_ids");
        if (StringUtils.isNotBlank(rowOnTopIds)) {
            uiModel.addAttribute("dtt_row_on_top_ids", rowOnTopIds);
        }
        if (!params.isEmpty()) {
            uiModel.addAttribute("baseFilter", params);
        }

        return "confcapastematicases/listComponents";
    }
}
