// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package es.gva.dgti.gvgeoportal.domain;

import es.gva.dgti.gvgeoportal.domain.GestorCatalogo;
import java.util.Calendar;
import org.springframework.format.annotation.DateTimeFormat;

privileged aspect GestorCatalogo_Roo_GvNIXJpaAudit {
    
    @DateTimeFormat(style = "MM")
    private Calendar GestorCatalogo.auditCreation;
    
    private String GestorCatalogo.auditCreatedBy;
    
    @DateTimeFormat(style = "MM")
    private Calendar GestorCatalogo.auditLastUpdate;
    
    private String GestorCatalogo.auditLastUpdatedBy;
    
    public Calendar GestorCatalogo.getAuditCreation() {
        return this.auditCreation;
    }
    
    public void GestorCatalogo.setAuditCreation(Calendar auditCreation) {
        this.auditCreation = auditCreation;
    }
    
    public String GestorCatalogo.getAuditCreatedBy() {
        return this.auditCreatedBy;
    }
    
    public void GestorCatalogo.setAuditCreatedBy(String auditCreatedBy) {
        this.auditCreatedBy = auditCreatedBy;
    }
    
    public Calendar GestorCatalogo.getAuditLastUpdate() {
        return this.auditLastUpdate;
    }
    
    public void GestorCatalogo.setAuditLastUpdate(Calendar auditLastUpdate) {
        this.auditLastUpdate = auditLastUpdate;
    }
    
    public String GestorCatalogo.getAuditLastUpdatedBy() {
        return this.auditLastUpdatedBy;
    }
    
    public void GestorCatalogo.setAuditLastUpdatedBy(String auditLastUpdatedBy) {
        this.auditLastUpdatedBy = auditLastUpdatedBy;
    }
    
}
