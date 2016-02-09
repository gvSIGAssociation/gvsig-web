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

import java.util.Calendar;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OrderBy;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;
import javax.persistence.TypedQuery;
import javax.validation.constraints.NotNull;

import org.gvnix.addon.jpa.annotations.audit.GvNIXJpaAudit;
import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.plural.RooPlural;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooPlural("GeoPortales")
@GvNIXJpaAudit
@RooJpaActiveRecord(sequenceName = "geoportal_id_seq",
        identifierField = "id",
        finders = { "findGeoPortalesByTituloLike", "findGeoPortalesByUrlEquals" })
public class GeoPortal {

    @NotNull
    @NotEmpty
    private String titulo;

    private String descripcion;

    private String subtitulo;

    private byte[] logo;

    @Transient
    private String logoString;

    private String alias;

    @NotNull
    private boolean publicado;

    private String centro;

    private Integer zoom;

    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(pattern = "dd/MM/yyyy")
    private Calendar fechaAlta;

    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(pattern = "dd/MM/yyyy")
    private Calendar fechaBaja;

    @ManyToMany(cascade = { javax.persistence.CascadeType.PERSIST,
            javax.persistence.CascadeType.MERGE })
    @JoinTable(name = "agrupador_capa_geo_portales")
    @OrderBy("id ASC")
    private Set<AgrupadorCapa> agrupadorCapa = new HashSet<AgrupadorCapa>();

    @OneToMany(cascade = CascadeType.ALL, mappedBy = "geoportal")
    @OrderBy("posicion ASC")
    private Set<GeoportalServicioWeb> serviciosToc = new HashSet<GeoportalServicioWeb>();

    @ManyToOne
    private SistemaCoordenadas coordenadas;

    @NotNull
    @NotEmpty
    @Column(unique = true)
    private String url;

    @Transient
    private String urlCompleta;


    /**
     * @return el valor de la variable logoString.
     */
    public String getLogoString() {
        if (logo == null) {
            return this.logoString;
        }
        else {
            return new String(this.logo);
        }
    }

    public String toString() {
        return titulo;
    }

    /**
     * Devuelve la consulta a base de datos necesaria para obtener geoportales
     * en base a su URL y a si están publicados o no.
     *
     * @param url
     * @param publicado
     * @return
     */
    public static TypedQuery<GeoPortal> findGeoportalesByUrlAndPublic(
            String url, boolean publicado) {
        if (url == null || url.length() == 0){
            throw new IllegalArgumentException("The url argument is required");
        }
        TypedQuery<GeoPortal> q = entityManager()
                .createQuery(
                        "SELECT o FROM GeoPortal AS o WHERE o.url = :url AND o.publicado = :publicado",
                        GeoPortal.class);
        q.setParameter("url", url);
        q.setParameter("publicado", publicado);
        return q;
    }

}
