// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package es.gva.dgti.gvgeoportal.domain;

import es.gva.dgti.gvgeoportal.domain.AgrupadorCapa;
import es.gva.dgti.gvgeoportal.domain.AgrupadorCapaDataOnDemand;
import es.gva.dgti.gvgeoportal.domain.AgrupadorCapaServicioWeb;
import es.gva.dgti.gvgeoportal.domain.AgrupadorCapaServicioWebDataOnDemand;
import es.gva.dgti.gvgeoportal.domain.ServicioWeb;
import es.gva.dgti.gvgeoportal.domain.ServicioWebDataOnDemand;
import es.gva.dgti.gvgeoportal.service.domain.AgrupadorCapaServicioWebService;
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

privileged aspect AgrupadorCapaServicioWebDataOnDemand_Roo_DataOnDemand {
    
    declare @type: AgrupadorCapaServicioWebDataOnDemand: @Component;
    
    private Random AgrupadorCapaServicioWebDataOnDemand.rnd = new SecureRandom();
    
    private List<AgrupadorCapaServicioWeb> AgrupadorCapaServicioWebDataOnDemand.data;
    
    @Autowired
    AgrupadorCapaDataOnDemand AgrupadorCapaServicioWebDataOnDemand.agrupadorCapaDataOnDemand;
    
    @Autowired
    ServicioWebDataOnDemand AgrupadorCapaServicioWebDataOnDemand.servicioWebDataOnDemand;
    
    @Autowired
    AgrupadorCapaServicioWebService AgrupadorCapaServicioWebDataOnDemand.agrupadorCapaServicioWebService;
    
    public AgrupadorCapaServicioWeb AgrupadorCapaServicioWebDataOnDemand.getNewTransientAgrupadorCapaServicioWeb(int index) {
        AgrupadorCapaServicioWeb obj = new AgrupadorCapaServicioWeb();
        setAgrupador(obj, index);
        setAuditCreatedBy(obj, index);
        setAuditCreation(obj, index);
        setAuditLastUpdate(obj, index);
        setAuditLastUpdatedBy(obj, index);
        setServicioWeb(obj, index);
        return obj;
    }
    
    public void AgrupadorCapaServicioWebDataOnDemand.setAgrupador(AgrupadorCapaServicioWeb obj, int index) {
        AgrupadorCapa agrupador = agrupadorCapaDataOnDemand.getRandomAgrupadorCapa();
        obj.setAgrupador(agrupador);
    }
    
    public void AgrupadorCapaServicioWebDataOnDemand.setAuditCreatedBy(AgrupadorCapaServicioWeb obj, int index) {
        String auditCreatedBy = "auditCreatedBy_" + index;
        obj.setAuditCreatedBy(auditCreatedBy);
    }
    
    public void AgrupadorCapaServicioWebDataOnDemand.setAuditCreation(AgrupadorCapaServicioWeb obj, int index) {
        Calendar auditCreation = Calendar.getInstance();
        obj.setAuditCreation(auditCreation);
    }
    
    public void AgrupadorCapaServicioWebDataOnDemand.setAuditLastUpdate(AgrupadorCapaServicioWeb obj, int index) {
        Calendar auditLastUpdate = Calendar.getInstance();
        obj.setAuditLastUpdate(auditLastUpdate);
    }
    
    public void AgrupadorCapaServicioWebDataOnDemand.setAuditLastUpdatedBy(AgrupadorCapaServicioWeb obj, int index) {
        String auditLastUpdatedBy = "auditLastUpdatedBy_" + index;
        obj.setAuditLastUpdatedBy(auditLastUpdatedBy);
    }
    
    public void AgrupadorCapaServicioWebDataOnDemand.setServicioWeb(AgrupadorCapaServicioWeb obj, int index) {
        ServicioWeb servicioWeb = servicioWebDataOnDemand.getRandomServicioWeb();
        obj.setServicioWeb(servicioWeb);
    }
    
    public AgrupadorCapaServicioWeb AgrupadorCapaServicioWebDataOnDemand.getSpecificAgrupadorCapaServicioWeb(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        AgrupadorCapaServicioWeb obj = data.get(index);
        Long id = obj.getId();
        return agrupadorCapaServicioWebService.findAgrupadorCapaServicioWeb(id);
    }
    
    public AgrupadorCapaServicioWeb AgrupadorCapaServicioWebDataOnDemand.getRandomAgrupadorCapaServicioWeb() {
        init();
        AgrupadorCapaServicioWeb obj = data.get(rnd.nextInt(data.size()));
        Long id = obj.getId();
        return agrupadorCapaServicioWebService.findAgrupadorCapaServicioWeb(id);
    }
    
    public boolean AgrupadorCapaServicioWebDataOnDemand.modifyAgrupadorCapaServicioWeb(AgrupadorCapaServicioWeb obj) {
        return false;
    }
    
    public void AgrupadorCapaServicioWebDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = agrupadorCapaServicioWebService.findAgrupadorCapaServicioWebEntries(from, to);
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'AgrupadorCapaServicioWeb' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<AgrupadorCapaServicioWeb>();
        for (int i = 0; i < 10; i++) {
            AgrupadorCapaServicioWeb obj = getNewTransientAgrupadorCapaServicioWeb(i);
            try {
                agrupadorCapaServicioWebService.saveAgrupadorCapaServicioWeb(obj);
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
