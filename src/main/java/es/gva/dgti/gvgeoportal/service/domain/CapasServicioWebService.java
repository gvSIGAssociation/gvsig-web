package es.gva.dgti.gvgeoportal.service.domain;
import java.util.List;

import org.springframework.roo.addon.layers.service.RooService;

import es.gva.dgti.gvgeoportal.domain.CapasServicioWeb;
import es.gva.dgti.gvgeoportal.domain.ServicioWeb;

@RooService(domainTypes = { es.gva.dgti.gvgeoportal.domain.CapasServicioWeb.class })
public interface CapasServicioWebService {

    /**
     * Devuelve listado de CapasServicioWeb dado un servicioWeb
     * @param servicioWeb
     * @return
     */
    public List<CapasServicioWeb> findCapasServicioWebsByServicioWeb(ServicioWeb servicioWeb);
}
