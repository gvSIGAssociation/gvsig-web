// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package es.gva.dgti.gvgeoportal.domain;

import es.gva.dgti.gvgeoportal.domain.ServicioWeb;
import es.gva.dgti.gvgeoportal.domain.ServicioWebDataOnDemand;
import es.gva.dgti.gvgeoportal.domain.enumerated.TipoServicio;
import es.gva.dgti.gvgeoportal.service.domain.ServicioWebService;
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

privileged aspect ServicioWebDataOnDemand_Roo_DataOnDemand {
    
    declare @type: ServicioWebDataOnDemand: @Component;
    
    private Random ServicioWebDataOnDemand.rnd = new SecureRandom();
    
    private List<ServicioWeb> ServicioWebDataOnDemand.data;
    
    @Autowired
    ServicioWebService ServicioWebDataOnDemand.servicioWebService;
    
    public ServicioWeb ServicioWebDataOnDemand.getNewTransientServicioWeb(int index) {
        ServicioWeb obj = new ServicioWeb();
        setAuditCreatedBy(obj, index);
        setAuditCreation(obj, index);
        setAuditLastUpdate(obj, index);
        setAuditLastUpdatedBy(obj, index);
        setDescripcion(obj, index);
        setFormatoImagen(obj, index);
        setNombre(obj, index);
        setTileMatrixSet(obj, index);
        setTipo(obj, index);
        setUrl(obj, index);
        setVersionProtocolo(obj, index);
        return obj;
    }
    
    public void ServicioWebDataOnDemand.setAuditCreatedBy(ServicioWeb obj, int index) {
        String auditCreatedBy = "auditCreatedBy_" + index;
        obj.setAuditCreatedBy(auditCreatedBy);
    }
    
    public void ServicioWebDataOnDemand.setAuditCreation(ServicioWeb obj, int index) {
        Calendar auditCreation = Calendar.getInstance();
        obj.setAuditCreation(auditCreation);
    }
    
    public void ServicioWebDataOnDemand.setAuditLastUpdate(ServicioWeb obj, int index) {
        Calendar auditLastUpdate = Calendar.getInstance();
        obj.setAuditLastUpdate(auditLastUpdate);
    }
    
    public void ServicioWebDataOnDemand.setAuditLastUpdatedBy(ServicioWeb obj, int index) {
        String auditLastUpdatedBy = "auditLastUpdatedBy_" + index;
        obj.setAuditLastUpdatedBy(auditLastUpdatedBy);
    }
    
    public void ServicioWebDataOnDemand.setDescripcion(ServicioWeb obj, int index) {
        String descripcion = "descripcion_" + index;
        obj.setDescripcion(descripcion);
    }
    
    public void ServicioWebDataOnDemand.setFormatoImagen(ServicioWeb obj, int index) {
        String formatoImagen = "formatoImagen_" + index;
        obj.setFormatoImagen(formatoImagen);
    }
    
    public void ServicioWebDataOnDemand.setNombre(ServicioWeb obj, int index) {
        String nombre = "nombre_" + index;
        obj.setNombre(nombre);
    }
    
    public void ServicioWebDataOnDemand.setTileMatrixSet(ServicioWeb obj, int index) {
        String tileMatrixSet = "tileMatrixSet_" + index;
        obj.setTileMatrixSet(tileMatrixSet);
    }
    
    public void ServicioWebDataOnDemand.setTipo(ServicioWeb obj, int index) {
        TipoServicio tipo = TipoServicio.class.getEnumConstants()[0];
        obj.setTipo(tipo);
    }
    
    public void ServicioWebDataOnDemand.setUrl(ServicioWeb obj, int index) {
        String url = "url_" + index;
        obj.setUrl(url);
    }
    
    public void ServicioWebDataOnDemand.setVersionProtocolo(ServicioWeb obj, int index) {
        String versionProtocolo = "versionProtocolo_" + index;
        obj.setVersionProtocolo(versionProtocolo);
    }
    
    public ServicioWeb ServicioWebDataOnDemand.getSpecificServicioWeb(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        ServicioWeb obj = data.get(index);
        Long id = obj.getId();
        return servicioWebService.findServicioWeb(id);
    }
    
    public ServicioWeb ServicioWebDataOnDemand.getRandomServicioWeb() {
        init();
        ServicioWeb obj = data.get(rnd.nextInt(data.size()));
        Long id = obj.getId();
        return servicioWebService.findServicioWeb(id);
    }
    
    public boolean ServicioWebDataOnDemand.modifyServicioWeb(ServicioWeb obj) {
        return false;
    }
    
    public void ServicioWebDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = servicioWebService.findServicioWebEntries(from, to);
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'ServicioWeb' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<ServicioWeb>();
        for (int i = 0; i < 10; i++) {
            ServicioWeb obj = getNewTransientServicioWeb(i);
            try {
                servicioWebService.saveServicioWeb(obj);
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
