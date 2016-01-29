// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package es.gva.dgti.gvgeoportal.domain.components;

import es.gva.dgti.gvgeoportal.domain.components.ConfVistasPredefinidas;
import java.util.List;
import org.springframework.transaction.annotation.Transactional;

privileged aspect ConfVistasPredefinidas_Roo_Jpa_ActiveRecord {
    
    public static final List<String> ConfVistasPredefinidas.fieldNames4OrderClauseFilter = java.util.Arrays.asList("nombre", "grupo");
    
    public static long ConfVistasPredefinidas.countConfVistasPredefinidases() {
        return entityManager().createQuery("SELECT COUNT(o) FROM ConfVistasPredefinidas o", Long.class).getSingleResult();
    }
    
    public static List<ConfVistasPredefinidas> ConfVistasPredefinidas.findAllConfVistasPredefinidases() {
        return entityManager().createQuery("SELECT o FROM ConfVistasPredefinidas o", ConfVistasPredefinidas.class).getResultList();
    }
    
    public static List<ConfVistasPredefinidas> ConfVistasPredefinidas.findAllConfVistasPredefinidases(String sortFieldName, String sortOrder) {
        String jpaQuery = "SELECT o FROM ConfVistasPredefinidas o";
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            jpaQuery = jpaQuery + " ORDER BY " + sortFieldName;
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                jpaQuery = jpaQuery + " " + sortOrder;
            }
        }
        return entityManager().createQuery(jpaQuery, ConfVistasPredefinidas.class).getResultList();
    }
    
    public static ConfVistasPredefinidas ConfVistasPredefinidas.findConfVistasPredefinidas(Long id) {
        if (id == null) return null;
        return entityManager().find(ConfVistasPredefinidas.class, id);
    }
    
    public static List<ConfVistasPredefinidas> ConfVistasPredefinidas.findConfVistasPredefinidasEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM ConfVistasPredefinidas o", ConfVistasPredefinidas.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    public static List<ConfVistasPredefinidas> ConfVistasPredefinidas.findConfVistasPredefinidasEntries(int firstResult, int maxResults, String sortFieldName, String sortOrder) {
        String jpaQuery = "SELECT o FROM ConfVistasPredefinidas o";
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            jpaQuery = jpaQuery + " ORDER BY " + sortFieldName;
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                jpaQuery = jpaQuery + " " + sortOrder;
            }
        }
        return entityManager().createQuery(jpaQuery, ConfVistasPredefinidas.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public ConfVistasPredefinidas ConfVistasPredefinidas.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        ConfVistasPredefinidas merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}
