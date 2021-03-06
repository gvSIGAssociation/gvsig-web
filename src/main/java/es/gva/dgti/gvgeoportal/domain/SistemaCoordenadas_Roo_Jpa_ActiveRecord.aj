// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package es.gva.dgti.gvgeoportal.domain;

import es.gva.dgti.gvgeoportal.domain.SistemaCoordenadas;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.transaction.annotation.Transactional;

privileged aspect SistemaCoordenadas_Roo_Jpa_ActiveRecord {
    
    @PersistenceContext
    transient EntityManager SistemaCoordenadas.entityManager;
    
    public static final List<String> SistemaCoordenadas.fieldNames4OrderClauseFilter = java.util.Arrays.asList("codigo", "nombre", "descripcion", "serviciosWeb");
    
    public static final EntityManager SistemaCoordenadas.entityManager() {
        EntityManager em = new SistemaCoordenadas().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long SistemaCoordenadas.countSistemaCoordenadas() {
        return entityManager().createQuery("SELECT COUNT(o) FROM SistemaCoordenadas o", Long.class).getSingleResult();
    }
    
    public static List<SistemaCoordenadas> SistemaCoordenadas.findAllSistemaCoordenadas() {
        return entityManager().createQuery("SELECT o FROM SistemaCoordenadas o", SistemaCoordenadas.class).getResultList();
    }
    
    public static List<SistemaCoordenadas> SistemaCoordenadas.findAllSistemaCoordenadas(String sortFieldName, String sortOrder) {
        String jpaQuery = "SELECT o FROM SistemaCoordenadas o";
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            jpaQuery = jpaQuery + " ORDER BY " + sortFieldName;
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                jpaQuery = jpaQuery + " " + sortOrder;
            }
        }
        return entityManager().createQuery(jpaQuery, SistemaCoordenadas.class).getResultList();
    }
    
    public static SistemaCoordenadas SistemaCoordenadas.findSistemaCoordenadas(Long id) {
        if (id == null) return null;
        return entityManager().find(SistemaCoordenadas.class, id);
    }
    
    public static List<SistemaCoordenadas> SistemaCoordenadas.findSistemaCoordenadasEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM SistemaCoordenadas o", SistemaCoordenadas.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    public static List<SistemaCoordenadas> SistemaCoordenadas.findSistemaCoordenadasEntries(int firstResult, int maxResults, String sortFieldName, String sortOrder) {
        String jpaQuery = "SELECT o FROM SistemaCoordenadas o";
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            jpaQuery = jpaQuery + " ORDER BY " + sortFieldName;
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                jpaQuery = jpaQuery + " " + sortOrder;
            }
        }
        return entityManager().createQuery(jpaQuery, SistemaCoordenadas.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public void SistemaCoordenadas.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void SistemaCoordenadas.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            SistemaCoordenadas attached = SistemaCoordenadas.findSistemaCoordenadas(this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void SistemaCoordenadas.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void SistemaCoordenadas.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public SistemaCoordenadas SistemaCoordenadas.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        SistemaCoordenadas merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}
