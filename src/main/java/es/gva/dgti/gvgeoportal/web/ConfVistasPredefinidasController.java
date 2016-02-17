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
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.transaction.Transactional;

import es.gva.dgti.gvgeoportal.domain.GeoPortal;
import es.gva.dgti.gvgeoportal.domain.GeoportalServicioWeb;
import es.gva.dgti.gvgeoportal.domain.ServicioWeb;
import es.gva.dgti.gvgeoportal.domain.components.ConfVistasPredefinidas;
import es.gva.dgti.gvgeoportal.domain.enumerated.TipoComponente;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.apache.commons.lang3.StringUtils;
import org.gvnix.addon.web.mvc.annotations.jquery.GvNIXWebJQuery;

import es.gva.dgti.gvgeoportal.service.batch.ConfVistasPredefinidasBatchService;
import es.gva.dgti.gvgeoportal.service.domain.GeoPortalService;
import es.gva.dgti.gvgeoportal.service.domain.GeoportalServicioWebService;
import es.gva.dgti.gvgeoportal.service.domain.ServicioWebService;

import org.gvnix.addon.web.mvc.annotations.batch.GvNIXWebJpaBatch;
import org.gvnix.addon.datatables.annotations.GvNIXDatatables;
import org.gvnix.addon.loupefield.annotations.GvNIXLoupeController;
import org.gvnix.web.json.JsonResponse;


@RequestMapping("/confvistaspredefinidases")
@Controller
@RooWebScaffold(path = "confvistaspredefinidases", formBackingObject = ConfVistasPredefinidas.class)
@GvNIXWebJQuery
@GvNIXWebJpaBatch(service = ConfVistasPredefinidasBatchService.class)
@GvNIXDatatables(ajax = true)
@GvNIXLoupeController
public class ConfVistasPredefinidasController {

  @Autowired
  GeoportalServicioWebService geoportalServicioWebService;

  @Autowired
  ServicioWebService servicioWebService;

  @Autowired
  GeoPortalService geoPortalService;


  void populateEditForm(Model uiModel, ConfVistasPredefinidas confVistasPredefinidas) {

    uiModel.addAttribute("confVistasPredefinidas", confVistasPredefinidas);
    addDateTimeFormatPatterns(uiModel);
    uiModel.addAttribute("geoportales", geoPortalService.findAllGeoPortales());
    uiModel.addAttribute("tipocomponentes", Arrays.asList(TipoComponente.values()));

    if(!uiModel.containsAttribute("serviciosweb")){
      uiModel.addAttribute("serviciosweb", servicioWebService.findAllServiciosWeb());
    }
  }

    @RequestMapping(value = "/componentes/vistasPredefinidas",
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

        if(params.containsKey("geoPortal")){
          Long idGeoPortal = Long.parseLong(params.get("geoPortal"));
          uiModel.addAttribute("geoPortal",params.get("geoPortal"));

          GeoPortal geoPortal = GeoPortal.findGeoPortal(idGeoPortal);
          List<ServicioWeb> serviciosWeb = new ArrayList<ServicioWeb>();
          List<GeoportalServicioWeb> geoportalServiciosWeb =
              GeoportalServicioWeb.findGeoportalServicioWebsByGeoportal(geoPortal).getResultList();
          for(GeoportalServicioWeb geoportalServicioWeb : geoportalServiciosWeb){
            ServicioWeb servicioWeb = geoportalServicioWeb.getServicioWeb();
            serviciosWeb.add(servicioWeb);
          }
          uiModel.addAttribute("serviciosweb", serviciosWeb);
        }

        ConfVistasPredefinidas confVistasPredefinidas = new ConfVistasPredefinidas();
        populateEditForm(uiModel,confVistasPredefinidas);

        return "confvistaspredefinidases/listComponents";
    }

    @RequestMapping(headers = "Accept=application/json", value = "createOnLine", produces = "application/json")
    @ResponseBody
    @Transactional
    public JsonResponse<List<ConfVistasPredefinidas>> createOnLine(@RequestParam("geoPortal") Long geoPortalId,
                                              @RequestParam(value="serviciosWeb[]", required = false)  Long[] ids,
                                              @RequestParam("nombre") String nombre,
                                              @RequestParam("logo") byte[] logo) {

       JsonResponse<List<ConfVistasPredefinidas>> jsonResponse = new JsonResponse<List<ConfVistasPredefinidas>>();
       ConfVistasPredefinidas confVistasPredefinidas =  new ConfVistasPredefinidas();
        try {
          confVistasPredefinidas.setNombre(nombre);
          confVistasPredefinidas.setTipo(TipoComponente.vistas_predefinidas);

          GeoPortal geoPortal = GeoPortal.findGeoPortal(geoPortalId);
          confVistasPredefinidas.setGeoPortal(geoPortal);

          Set<ServicioWeb> serviciosWebs = new HashSet<ServicioWeb>();
          List<Long> serviciosWebIds = Arrays.asList(ids);
          for (Long servicioWebId : serviciosWebIds) {
            ServicioWeb servicioWeb =  ServicioWeb.findServicioWeb(servicioWebId);
            serviciosWebs.add(servicioWeb);
          }
          confVistasPredefinidas.setServiciosWeb(serviciosWebs);

          confVistasPredefinidas.setLogo(logo);
          confVistasPredefinidasService.saveConfVistasPredefinidas(confVistasPredefinidas);
        }
        catch (Exception ex) {
            jsonResponse.setStatus("ERROR");
            jsonResponse.setExceptionMessage(ex.getLocalizedMessage());
            return jsonResponse;
        }

        jsonResponse.setStatus("SUCCESS");
        return jsonResponse;

    }


}
