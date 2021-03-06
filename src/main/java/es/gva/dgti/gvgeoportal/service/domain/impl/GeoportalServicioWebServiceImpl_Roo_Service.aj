// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package es.gva.dgti.gvgeoportal.service.domain.impl;

import es.gva.dgti.gvgeoportal.domain.GeoportalServicioWeb;
import es.gva.dgti.gvgeoportal.service.domain.impl.GeoportalServicioWebServiceImpl;
import java.util.List;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

privileged aspect GeoportalServicioWebServiceImpl_Roo_Service {
    
    declare @type: GeoportalServicioWebServiceImpl: @Service;
    
    declare @type: GeoportalServicioWebServiceImpl: @Transactional;
    
    public long GeoportalServicioWebServiceImpl.countAllGeoportalServicioWebs() {
        return GeoportalServicioWeb.countGeoportalServicioWebs();
    }
    
    public void GeoportalServicioWebServiceImpl.deleteGeoportalServicioWeb(GeoportalServicioWeb geoportalServicioWeb) {
        geoportalServicioWeb.remove();
    }
    
    public GeoportalServicioWeb GeoportalServicioWebServiceImpl.findGeoportalServicioWeb(Long id) {
        return GeoportalServicioWeb.findGeoportalServicioWeb(id);
    }
    
    public List<GeoportalServicioWeb> GeoportalServicioWebServiceImpl.findAllGeoportalServicioWebs() {
        return GeoportalServicioWeb.findAllGeoportalServicioWebs();
    }
    
    public List<GeoportalServicioWeb> GeoportalServicioWebServiceImpl.findGeoportalServicioWebEntries(int firstResult, int maxResults) {
        return GeoportalServicioWeb.findGeoportalServicioWebEntries(firstResult, maxResults);
    }
    
    public void GeoportalServicioWebServiceImpl.saveGeoportalServicioWeb(GeoportalServicioWeb geoportalServicioWeb) {
        geoportalServicioWeb.persist();
    }
    
    public GeoportalServicioWeb GeoportalServicioWebServiceImpl.updateGeoportalServicioWeb(GeoportalServicioWeb geoportalServicioWeb) {
        return geoportalServicioWeb.merge();
    }
    
}
