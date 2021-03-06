// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package es.gva.dgti.gvgeoportal.domain.components;

import es.gva.dgti.gvgeoportal.domain.AgrupadorCapaDataOnDemand;
import es.gva.dgti.gvgeoportal.domain.GeoPortalDataOnDemand;
import es.gva.dgti.gvgeoportal.domain.components.ConfCapasTematicas;
import es.gva.dgti.gvgeoportal.domain.components.ConfCapasTematicasDataOnDemand;
import es.gva.dgti.gvgeoportal.domain.enumerated.TipoComponente;
import es.gva.dgti.gvgeoportal.service.domain.ConfCapasTematicasService;
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

privileged aspect ConfCapasTematicasDataOnDemand_Roo_DataOnDemand {
    
    declare @type: ConfCapasTematicasDataOnDemand: @Component;
    
    private Random ConfCapasTematicasDataOnDemand.rnd = new SecureRandom();
    
    private List<ConfCapasTematicas> ConfCapasTematicasDataOnDemand.data;
    
    @Autowired
    GeoPortalDataOnDemand ConfCapasTematicasDataOnDemand.geoPortalDataOnDemand;
    
    @Autowired
    AgrupadorCapaDataOnDemand ConfCapasTematicasDataOnDemand.agrupadorCapaDataOnDemand;
    
    @Autowired
    ConfCapasTematicasService ConfCapasTematicasDataOnDemand.confCapasTematicasService;
    
    public ConfCapasTematicas ConfCapasTematicasDataOnDemand.getNewTransientConfCapasTematicas(int index) {
        ConfCapasTematicas obj = new ConfCapasTematicas();
        setAuditCreatedBy(obj, index);
        setAuditCreation(obj, index);
        setAuditLastUpdate(obj, index);
        setAuditLastUpdatedBy(obj, index);
        setLogo(obj, index);
        setNombre(obj, index);
        setTipo(obj, index);
        return obj;
    }
    
    public void ConfCapasTematicasDataOnDemand.setAuditCreatedBy(ConfCapasTematicas obj, int index) {
        String auditCreatedBy = "auditCreatedBy_" + index;
        obj.setAuditCreatedBy(auditCreatedBy);
    }
    
    public void ConfCapasTematicasDataOnDemand.setAuditCreation(ConfCapasTematicas obj, int index) {
        Calendar auditCreation = Calendar.getInstance();
        obj.setAuditCreation(auditCreation);
    }
    
    public void ConfCapasTematicasDataOnDemand.setAuditLastUpdate(ConfCapasTematicas obj, int index) {
        Calendar auditLastUpdate = Calendar.getInstance();
        obj.setAuditLastUpdate(auditLastUpdate);
    }
    
    public void ConfCapasTematicasDataOnDemand.setAuditLastUpdatedBy(ConfCapasTematicas obj, int index) {
        String auditLastUpdatedBy = "auditLastUpdatedBy_" + index;
        obj.setAuditLastUpdatedBy(auditLastUpdatedBy);
    }
    
    public void ConfCapasTematicasDataOnDemand.setLogo(ConfCapasTematicas obj, int index) {
        byte[] logo = String.valueOf(index).getBytes();
        obj.setLogo(logo);
    }
    
    public void ConfCapasTematicasDataOnDemand.setNombre(ConfCapasTematicas obj, int index) {
        String nombre = "nombre_" + index;
        obj.setNombre(nombre);
    }
    
    public void ConfCapasTematicasDataOnDemand.setTipo(ConfCapasTematicas obj, int index) {
        TipoComponente tipo = TipoComponente.class.getEnumConstants()[0];
        obj.setTipo(tipo);
    }
    
    public ConfCapasTematicas ConfCapasTematicasDataOnDemand.getSpecificConfCapasTematicas(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        ConfCapasTematicas obj = data.get(index);
        Long id = obj.getId();
        return confCapasTematicasService.findConfCapasTematicas(id);
    }
    
    public ConfCapasTematicas ConfCapasTematicasDataOnDemand.getRandomConfCapasTematicas() {
        init();
        ConfCapasTematicas obj = data.get(rnd.nextInt(data.size()));
        Long id = obj.getId();
        return confCapasTematicasService.findConfCapasTematicas(id);
    }
    
    public boolean ConfCapasTematicasDataOnDemand.modifyConfCapasTematicas(ConfCapasTematicas obj) {
        return false;
    }
    
    public void ConfCapasTematicasDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = confCapasTematicasService.findConfCapasTematicasEntries(from, to);
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'ConfCapasTematicas' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<ConfCapasTematicas>();
        for (int i = 0; i < 10; i++) {
            ConfCapasTematicas obj = getNewTransientConfCapasTematicas(i);
            try {
                confCapasTematicasService.saveConfCapasTematicas(obj);
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
