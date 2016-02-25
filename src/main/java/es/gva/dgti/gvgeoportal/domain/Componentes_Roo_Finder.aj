// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package es.gva.dgti.gvgeoportal.domain;

import es.gva.dgti.gvgeoportal.domain.Componentes;
import es.gva.dgti.gvgeoportal.domain.GeoPortal;
import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

privileged aspect Componentes_Roo_Finder {
    
    public static Long Componentes.countFindComponentesesByGeoPortal(GeoPortal geoPortal) {
        if (geoPortal == null) throw new IllegalArgumentException("The geoPortal argument is required");
        EntityManager em = Componentes.entityManager();
        TypedQuery q = em.createQuery("SELECT COUNT(o) FROM Componentes AS o WHERE o.geoPortal = :geoPortal", Long.class);
        q.setParameter("geoPortal", geoPortal);
        return ((Long) q.getSingleResult());
    }
    
    public static TypedQuery<Componentes> Componentes.findComponentesesByGeoPortal(GeoPortal geoPortal, String sortFieldName, String sortOrder) {
        if (geoPortal == null) throw new IllegalArgumentException("The geoPortal argument is required");
        EntityManager em = Componentes.entityManager();
        StringBuilder queryBuilder = new StringBuilder("SELECT o FROM Componentes AS o WHERE o.geoPortal = :geoPortal");
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            queryBuilder.append(" ORDER BY ").append(sortFieldName);
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                queryBuilder.append(" ").append(sortOrder);
            }
        }
        TypedQuery<Componentes> q = em.createQuery(queryBuilder.toString(), Componentes.class);
        q.setParameter("geoPortal", geoPortal);
        return q;
    }
    
}
