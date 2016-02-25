// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package es.gva.dgti.gvgeoportal.domain;

import es.gva.dgti.gvgeoportal.domain.Componentes;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.SequenceGenerator;
import javax.persistence.Version;

privileged aspect Componentes_Roo_Jpa_Entity {
    
    declare @type: Componentes: @Entity;
    
    declare @type: Componentes: @Inheritance(strategy = InheritanceType.JOINED);
    
    @Id
    @SequenceGenerator(name = "componentesGen", sequenceName = "componentes_id_seq")
    @GeneratedValue(strategy = GenerationType.AUTO, generator = "componentesGen")
    @Column(name = "id")
    private Long Componentes.id;
    
    @Version
    @Column(name = "version")
    private Integer Componentes.version;
    
    public Long Componentes.getId() {
        return this.id;
    }
    
    public void Componentes.setId(Long id) {
        this.id = id;
    }
    
    public Integer Componentes.getVersion() {
        return this.version;
    }
    
    public void Componentes.setVersion(Integer version) {
        this.version = version;
    }
    
}
