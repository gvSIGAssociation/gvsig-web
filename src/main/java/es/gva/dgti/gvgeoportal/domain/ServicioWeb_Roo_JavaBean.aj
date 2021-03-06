// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package es.gva.dgti.gvgeoportal.domain;

import es.gva.dgti.gvgeoportal.domain.CapasServicioWeb;
import es.gva.dgti.gvgeoportal.domain.ServicioWeb;
import es.gva.dgti.gvgeoportal.domain.SistemaCoordenadas;
import es.gva.dgti.gvgeoportal.domain.components.ConfVistasPredefinidas;
import es.gva.dgti.gvgeoportal.domain.enumerated.TipoServicio;
import java.util.Set;

privileged aspect ServicioWeb_Roo_JavaBean {
    
    public Long ServicioWeb.getId() {
        return this.id;
    }
    
    public void ServicioWeb.setId(Long id) {
        this.id = id;
    }
    
    public String ServicioWeb.getNombre() {
        return this.nombre;
    }
    
    public void ServicioWeb.setNombre(String nombre) {
        this.nombre = nombre;
    }
    
    public String ServicioWeb.getDescripcion() {
        return this.descripcion;
    }
    
    public void ServicioWeb.setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }
    
    public String ServicioWeb.getUrl() {
        return this.url;
    }
    
    public void ServicioWeb.setUrl(String url) {
        this.url = url;
    }
    
    public String ServicioWeb.getVersionProtocolo() {
        return this.versionProtocolo;
    }
    
    public void ServicioWeb.setVersionProtocolo(String versionProtocolo) {
        this.versionProtocolo = versionProtocolo;
    }
    
    public TipoServicio ServicioWeb.getTipo() {
        return this.tipo;
    }
    
    public void ServicioWeb.setTipo(TipoServicio tipo) {
        this.tipo = tipo;
    }
    
    public Set<SistemaCoordenadas> ServicioWeb.getCoordenadas() {
        return this.coordenadas;
    }
    
    public void ServicioWeb.setCoordenadas(Set<SistemaCoordenadas> coordenadas) {
        this.coordenadas = coordenadas;
    }
    
    public Set<ConfVistasPredefinidas> ServicioWeb.getConfVistasPredefinidas() {
        return this.confVistasPredefinidas;
    }
    
    public void ServicioWeb.setConfVistasPredefinidas(Set<ConfVistasPredefinidas> confVistasPredefinidas) {
        this.confVistasPredefinidas = confVistasPredefinidas;
    }
    
    public Set<CapasServicioWeb> ServicioWeb.getCapasServicioWeb() {
        return this.capasServicioWeb;
    }
    
    public void ServicioWeb.setCapasServicioWeb(Set<CapasServicioWeb> capasServicioWeb) {
        this.capasServicioWeb = capasServicioWeb;
    }
    
    public String ServicioWeb.getFormatoImagen() {
        return this.formatoImagen;
    }
    
    public void ServicioWeb.setFormatoImagen(String formatoImagen) {
        this.formatoImagen = formatoImagen;
    }
    
    public String ServicioWeb.getNombresCapas() {
        return this.nombresCapas;
    }
    
    public void ServicioWeb.setNombresCapas(String nombresCapas) {
        this.nombresCapas = nombresCapas;
    }
    
    public String ServicioWeb.getEstilosCapas() {
        return this.estilosCapas;
    }
    
    public void ServicioWeb.setEstilosCapas(String estilosCapas) {
        this.estilosCapas = estilosCapas;
    }
    
    public String ServicioWeb.getTileMatrixSet() {
        return this.tileMatrixSet;
    }
    
    public void ServicioWeb.setTileMatrixSet(String tileMatrixSet) {
        this.tileMatrixSet = tileMatrixSet;
    }
    
}
