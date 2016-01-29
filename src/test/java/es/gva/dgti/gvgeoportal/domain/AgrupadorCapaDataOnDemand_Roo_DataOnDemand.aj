// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package es.gva.dgti.gvgeoportal.domain;

import es.gva.dgti.gvgeoportal.domain.AgrupadorCapa;
import es.gva.dgti.gvgeoportal.domain.AgrupadorCapaDataOnDemand;
import es.gva.dgti.gvgeoportal.service.domain.AgrupadorCapaService;
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

privileged aspect AgrupadorCapaDataOnDemand_Roo_DataOnDemand {
    
    declare @type: AgrupadorCapaDataOnDemand: @Component;
    
    private Random AgrupadorCapaDataOnDemand.rnd = new SecureRandom();
    
    private List<AgrupadorCapa> AgrupadorCapaDataOnDemand.data;
    
    @Autowired
    AgrupadorCapaService AgrupadorCapaDataOnDemand.agrupadorCapaService;
    
    public AgrupadorCapa AgrupadorCapaDataOnDemand.getNewTransientAgrupadorCapa(int index) {
        AgrupadorCapa obj = new AgrupadorCapa();
        setAuditCreatedBy(obj, index);
        setAuditCreation(obj, index);
        setAuditLastUpdate(obj, index);
        setAuditLastUpdatedBy(obj, index);
        setDescripcion(obj, index);
        setNombre(obj, index);
        return obj;
    }
    
    public void AgrupadorCapaDataOnDemand.setAuditCreatedBy(AgrupadorCapa obj, int index) {
        String auditCreatedBy = "auditCreatedBy_" + index;
        obj.setAuditCreatedBy(auditCreatedBy);
    }
    
    public void AgrupadorCapaDataOnDemand.setAuditCreation(AgrupadorCapa obj, int index) {
        Calendar auditCreation = Calendar.getInstance();
        obj.setAuditCreation(auditCreation);
    }
    
    public void AgrupadorCapaDataOnDemand.setAuditLastUpdate(AgrupadorCapa obj, int index) {
        Calendar auditLastUpdate = Calendar.getInstance();
        obj.setAuditLastUpdate(auditLastUpdate);
    }
    
    public void AgrupadorCapaDataOnDemand.setAuditLastUpdatedBy(AgrupadorCapa obj, int index) {
        String auditLastUpdatedBy = "auditLastUpdatedBy_" + index;
        obj.setAuditLastUpdatedBy(auditLastUpdatedBy);
    }
    
    public void AgrupadorCapaDataOnDemand.setDescripcion(AgrupadorCapa obj, int index) {
        String descripcion = "descripcion_" + index;
        obj.setDescripcion(descripcion);
    }
    
    public void AgrupadorCapaDataOnDemand.setNombre(AgrupadorCapa obj, int index) {
        String nombre = "nombre_" + index;
        obj.setNombre(nombre);
    }
    
    public AgrupadorCapa AgrupadorCapaDataOnDemand.getSpecificAgrupadorCapa(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        AgrupadorCapa obj = data.get(index);
        Long id = obj.getId();
        return agrupadorCapaService.findAgrupadorCapa(id);
    }
    
    public AgrupadorCapa AgrupadorCapaDataOnDemand.getRandomAgrupadorCapa() {
        init();
        AgrupadorCapa obj = data.get(rnd.nextInt(data.size()));
        Long id = obj.getId();
        return agrupadorCapaService.findAgrupadorCapa(id);
    }
    
    public boolean AgrupadorCapaDataOnDemand.modifyAgrupadorCapa(AgrupadorCapa obj) {
        return false;
    }
    
    public void AgrupadorCapaDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = agrupadorCapaService.findAgrupadorCapaEntries(from, to);
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'AgrupadorCapa' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<AgrupadorCapa>();
        for (int i = 0; i < 10; i++) {
            AgrupadorCapa obj = getNewTransientAgrupadorCapa(i);
            try {
                agrupadorCapaService.saveAgrupadorCapa(obj);
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
