// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package es.gva.dgti.gvgeoportal.domain;

import es.gva.dgti.gvgeoportal.domain.GeoPortal;
import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

privileged aspect GeoPortal_Roo_Finder {
    
    public static Long GeoPortal.countFindGeoPortalesByTituloLike(String titulo) {
        if (titulo == null || titulo.length() == 0) throw new IllegalArgumentException("The titulo argument is required");
        titulo = titulo.replace('*', '%');
        if (titulo.charAt(0) != '%') {
            titulo = "%" + titulo;
        }
        if (titulo.charAt(titulo.length() - 1) != '%') {
            titulo = titulo + "%";
        }
        EntityManager em = GeoPortal.entityManager();
        TypedQuery q = em.createQuery("SELECT COUNT(o) FROM GeoPortal AS o WHERE LOWER(o.titulo) LIKE LOWER(:titulo)", Long.class);
        q.setParameter("titulo", titulo);
        return ((Long) q.getSingleResult());
    }
    
    public static Long GeoPortal.countFindGeoPortalesByUrlEquals(String url) {
        if (url == null || url.length() == 0) throw new IllegalArgumentException("The url argument is required");
        EntityManager em = GeoPortal.entityManager();
        TypedQuery q = em.createQuery("SELECT COUNT(o) FROM GeoPortal AS o WHERE o.url = :url", Long.class);
        q.setParameter("url", url);
        return ((Long) q.getSingleResult());
    }
    
    public static TypedQuery<GeoPortal> GeoPortal.findGeoPortalesByTituloLike(String titulo) {
        if (titulo == null || titulo.length() == 0) throw new IllegalArgumentException("The titulo argument is required");
        titulo = titulo.replace('*', '%');
        if (titulo.charAt(0) != '%') {
            titulo = "%" + titulo;
        }
        if (titulo.charAt(titulo.length() - 1) != '%') {
            titulo = titulo + "%";
        }
        EntityManager em = GeoPortal.entityManager();
        TypedQuery<GeoPortal> q = em.createQuery("SELECT o FROM GeoPortal AS o WHERE LOWER(o.titulo) LIKE LOWER(:titulo)", GeoPortal.class);
        q.setParameter("titulo", titulo);
        return q;
    }
    
    public static TypedQuery<GeoPortal> GeoPortal.findGeoPortalesByTituloLike(String titulo, String sortFieldName, String sortOrder) {
        if (titulo == null || titulo.length() == 0) throw new IllegalArgumentException("The titulo argument is required");
        titulo = titulo.replace('*', '%');
        if (titulo.charAt(0) != '%') {
            titulo = "%" + titulo;
        }
        if (titulo.charAt(titulo.length() - 1) != '%') {
            titulo = titulo + "%";
        }
        EntityManager em = GeoPortal.entityManager();
        StringBuilder queryBuilder = new StringBuilder("SELECT o FROM GeoPortal AS o WHERE LOWER(o.titulo) LIKE LOWER(:titulo)");
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            queryBuilder.append(" ORDER BY ").append(sortFieldName);
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                queryBuilder.append(" ").append(sortOrder);
            }
        }
        TypedQuery<GeoPortal> q = em.createQuery(queryBuilder.toString(), GeoPortal.class);
        q.setParameter("titulo", titulo);
        return q;
    }
    
    public static TypedQuery<GeoPortal> GeoPortal.findGeoPortalesByUrlEquals(String url) {
        if (url == null || url.length() == 0) throw new IllegalArgumentException("The url argument is required");
        EntityManager em = GeoPortal.entityManager();
        TypedQuery<GeoPortal> q = em.createQuery("SELECT o FROM GeoPortal AS o WHERE o.url = :url", GeoPortal.class);
        q.setParameter("url", url);
        return q;
    }
    
    public static TypedQuery<GeoPortal> GeoPortal.findGeoPortalesByUrlEquals(String url, String sortFieldName, String sortOrder) {
        if (url == null || url.length() == 0) throw new IllegalArgumentException("The url argument is required");
        EntityManager em = GeoPortal.entityManager();
        StringBuilder queryBuilder = new StringBuilder("SELECT o FROM GeoPortal AS o WHERE o.url = :url");
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            queryBuilder.append(" ORDER BY ").append(sortFieldName);
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                queryBuilder.append(" ").append(sortOrder);
            }
        }
        TypedQuery<GeoPortal> q = em.createQuery(queryBuilder.toString(), GeoPortal.class);
        q.setParameter("url", url);
        return q;
    }
    
}
