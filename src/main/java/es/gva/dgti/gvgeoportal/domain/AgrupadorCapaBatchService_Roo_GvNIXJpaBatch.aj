// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package es.gva.dgti.gvgeoportal.domain;

import com.mysema.query.BooleanBuilder;
import com.mysema.query.jpa.impl.JPAQuery;
import com.mysema.query.types.path.PathBuilder;
import es.gva.dgti.gvgeoportal.domain.AgrupadorCapa;
import es.gva.dgti.gvgeoportal.domain.AgrupadorCapaBatchService;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;
import org.springframework.transaction.annotation.Transactional;

privileged aspect AgrupadorCapaBatchService_Roo_GvNIXJpaBatch {
    
    public Class AgrupadorCapaBatchService.getEntity() {
        return AgrupadorCapa.class;
    }
    
    public EntityManager AgrupadorCapaBatchService.entityManager() {
        return AgrupadorCapa.entityManager();
    }
    
    @Transactional
    public int AgrupadorCapaBatchService.deleteAll() {
        TypedQuery<AgrupadorCapa> query = entityManager().createQuery("Select o FROM AgrupadorCapa o", AgrupadorCapa.class);
        List<AgrupadorCapa> agrupadorCapas = query.getResultList();
        delete(agrupadorCapas);
        return agrupadorCapas.size();
    }
    
    @Transactional
    public int AgrupadorCapaBatchService.deleteIn(List<Long> ids) {
        TypedQuery<AgrupadorCapa> query = entityManager().createQuery("SELECT o FROM AgrupadorCapa o WHERE o.id IN (:idList)", AgrupadorCapa.class);
        query.setParameter("idList", ids);
        List<AgrupadorCapa> agrupadorCapas = query.getResultList();
        delete(agrupadorCapas);
        return agrupadorCapas.size();
    }
    
    @Transactional
    public int AgrupadorCapaBatchService.deleteNotIn(List<Long> ids) {
        TypedQuery<AgrupadorCapa> query = entityManager().createQuery("SELECT o FROM AgrupadorCapa o WHERE o.id NOT IN (:idList)", AgrupadorCapa.class);
        query.setParameter("idList", ids);
        List<AgrupadorCapa> agrupadorCapas = query.getResultList();
        delete(agrupadorCapas);
        return agrupadorCapas.size();
    }
    
    @Transactional
    public void AgrupadorCapaBatchService.create(List<AgrupadorCapa> agrupadorCapas) {
        for( AgrupadorCapa agrupadorcapa : agrupadorCapas) {
            agrupadorcapa.persist();
        }
    }
    
    @Transactional
    public List<AgrupadorCapa> AgrupadorCapaBatchService.update(List<AgrupadorCapa> agrupadorcapas) {
        List<AgrupadorCapa> merged = new ArrayList<AgrupadorCapa>();
        for( AgrupadorCapa agrupadorcapa : agrupadorcapas) {
            merged.add( agrupadorcapa.merge() );
        }
        return merged;
    }
    
    public List<AgrupadorCapa> AgrupadorCapaBatchService.findByValues(Map<String, Object> propertyValues) {
        
        // if there is a filter
        if (propertyValues != null && !propertyValues.isEmpty()) {
            // Prepare a predicate
            BooleanBuilder baseFilterPredicate = new BooleanBuilder();
            
            // Base filter. Using BooleanBuilder, a cascading builder for
            // Predicate expressions
            PathBuilder<AgrupadorCapa> entity = new PathBuilder<AgrupadorCapa>(AgrupadorCapa.class, "entity");
            
            // Build base filter
            for (String key : propertyValues.keySet()) {
                baseFilterPredicate.and(entity.get(key).eq(propertyValues.get(key)));
            }
            
            // Create a query with filter
            JPAQuery query = new JPAQuery(AgrupadorCapa.entityManager());
            query = query.from(entity);
            
            // execute query
            return query.where(baseFilterPredicate).list(entity);
        }
        
        // no filter: return all elements
        return AgrupadorCapa.findAllAgrupadorCapas();
    }
    
    @Transactional
    public long AgrupadorCapaBatchService.deleteByValues(Map<String, Object> propertyValues) {
        List<AgrupadorCapa> agrupadorCapas = findByValues(propertyValues);
        delete(agrupadorCapas);
        return (long)agrupadorCapas.size();
    }
    
    @Transactional
    public void AgrupadorCapaBatchService.delete(List<AgrupadorCapa> agrupadorcapas) {
        for( AgrupadorCapa agrupadorcapa : agrupadorcapas) {
            agrupadorcapa.remove();
        }
    }
    
}
