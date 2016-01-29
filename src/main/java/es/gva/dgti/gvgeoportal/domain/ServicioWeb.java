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
import java.util.List;
import java.util.Set;

import javax.persistence.CollectionTable;
import javax.persistence.Column;
import javax.persistence.ElementCollection;
import javax.persistence.Embeddable;
import javax.persistence.EntityManager;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.SequenceGenerator;
import javax.persistence.Transient;
import javax.persistence.TypedQuery;
import javax.validation.constraints.NotNull;

import org.gvnix.addon.jpa.annotations.audit.GvNIXJpaAudit;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.plural.RooPlural;
import org.springframework.roo.addon.tostring.RooToString;

import es.gva.dgti.gvgeoportal.domain.enumerated.TipoServicio;

@RooJavaBean
@RooToString
@RooPlural("ServiciosWeb")
@GvNIXJpaAudit
@RooJpaActiveRecord(sequenceName = "servicio_web_id_seq",
        identifierField = "id")
public class ServicioWeb {

    @Id
    @SequenceGenerator(name = "servicioWebGen",
            sequenceName = "servicio_web_id_seq")
    @GeneratedValue(strategy = GenerationType.AUTO,
            generator = "servicioWebGen")
    @Column(name = "id")
    private Long id;

    @NotNull
    private String nombre;

    private String descripcion;

    @NotNull
    private String url;

    private String versionProtocolo;

    @NotNull
    @Enumerated(EnumType.STRING)
    private TipoServicio tipo;

    @ManyToMany(cascade = { javax.persistence.CascadeType.PERSIST,
            javax.persistence.CascadeType.MERGE })
    @JoinTable(name = "coordenadas_servicio_web")
    private Set<SistemaCoordenadas> coordenadas = new HashSet<SistemaCoordenadas>();

    private String formatoImagen;

    @Transient
    private String nombresCapas;

    @Transient
    private String estilosCapas;

    private String tileMatrixSet;

    @Embeddable
    public static class CapasServicioWeb {

        private String nombreCapa;
        private String tituloCapa;
        private String estiloCapa;

        /**
         * Constructor vacio
         */
        public CapasServicioWeb() {}

        public CapasServicioWeb(String nombreCapa, String tituloCapa, String estiloCapa) {
            this.nombreCapa = nombreCapa;
            this.tituloCapa = tituloCapa;
            this.estiloCapa = estiloCapa;
        }

        public String getNombreCapa() {
            return nombreCapa;
        }

        public void setNombreCapa(String nombreCapa) {
            this.nombreCapa = nombreCapa;
        }

        public String getTituloCapa() {
            return tituloCapa;
        }

        public void setTituloCapa(String tituloCapa) {
            this.tituloCapa = tituloCapa;
        }

        public String getEstiloCapa() {
            return estiloCapa;
        }

        public void setEstiloCapa(String estiloCapa) {
            this.estiloCapa = estiloCapa;
        }
    }

    @ElementCollection
    @CollectionTable(name = "CapasServicioWeb",
            joinColumns = @JoinColumn(name = "ID_CAPA_SERVICIO_WEB"))
    private Set<CapasServicioWeb> capasServicioWeb = new HashSet<CapasServicioWeb>();

    public String toString() {
        return this.nombre;
    }

    /**
     * Devuelve una consulta para localizar los {@link ServicioWeb} que no están
     * en el agrupador de capa indicado.
     *
     * @param agrupadorCapa agrupador de capa por el que se quiere filtrar
     * @return la consulta
     */
    public static TypedQuery<ServicioWeb> findServicesByNoGroup(
            AgrupadorCapa agrupadorCapa) {
        if (agrupadorCapa == null) {
            throw new IllegalArgumentException(
                    "The agrupadorCapa argument is required");
        }
        EntityManager em = ServicioWeb.entityManager();
        TypedQuery<ServicioWeb> q = em
                .createQuery(
                        "SELECT sw FROM ServicioWeb sw WHERE id NOT IN (SELECT DISTINCT servicioWeb FROM AgrupadorCapaServicioWeb where agrupador= :agrupadorCapa)",
                        ServicioWeb.class);
        q.setParameter("agrupadorCapa", agrupadorCapa);
        return q;
    }

    /**
     * Devuelve una consulta para localizar los {@link ServicioWeb} que están en
     * la lista de ids (idList) pasada.
     *
     * @param idList la lista de ids de los servicios.
     * @return la consulta
     */
    public static TypedQuery<ServicioWeb> findServicesInIdList(List<Long> idList) {
        if (idList == null) {
            throw new IllegalArgumentException(
                    "The idList argument is required");
        }
        EntityManager em = ServicioWeb.entityManager();
        TypedQuery<ServicioWeb> q = em.createQuery(
                "SELECT o FROM ServicioWeb AS o WHERE id IN (:idList)",
                ServicioWeb.class);
        q.setParameter("idList", idList);

        return q;
    }

    /**
     * Devuelve una consulta para localizar los {@link ServicioWeb} que no están
     * en la lista de ids (idList) pasada y en agrupador indicado.
     *
     * @param idList la lista de ids de los servicios.
     * @param agrupadorCapa el {@code AgrupadorCapa}.
     * @return la consulta
     */
    public static TypedQuery<ServicioWeb> findServicesNotInIdListAndNoGroup(
            List<Long> idList, AgrupadorCapa agrupadorCapa) {
        if (idList == null) {
            throw new IllegalArgumentException(
                    "The idList argument is required");
        }
        if (agrupadorCapa == null) {
            throw new IllegalArgumentException(
                    "The agrupadorCapa argument is required");
        }
        EntityManager em = ServicioWeb.entityManager();
        TypedQuery<ServicioWeb> q = em
                .createQuery(
                        "SELECT sw FROM ServicioWeb sw WHERE id NOT IN (SELECT DISTINCT servicioWeb FROM AgrupadorCapaServicioWeb where agrupador= :agrupadorCapa) AND id NOT IN (:idList)",
                        ServicioWeb.class);
        q.setParameter("idList", idList);
        q.setParameter("agrupadorCapa", agrupadorCapa);
        return q;
    }

}
