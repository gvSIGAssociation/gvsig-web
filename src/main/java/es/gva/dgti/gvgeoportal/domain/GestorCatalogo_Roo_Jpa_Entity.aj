// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package es.gva.dgti.gvgeoportal.domain;

import es.gva.dgti.gvgeoportal.domain.GestorCatalogo;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Version;

privileged aspect GestorCatalogo_Roo_Jpa_Entity {
    
    declare @type: GestorCatalogo: @Entity;
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long GestorCatalogo.id;
    
    @Version
    @Column(name = "version")
    private Integer GestorCatalogo.version;
    
    public Long GestorCatalogo.getId() {
        return this.id;
    }
    
    public void GestorCatalogo.setId(Long id) {
        this.id = id;
    }
    
    public Integer GestorCatalogo.getVersion() {
        return this.version;
    }
    
    public void GestorCatalogo.setVersion(Integer version) {
        this.version = version;
    }
    
}
