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

import javax.persistence.EntityManager;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.ManyToOne;
import javax.persistence.TypedQuery;
import javax.validation.constraints.NotNull;

import org.gvnix.addon.jpa.annotations.audit.GvNIXJpaAudit;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

import es.gva.dgti.gvgeoportal.domain.enumerated.TipoComponente;

@RooJavaBean
@RooToString
@GvNIXJpaAudit
@RooJpaActiveRecord(sequenceName = "componentes_id_seq", identifierField = "id", inheritanceType = "JOINED", finders = { "findComponentesesByGeoPortal" })
public class Componentes {

  @ManyToOne
  private GeoPortal geoPortal;

  @NotNull
  @Enumerated(EnumType.STRING)
  private TipoComponente tipo;

  /**
   * Devuelve la petición para obtener los componentes activados para un
   * geoportal específico.
   *
   * @param geoPortal el GeoPortal.
   * @return la petición (<i>query</i>).
   */
  public static TypedQuery<Componentes> findComponentesesByGeoPortal(GeoPortal geoPortal) {
    if (geoPortal == null){
        throw new IllegalArgumentException("The geoPortal argument is required");
    }
    EntityManager em = Componentes.entityManager();
    TypedQuery<Componentes> q = em.createQuery(
        "SELECT o FROM Componentes AS o WHERE o.geoPortal = :geoPortal",
        Componentes.class);
    q.setParameter("geoPortal", geoPortal);
    return q;
  }
}
