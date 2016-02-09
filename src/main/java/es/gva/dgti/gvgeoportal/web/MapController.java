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

import java.lang.reflect.InvocationTargetException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.gvnix.addon.geo.annotations.GvNIXMapViewer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import es.gva.dgti.gvgeoportal.domain.GeoPortal;
import es.gva.dgti.gvgeoportal.security.ExtLoadWSS4JOutInterceptor;
import es.gva.dgti.gvgeoportal.security.SafeUser;
import es.gva.dgti.gvgeoportal.service.domain.GeoPortalService;
import es.gva.dgti.gvgeoportal.util.SecurityUtils;

@Controller
@RequestMapping("/map")
@GvNIXMapViewer(entityLayers = {}, projection = "EPSG3857")
public class MapController {

  private static final Logger LOGGER = Logger.getLogger(MapController.class);

  @Autowired(required = false)
  GeoPortalService geoportalService;

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
   * Muestra el geoportal indicado por url. Si el geoportal no existe muestra
   * una página de error.
   *
   * @param uiModel el {@code Model}.
   * @param request el {@code HttpServletRequest}.
   * @param url del geoportal que se quiere mostrar.
   * @return la cadena de representación de la ruta a la que redirige.
   */
  @RequestMapping(method = RequestMethod.GET, value = "/{url}")
  public String loadGeoPortalByUrl(Model uiModel, HttpServletRequest request,
                                   @PathVariable("url") String url) {

    //obtenemos en primer lugar si el usuario esta autenticado
    SafeUser safeUser = null;
    try {
        safeUser = SecurityUtils.getCurrentAuthentication();
    }catch(Exception ex){
        LOGGER.error("No se ha podido recuperar el usuario logeado.");
    }
    List<GeoPortal> geoportalList = null;
    //si el usuario esta logeado, obtenemos el portal sin tener en cuenta si esta publicado o no
    if(safeUser != null){
        geoportalList = geoportalService.findGeoPortalesByUrlEquals(url, "titulo", "ASC").getResultList();
    }else{
        geoportalList = geoportalService
                .findPublicGeoPortalesByUrlEquals(url).getResultList();
    }

    if (!geoportalList.isEmpty()) {
      GeoPortal geoportal = geoportalList.get(0);
      uiModel.addAllAttributes(geoportalService
          .getComponentsAndInformationByGeoportal(geoportal));
      //atributo para controlar si se muestra el titulo en el toc y el boton volver atras
      uiModel.addAttribute("isPublic", true);
      uiModel.addAttribute("cssPublicPortal", "publicPortal");
    }
    else {
      return "resourceNotFound";
    }
    return "map/showPublic";
  }

}
