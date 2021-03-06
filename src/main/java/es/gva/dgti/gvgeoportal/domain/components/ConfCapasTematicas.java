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
import javax.persistence.ManyToOne;
import javax.persistence.Transient;
import javax.validation.constraints.NotNull;

import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

import es.gva.dgti.gvgeoportal.domain.AgrupadorCapa;
import es.gva.dgti.gvgeoportal.domain.Componentes;

import org.gvnix.addon.jpa.annotations.audit.GvNIXJpaAudit;
import org.hibernate.validator.constraints.NotEmpty;

@RooJavaBean
@RooToString
@RooJpaActiveRecord(finders = { "findConfCapasTematicasesByGeoPortal" })
@GvNIXJpaAudit
public class ConfCapasTematicas extends Componentes {

    /**
     */
    @NotNull
    @NotEmpty
    private String nombre;

    /**
     */
    @ManyToOne
    private AgrupadorCapa grupo;

    private byte[] logo;

    @Transient
    private String logoString;

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
}
