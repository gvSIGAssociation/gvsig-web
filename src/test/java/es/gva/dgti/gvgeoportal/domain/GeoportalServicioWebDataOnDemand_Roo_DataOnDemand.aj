// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package es.gva.dgti.gvgeoportal.domain;

import es.gva.dgti.gvgeoportal.domain.GeoPortal;
import es.gva.dgti.gvgeoportal.domain.GeoPortalDataOnDemand;
import es.gva.dgti.gvgeoportal.domain.GeoportalServicioWeb;
import es.gva.dgti.gvgeoportal.domain.GeoportalServicioWebDataOnDemand;
import es.gva.dgti.gvgeoportal.domain.ServicioWeb;
import es.gva.dgti.gvgeoportal.domain.ServicioWebDataOnDemand;
import es.gva.dgti.gvgeoportal.service.domain.GeoportalServicioWebService;
import java.math.BigDecimal;
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

privileged aspect GeoportalServicioWebDataOnDemand_Roo_DataOnDemand {
    
    declare @type: GeoportalServicioWebDataOnDemand: @Component;
    
    private Random GeoportalServicioWebDataOnDemand.rnd = new SecureRandom();
    
    private List<GeoportalServicioWeb> GeoportalServicioWebDataOnDemand.data;
    
    @Autowired
    GeoPortalDataOnDemand GeoportalServicioWebDataOnDemand.geoPortalDataOnDemand;
    
    @Autowired
    ServicioWebDataOnDemand GeoportalServicioWebDataOnDemand.servicioWebDataOnDemand;
    
    @Autowired
    GeoportalServicioWebService GeoportalServicioWebDataOnDemand.geoportalServicioWebService;
    
    public GeoportalServicioWeb GeoportalServicioWebDataOnDemand.getNewTransientGeoportalServicioWeb(int index) {
        GeoportalServicioWeb obj = new GeoportalServicioWeb();
        setActivo(obj, index);
        setAuditCreatedBy(obj, index);
        setAuditCreation(obj, index);
        setAuditLastUpdate(obj, index);
        setAuditLastUpdatedBy(obj, index);
        setGeoportal(obj, index);
        setHabilitado(obj, index);
        setOpacidad(obj, index);
        setPosicion(obj, index);
        setServicioWeb(obj, index);
        return obj;
    }
    
    public void GeoportalServicioWebDataOnDemand.setActivo(GeoportalServicioWeb obj, int index) {
        Boolean activo = true;
        obj.setActivo(activo);
    }
    
    public void GeoportalServicioWebDataOnDemand.setAuditCreatedBy(GeoportalServicioWeb obj, int index) {
        String auditCreatedBy = "auditCreatedBy_" + index;
        obj.setAuditCreatedBy(auditCreatedBy);
    }
    
    public void GeoportalServicioWebDataOnDemand.setAuditCreation(GeoportalServicioWeb obj, int index) {
        Calendar auditCreation = Calendar.getInstance();
        obj.setAuditCreation(auditCreation);
    }
    
    public void GeoportalServicioWebDataOnDemand.setAuditLastUpdate(GeoportalServicioWeb obj, int index) {
        Calendar auditLastUpdate = Calendar.getInstance();
        obj.setAuditLastUpdate(auditLastUpdate);
    }
    
    public void GeoportalServicioWebDataOnDemand.setAuditLastUpdatedBy(GeoportalServicioWeb obj, int index) {
        String auditLastUpdatedBy = "auditLastUpdatedBy_" + index;
        obj.setAuditLastUpdatedBy(auditLastUpdatedBy);
    }
    
    public void GeoportalServicioWebDataOnDemand.setGeoportal(GeoportalServicioWeb obj, int index) {
        GeoPortal geoportal = geoPortalDataOnDemand.getRandomGeoPortal();
        obj.setGeoportal(geoportal);
    }
    
    public void GeoportalServicioWebDataOnDemand.setHabilitado(GeoportalServicioWeb obj, int index) {
        Boolean habilitado = true;
        obj.setHabilitado(habilitado);
    }
    
    public void GeoportalServicioWebDataOnDemand.setOpacidad(GeoportalServicioWeb obj, int index) {
        BigDecimal opacidad = BigDecimal.valueOf(index);
        obj.setOpacidad(opacidad);
    }
    
    public void GeoportalServicioWebDataOnDemand.setPosicion(GeoportalServicioWeb obj, int index) {
        Integer posicion = new Integer(index);
        obj.setPosicion(posicion);
    }
    
    public void GeoportalServicioWebDataOnDemand.setServicioWeb(GeoportalServicioWeb obj, int index) {
        ServicioWeb servicioWeb = servicioWebDataOnDemand.getRandomServicioWeb();
        obj.setServicioWeb(servicioWeb);
    }
    
    public GeoportalServicioWeb GeoportalServicioWebDataOnDemand.getSpecificGeoportalServicioWeb(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        GeoportalServicioWeb obj = data.get(index);
        Long id = obj.getId();
        return geoportalServicioWebService.findGeoportalServicioWeb(id);
    }
    
    public GeoportalServicioWeb GeoportalServicioWebDataOnDemand.getRandomGeoportalServicioWeb() {
        init();
        GeoportalServicioWeb obj = data.get(rnd.nextInt(data.size()));
        Long id = obj.getId();
        return geoportalServicioWebService.findGeoportalServicioWeb(id);
    }
    
    public boolean GeoportalServicioWebDataOnDemand.modifyGeoportalServicioWeb(GeoportalServicioWeb obj) {
        return false;
    }
    
    public void GeoportalServicioWebDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = geoportalServicioWebService.findGeoportalServicioWebEntries(from, to);
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'GeoportalServicioWeb' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<GeoportalServicioWeb>();
        for (int i = 0; i < 10; i++) {
            GeoportalServicioWeb obj = getNewTransientGeoportalServicioWeb(i);
            try {
                geoportalServicioWebService.saveGeoportalServicioWeb(obj);
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
