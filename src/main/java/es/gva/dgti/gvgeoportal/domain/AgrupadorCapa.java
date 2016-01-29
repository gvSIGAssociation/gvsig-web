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
package es.gva.dgti.gvgeoportal.domain;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.OrderBy;
import javax.persistence.SequenceGenerator;
import javax.validation.constraints.NotNull;

import org.gvnix.addon.jpa.annotations.audit.GvNIXJpaAudit;
import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.plural.RooPlural;
import org.springframework.roo.addon.tostring.RooToString;

import es.gva.dgti.gvgeoportal.domain.components.ConfCapasTematicas;
import es.gva.dgti.gvgeoportal.domain.components.ConfVistasPredefinidas;

@RooJavaBean
@RooToString
@RooJpaActiveRecord(sequenceName = "agrupador_capa_id_seq",
        identifierField = "id")
@RooPlural("AgrupadorCapas")
@GvNIXJpaAudit
public class AgrupadorCapa {

    /**
     */
    @NotNull
    @NotEmpty
    private String nombre;

    /**
     */
    @NotNull
    @NotEmpty
    private String descripcion;

    @Id
    @SequenceGenerator(name = "agrupadorCapaGen",
            sequenceName = "agrupador_capa_id_seq")
    @GeneratedValue(strategy = GenerationType.AUTO,
            generator = "agrupadorCapaGen")
    @Column(name = "id")
    private Long id;

    public String toString() {
        return this.nombre;
    }

    /**
     */
    @ManyToMany(cascade = CascadeType.ALL, mappedBy = "agrupadorCapa")
    private Set<GeoPortal> geoPortal = new HashSet<GeoPortal>();

    /**
     */
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "agrupador")
    @OrderBy("id ASC")
    private Set<AgrupadorCapaServicioWeb> servicios = new HashSet<AgrupadorCapaServicioWeb>();

    /**
     */
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "grupo")
    private Set<ConfCapasTematicas> confCapasTematicas = new HashSet<ConfCapasTematicas>();

    /**
     */
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "grupo")
    private Set<ConfVistasPredefinidas> confVistasPredefinidas = new HashSet<ConfVistasPredefinidas>();

}
