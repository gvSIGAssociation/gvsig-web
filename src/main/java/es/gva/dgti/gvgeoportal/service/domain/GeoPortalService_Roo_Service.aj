// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package es.gva.dgti.gvgeoportal.service.domain;

import es.gva.dgti.gvgeoportal.domain.GeoPortal;
import es.gva.dgti.gvgeoportal.service.domain.GeoPortalService;
import java.util.List;

privileged aspect GeoPortalService_Roo_Service {
    
    public abstract long GeoPortalService.countAllGeoPortales();    
    public abstract void GeoPortalService.deleteGeoPortal(GeoPortal geoPortal);    
    public abstract GeoPortal GeoPortalService.findGeoPortal(Long id);    
    public abstract List<GeoPortal> GeoPortalService.findAllGeoPortales();    
    public abstract List<GeoPortal> GeoPortalService.findGeoPortalEntries(int firstResult, int maxResults);    
    public abstract void GeoPortalService.saveGeoPortal(GeoPortal geoPortal);    
    public abstract GeoPortal GeoPortalService.updateGeoPortal(GeoPortal geoPortal);    
}
