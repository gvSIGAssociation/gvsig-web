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
import java.util.List;
import java.util.Set;

import javax.persistence.TypedQuery;

import es.gva.dgti.gvgeoportal.domain.GeoPortal;
import es.gva.dgti.gvgeoportal.domain.GeoportalServicioWeb;
import es.gva.dgti.gvgeoportal.domain.ServicioWeb;
import es.gva.dgti.gvgeoportal.domain.components.ConfVistasPredefinidas;
import es.gva.dgti.gvgeoportal.service.domain.ConfVistasPredefinidasService;

public class ConfVistasPredefinidasServiceImpl implements ConfVistasPredefinidasService {

    /*
     * (non-Javadoc)
     * @see es.gva.dgti.gvgeoportal.service.domain.ConfVistasPredefinidasService#findConfVistasPredefinidasesByGeoPortal(es.gva.dgti.gvgeoportal.domain.GeoPortal)
     */
    public List<ConfVistasPredefinidas> findConfVistasPredefinidasesByGeoPortal(GeoPortal geoPortal){
        List<ConfVistasPredefinidas> result = null;
        TypedQuery<ConfVistasPredefinidas> confVistasPredefinidasResult = null;
        confVistasPredefinidasResult = ConfVistasPredefinidas.findConfVistasPredefinidasesByGeoPortal(geoPortal);

        if (confVistasPredefinidasResult != null
                && confVistasPredefinidasResult.getResultList().size() > 0) {
            result = confVistasPredefinidasResult.getResultList();
        }

        return result;
    }

    public void deleteConfVistasPredefinidasServicioWebByGeoPortal(GeoportalServicioWeb geoPortalServicioWeb){

      ServicioWeb servicioWebToDelete = geoPortalServicioWeb.getServicioWeb();

      List<ConfVistasPredefinidas> listConfVistasPredefinidas = findConfVistasPredefinidasesByGeoPortal(geoPortalServicioWeb.getGeoportal());
      if(listConfVistasPredefinidas != null && listConfVistasPredefinidas.size() > 0){
    	  for(ConfVistasPredefinidas confVistasPredefinidas : listConfVistasPredefinidas){
    		  Set<ServicioWeb> serviciosWeb = confVistasPredefinidas.getServiciosWeb();
    		  if(serviciosWeb.contains(servicioWebToDelete)){
    			  serviciosWeb.remove(servicioWebToDelete);
    			  //if webservices from predefinied view is empty, delete the view
    			  if(serviciosWeb.isEmpty()){
    				  deleteConfVistasPredefinidas(confVistasPredefinidas);
    			  }
    			  else{
    				  //is not empty, delete only the web service
    				  confVistasPredefinidas.setServiciosWeb(serviciosWeb);
    				  saveConfVistasPredefinidas(confVistasPredefinidas);
    			  }
    		  }
    	  }
      }

    }
}
