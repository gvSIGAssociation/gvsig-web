// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package es.gva.dgti.gvgeoportal.domain;

import es.gva.dgti.gvgeoportal.domain.AuditUserService;
import es.gva.dgti.gvgeoportal.domain.CapasServicioWeb;
import es.gva.dgti.gvgeoportal.domain.CapasServicioWebAuditListener;
import java.util.Calendar;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;

privileged aspect CapasServicioWebAuditListener_Roo_GvNIXJpaAuditListener {
    
    @PrePersist
    public void CapasServicioWebAuditListener.onCreate(CapasServicioWeb capasServicioWeb) {
        Calendar now = Calendar.getInstance();
        String user = AuditUserService.getUser();
        capasServicioWeb.setAuditCreation(now);
        capasServicioWeb.setAuditCreatedBy(user);
        capasServicioWeb.setAuditLastUpdate(now);
        capasServicioWeb.setAuditLastUpdatedBy(user);
    }
    
    @PreUpdate
    public void CapasServicioWebAuditListener.onUpdate(CapasServicioWeb capasServicioWeb) {
        Calendar now = Calendar.getInstance();
        String user = AuditUserService.getUser();
        capasServicioWeb.setAuditLastUpdate(now);
        capasServicioWeb.setAuditLastUpdatedBy(user);
    }
    
}
