// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package es.gva.dgti.gvgeoportal.domain;

import es.gva.dgti.gvgeoportal.domain.Componentes;
import es.gva.dgti.gvgeoportal.domain.ComponentesDataOnDemand;
import es.gva.dgti.gvgeoportal.domain.GeoPortalDataOnDemand;
import es.gva.dgti.gvgeoportal.domain.enumerated.TipoComponente;
import es.gva.dgti.gvgeoportal.service.domain.ComponentesService;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

privileged aspect ComponentesDataOnDemand_Roo_DataOnDemand {
    
    declare @type: ComponentesDataOnDemand: @Component;
    
    private Random ComponentesDataOnDemand.rnd = new SecureRandom();
    
    private List<Componentes> ComponentesDataOnDemand.data;
    
    @Autowired
    GeoPortalDataOnDemand ComponentesDataOnDemand.geoPortalDataOnDemand;
    
    @Autowired
    ComponentesService ComponentesDataOnDemand.componentesService;
    
    public Componentes ComponentesDataOnDemand.getNewTransientComponentes(int index) {
        Componentes obj = new Componentes();
        setAuditCreatedBy(obj, index);
        setAuditCreation(obj, index);
        setAuditLastUpdate(obj, index);
        setAuditLastUpdatedBy(obj, index);
        setTipo(obj, index);
        return obj;
    }
    
    public void ComponentesDataOnDemand.setAuditCreatedBy(Componentes obj, int index) {
        String auditCreatedBy = "auditCreatedBy_" + index;
        obj.setAuditCreatedBy(auditCreatedBy);
    }
    
    public void ComponentesDataOnDemand.setAuditCreation(Componentes obj, int index) {
        Calendar auditCreation = Calendar.getInstance();
        obj.setAuditCreation(auditCreation);
    }
    
    public void ComponentesDataOnDemand.setAuditLastUpdate(Componentes obj, int index) {
        Calendar auditLastUpdate = Calendar.getInstance();
        obj.setAuditLastUpdate(auditLastUpdate);
    }
    
    public void ComponentesDataOnDemand.setAuditLastUpdatedBy(Componentes obj, int index) {
        String auditLastUpdatedBy = "auditLastUpdatedBy_" + index;
        obj.setAuditLastUpdatedBy(auditLastUpdatedBy);
    }
    
    public void ComponentesDataOnDemand.setTipo(Componentes obj, int index) {
        TipoComponente tipo = TipoComponente.class.getEnumConstants()[0];
        obj.setTipo(tipo);
    }
    
    public Componentes ComponentesDataOnDemand.getSpecificComponentes(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        Componentes obj = data.get(index);
        Long id = obj.getId();
        return componentesService.findComponentes(id);
    }
    
    public Componentes ComponentesDataOnDemand.getRandomComponentes() {
        init();
        Componentes obj = data.get(rnd.nextInt(data.size()));
        Long id = obj.getId();
        return componentesService.findComponentes(id);
    }
    
    public boolean ComponentesDataOnDemand.modifyComponentes(Componentes obj) {
        return false;
    }
    
    public void ComponentesDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = componentesService.findComponentesEntries(from, to);
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'Componentes' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<Componentes>();
        for (int i = 0; i < 10; i++) {
            Componentes obj = getNewTransientComponentes(i);
            try {
                componentesService.saveComponentes(obj);
            } catch (final ConstraintViolationException e) {
                final StringBuilder msg = new StringBuilder();
                for (Iterator<ConstraintViolation<?>> iter = e.getConstraintViolations().iterator(); iter.hasNext();) {
                    final ConstraintViolation<?> cv = iter.next();
                    msg.append("[").append(cv.getRootBean().getClass().getName()).append(".").append(cv.getPropertyPath()).append(": ").append(cv.getMessage()).append(" (invalid value = ").append(cv.getInvalidValue()).append(")").append("]");
                }
                throw new IllegalStateException(msg.toString(), e);
            }
            obj.flush();
            data.add(obj);
        }
    }
    
}
