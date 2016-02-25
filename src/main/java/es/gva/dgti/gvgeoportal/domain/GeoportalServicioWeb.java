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
import java.math.BigDecimal;
import javax.persistence.ManyToOne;
import javax.persistence.TypedQuery;
import javax.validation.constraints.NotNull;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;
import org.gvnix.addon.jpa.annotations.audit.GvNIXJpaAudit;

@RooJavaBean
@RooToString
@GvNIXJpaAudit
@RooJpaActiveRecord(identifierField = "id", finders = { "findGeoportalServicioWebsByGeoportal" })
public class GeoportalServicioWeb {

    /**
     */
    @NotNull
    @ManyToOne
    private GeoPortal geoportal;

    /**
     */
    @NotNull
    @ManyToOne
    private ServicioWeb servicioWeb;

    /**
     */
    @NotNull
    private BigDecimal opacidad;

    /**
     */
    @NotNull
    private boolean activo;

    /**
     */
    @NotNull
    private boolean habilitado;

    /**
     */
    @NotNull
    private Integer posicion;

    /**
     * Devuelve la consulta a base de datos necesaria para obtener las
     * relaciones entre geoportales y servicios web en base a un geoportal y
     * servicio web específicos.
     *
     * @param geoportal por el que se quiere filtrar
     * @param servicioWeb por el que se quiere filtrar
     * @return la consulta
     */
    public static TypedQuery<GeoportalServicioWeb> findGeoportalServicioWebByGeoportalAndServicioWeb(GeoPortal geoportal, ServicioWeb servicioWeb) {
        if (geoportal == null) {
            throw new IllegalArgumentException("The geoportal argument is required");
        }
        if (servicioWeb == null) {
            throw new IllegalArgumentException("The servicioWeb argument is required");
        }
        TypedQuery<GeoportalServicioWeb> q = entityManager().createQuery("SELECT o FROM GeoportalServicioWeb AS o WHERE o.geoportal = :geoportal AND o.servicioWeb = :servicioWeb", GeoportalServicioWeb.class);
        q.setParameter("geoportal", geoportal);
        q.setParameter("servicioWeb", servicioWeb);
        return q;
    }
}
