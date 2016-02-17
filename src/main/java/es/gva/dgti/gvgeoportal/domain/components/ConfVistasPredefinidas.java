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
package es.gva.dgti.gvgeoportal.domain.components;
import java.util.HashSet;
import java.util.Set;

import es.gva.dgti.gvgeoportal.domain.Componentes;
import es.gva.dgti.gvgeoportal.domain.ServicioWeb;

import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Transient;
import javax.validation.constraints.NotNull;

import org.gvnix.addon.jpa.annotations.audit.GvNIXJpaAudit;
import org.hibernate.validator.constraints.NotEmpty;

@RooJavaBean
@RooToString
@RooJpaActiveRecord(finders = { "findConfVistasPredefinidasesByGeoPortal" })
@GvNIXJpaAudit
public class ConfVistasPredefinidas extends Componentes {

    /**
     */
    @NotNull
    @NotEmpty
    private String nombre;

    private byte[] logo;

    @Transient
    private String logoString;

    @ManyToMany(cascade = { javax.persistence.CascadeType.PERSIST, javax.persistence.CascadeType.MERGE })
    @JoinTable(name = "vistas_predefinidas_servicio_web")
    private Set<ServicioWeb> serviciosWeb = new HashSet<ServicioWeb>();

    @Transient
    private String serviciosWebString;

    /**
     * @return el valor de la variable logoString.
     */
    public String getLogoString() {
        if (logo == null) {
            return this.logoString;
        } else {
            return new String(this.logo);
        }
    }

    /**
     * @return el valor de la variable serviciosWebString.
     */
    public String getServiciosWebString() {
      String swString ="";
      if (!serviciosWeb.isEmpty()) {
          for(ServicioWeb servicioWeb : serviciosWeb){
            if(swString == ""){
              swString = servicioWeb.getDescripcion();
            }
            else{
              swString = swString + ", " + servicioWeb.getDescripcion();
            }
          }
      }
      return swString;
    }
}
