// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package es.gva.dgti.gvgeoportal.domain.components;

import es.gva.dgti.gvgeoportal.domain.ServicioWeb;
import es.gva.dgti.gvgeoportal.domain.components.ConfMiniMapa;

privileged aspect ConfMiniMapa_Roo_JavaBean {
    
    public ServicioWeb ConfMiniMapa.getServicioWeb() {
        return this.servicioWeb;
    }
    
    public void ConfMiniMapa.setServicioWeb(ServicioWeb servicioWeb) {
        this.servicioWeb = servicioWeb;
    }
    
}
