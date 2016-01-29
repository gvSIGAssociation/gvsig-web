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
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.ManyToOne;
import javax.persistence.TypedQuery;
import javax.validation.constraints.NotNull;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;
import org.gvnix.addon.jpa.annotations.audit.GvNIXJpaAudit;

@RooJavaBean
@RooToString
@RooJpaActiveRecord(identifierField = "id")
@GvNIXJpaAudit
public class AgrupadorCapaServicioWeb {

    /**
     */
    @NotNull
    @ManyToOne
    private AgrupadorCapa agrupador;

    /**
     */
    @NotNull
    @ManyToOne
    private ServicioWeb servicioWeb;

    /**
     */
    public String toString() {
        return agrupador.getNombre().concat("-")
                .concat(servicioWeb.getNombre());
    }

    /**
     * Devuelve una consulta para localizar los {@link ServicioWeb} que están en
     * el agrupador de capa indicado.
     *
     * @param agrupadorCapaId identificador del agrupador de capa por el que se
     *        quiere filtrar
     * @return la consulta
     */
    public static TypedQuery<Long> findServicesByGroup(Long agrupadorCapaId) {
        if (agrupadorCapaId == null) {
            throw new IllegalArgumentException(
                    "The agrupadorCapaId argument is required");
        }
        EntityManager em = AgrupadorCapaServicioWeb.entityManager();
        TypedQuery<Long> q = em
                .createQuery(
                        "SELECT DISTINCT(servicioWeb.id) FROM AgrupadorCapaServicioWeb WHERE agrupador.id= :agrupadorCapaId",
                        Long.class);
        q.setParameter("agrupadorCapaId", agrupadorCapaId);
        return q;
    }

    /**
     * Devuelve una consulta para localizar los {@link AgrupadorCapaServicioWeb}
     * que tienen el el agrupador de capa indicado.
     *
     * @param agrupadorCapa agrupador de capa por el que se quiere filtrar
     * @return la consulta
     */
    public static TypedQuery<AgrupadorCapaServicioWeb> findAgrupadorCapaServicioWebByGroup(
            AgrupadorCapa agrupadorCapa) {
        if (agrupadorCapa == null) {
            throw new IllegalArgumentException(
                    "The agrupadorCapa argument is required");
        }
        EntityManager em = AgrupadorCapaServicioWeb.entityManager();
        TypedQuery<AgrupadorCapaServicioWeb> q = em
                .createQuery(
                        "SELECT o FROM AgrupadorCapaServicioWeb o WHERE agrupador= :agrupadorCapa",
                        AgrupadorCapaServicioWeb.class);
        q.setParameter("agrupadorCapa", agrupadorCapa);
        return q;
    }

    /**
     * Devuelve una consulta para localizar los {@link AgrupadorCapaServicioWeb}
     * que están en la lista de ids (idList) pasada.
     *
     * @param idList la lista de ids de los {@link AgrupadorCapaServicioWeb}.
     * @return la consulta
     */
    public static TypedQuery<AgrupadorCapaServicioWeb> findAgrupadorCapaServicioWebInIdList(
            List<Long> idList) {
        if (idList == null) {
            throw new IllegalArgumentException(
                    "The idList argument is required");
        }
        EntityManager em = AgrupadorCapaServicioWeb.entityManager();
        TypedQuery<AgrupadorCapaServicioWeb> q = em
                .createQuery(
                        "SELECT o FROM AgrupadorCapaServicioWeb AS o WHERE id IN (:idList)",
                        AgrupadorCapaServicioWeb.class);
        q.setParameter("idList", idList);
        return q;
    }

    /**
     * Devuelve una consulta para localizar los {@link AgrupadorCapaServicioWeb}
     * que no están en la lista de ids (idList) pasada y con el agrupador de
     * capa indicado.
     *
     * @param idList la lista de ids de los {@link AgrupadorCapaServicioWeb}.
     * @param agrupadorCapa agrupador de capa por el que se quiere filtrar.
     * @return la consulta
     */
    public static TypedQuery<AgrupadorCapaServicioWeb> findAgrupadorCapaServicioWebNotInIdListAndGroup(
            List<Long> idList, AgrupadorCapa agrupadorCapa) {
        if (idList == null) {
            throw new IllegalArgumentException(
                    "The idList argument is required");
        }
        if (agrupadorCapa == null) {
            throw new IllegalArgumentException(
                    "The idList agrupadorCapa is required");
        }
        EntityManager em = AgrupadorCapaServicioWeb.entityManager();
        TypedQuery<AgrupadorCapaServicioWeb> q = em
                .createQuery(
                        "SELECT o FROM AgrupadorCapaServicioWeb AS o WHERE id NOT IN (:idList) AND agrupador = :agrupadorCapa",
                        AgrupadorCapaServicioWeb.class);
        q.setParameter("idList", idList);
        q.setParameter("agrupadorCapa", agrupadorCapa);
        return q;
    }

}
