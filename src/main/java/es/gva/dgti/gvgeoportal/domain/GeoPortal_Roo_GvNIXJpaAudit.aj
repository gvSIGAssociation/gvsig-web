// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package es.gva.dgti.gvgeoportal.domain;

import es.gva.dgti.gvgeoportal.domain.GeoPortal;
import java.util.Calendar;
import org.springframework.format.annotation.DateTimeFormat;

privileged aspect GeoPortal_Roo_GvNIXJpaAudit {
    
    @DateTimeFormat(style = "MM")
    private Calendar GeoPortal.auditCreation;
    
    private String GeoPortal.auditCreatedBy;
    
    @DateTimeFormat(style = "MM")
    private Calendar GeoPortal.auditLastUpdate;
    
    private String GeoPortal.auditLastUpdatedBy;
    
    public Calendar GeoPortal.getAuditCreation() {
        return this.auditCreation;
    }
    
    public void GeoPortal.setAuditCreation(Calendar auditCreation) {
        this.auditCreation = auditCreation;
    }
    
    public String GeoPortal.getAuditCreatedBy() {
        return this.auditCreatedBy;
    }
    
    public void GeoPortal.setAuditCreatedBy(String auditCreatedBy) {
        this.auditCreatedBy = auditCreatedBy;
    }
    
    public Calendar GeoPortal.getAuditLastUpdate() {
        return this.auditLastUpdate;
    }
    
    public void GeoPortal.setAuditLastUpdate(Calendar auditLastUpdate) {
        this.auditLastUpdate = auditLastUpdate;
    }
    
    public String GeoPortal.getAuditLastUpdatedBy() {
        return this.auditLastUpdatedBy;
    }
    
    public void GeoPortal.setAuditLastUpdatedBy(String auditLastUpdatedBy) {
        this.auditLastUpdatedBy = auditLastUpdatedBy;
    }
    
}
