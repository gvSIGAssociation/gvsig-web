// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package es.gva.dgti.gvgeoportal.domain;

import es.gva.dgti.gvgeoportal.domain.AgrupadorCapa;
import es.gva.dgti.gvgeoportal.domain.GeoPortal;
import es.gva.dgti.gvgeoportal.domain.GeoportalServicioWeb;
import es.gva.dgti.gvgeoportal.domain.SistemaCoordenadas;
import java.util.Calendar;
import java.util.Set;

privileged aspect GeoPortal_Roo_JavaBean {
    
    public String GeoPortal.getTitulo() {
        return this.titulo;
    }
    
    public void GeoPortal.setTitulo(String titulo) {
        this.titulo = titulo;
    }
    
    public String GeoPortal.getDescripcion() {
        return this.descripcion;
    }
    
    public void GeoPortal.setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }
    
    public String GeoPortal.getSubtitulo() {
        return this.subtitulo;
    }
    
    public void GeoPortal.setSubtitulo(String subtitulo) {
        this.subtitulo = subtitulo;
    }
    
    public byte[] GeoPortal.getLogo() {
        return this.logo;
    }
    
    public void GeoPortal.setLogo(byte[] logo) {
        this.logo = logo;
    }
    
    public void GeoPortal.setLogoString(String logoString) {
        this.logoString = logoString;
    }
    
    public String GeoPortal.getAlias() {
        return this.alias;
    }
    
    public void GeoPortal.setAlias(String alias) {
        this.alias = alias;
    }
    
    public boolean GeoPortal.isPublicado() {
        return this.publicado;
    }
    
    public void GeoPortal.setPublicado(boolean publicado) {
        this.publicado = publicado;
    }
    
    public String GeoPortal.getCentro() {
        return this.centro;
    }
    
    public void GeoPortal.setCentro(String centro) {
        this.centro = centro;
    }
    
    public Integer GeoPortal.getZoom() {
        return this.zoom;
    }
    
    public void GeoPortal.setZoom(Integer zoom) {
        this.zoom = zoom;
    }
    
    public Integer GeoPortal.getMinZoom() {
        return this.minZoom;
    }
    
    public void GeoPortal.setMinZoom(Integer minZoom) {
        this.minZoom = minZoom;
    }
    
    public Integer GeoPortal.getMaxZoom() {
        return this.maxZoom;
    }
    
    public void GeoPortal.setMaxZoom(Integer maxZoom) {
        this.maxZoom = maxZoom;
    }
    
    public Calendar GeoPortal.getFechaAlta() {
        return this.fechaAlta;
    }
    
    public void GeoPortal.setFechaAlta(Calendar fechaAlta) {
        this.fechaAlta = fechaAlta;
    }
    
    public Calendar GeoPortal.getFechaBaja() {
        return this.fechaBaja;
    }
    
    public void GeoPortal.setFechaBaja(Calendar fechaBaja) {
        this.fechaBaja = fechaBaja;
    }
    
    public Set<AgrupadorCapa> GeoPortal.getAgrupadorCapa() {
        return this.agrupadorCapa;
    }
    
    public void GeoPortal.setAgrupadorCapa(Set<AgrupadorCapa> agrupadorCapa) {
        this.agrupadorCapa = agrupadorCapa;
    }
    
    public Set<GeoportalServicioWeb> GeoPortal.getServiciosToc() {
        return this.serviciosToc;
    }
    
    public void GeoPortal.setServiciosToc(Set<GeoportalServicioWeb> serviciosToc) {
        this.serviciosToc = serviciosToc;
    }
    
    public SistemaCoordenadas GeoPortal.getCoordenadas() {
        return this.coordenadas;
    }
    
    public void GeoPortal.setCoordenadas(SistemaCoordenadas coordenadas) {
        this.coordenadas = coordenadas;
    }
    
    public String GeoPortal.getUrl() {
        return this.url;
    }
    
    public void GeoPortal.setUrl(String url) {
        this.url = url;
    }
    
    public String GeoPortal.getUrlCompleta() {
        return this.urlCompleta;
    }
    
    public void GeoPortal.setUrlCompleta(String urlCompleta) {
        this.urlCompleta = urlCompleta;
    }
    
}
