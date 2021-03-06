// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package es.gva.dgti.gvgeoportal.security;

import es.gva.dgti.gvgeoportal.security.SafeUser;
import java.util.Set;
import org.springframework.security.core.GrantedAuthority;

privileged aspect SafeUser_Roo_GvNIXUserSAFE {
    
    private static final long SafeUser.serialVersionUID = 5767016615242591655L;
    
    private String SafeUser.username;
    
    private String SafeUser.password;
    
    private boolean SafeUser.accountNonExpired;
    
    private boolean SafeUser.accountNonLocked;
    
    private boolean SafeUser.credentialsNonExpired;
    
    private boolean SafeUser.enabled;
    
    private Set<GrantedAuthority> SafeUser.authorities;
    
    private String SafeUser.nombre;
    
    private String SafeUser.email;
    
    private String SafeUser.apellido1;
    
    private String SafeUser.apellido2;
    
    private String SafeUser.cif;
    
    private String SafeUser.habilitado;
    
    private String SafeUser.idHDFI;
    
    private String SafeUser.iusserDN;
    
    private String SafeUser.nif;
    
    private String SafeUser.oid;
    
    private String SafeUser.razonSocial;
    
    private String SafeUser.representante;
    
    private String SafeUser.serialNumber;
    
    private String SafeUser.subjectDN;
    
    private String SafeUser.tipoAut;
    
    private String SafeUser.tipoCertificado;
    
    public String SafeUser.getUsername() {
        return this.username;
    }
    
    public void SafeUser.setUsername(String username) {
        this.username = username;
    }
    
    public String SafeUser.getPassword() {
        return this.password;
    }
    
    public void SafeUser.setPassword(String password) {
        this.password = password;
    }
    
    public boolean SafeUser.isAccountNonExpired() {
        return this.accountNonExpired;
    }
    
    public void SafeUser.setAccountNonExpired(boolean accountNonExpired) {
        this.accountNonExpired = accountNonExpired;
    }
    
    public boolean SafeUser.isAccountNonLocked() {
        return this.accountNonLocked;
    }
    
    public void SafeUser.setAccountNonLocked(boolean accountNonLocked) {
        this.accountNonLocked = accountNonLocked;
    }
    
    public boolean SafeUser.isCredentialsNonExpired() {
        return this.credentialsNonExpired;
    }
    
    public void SafeUser.setCredentialsNonExpired(boolean credentialsNonExpired) {
        this.credentialsNonExpired = credentialsNonExpired;
    }
    
    public boolean SafeUser.isEnabled() {
        return this.enabled;
    }
    
    public void SafeUser.setEnabled(boolean enabled) {
        this.enabled = enabled;
    }
    
    public Set<GrantedAuthority> SafeUser.getAuthorities() {
        return this.authorities;
    }
    
    public void SafeUser.setAuthorities(Set<GrantedAuthority> authorities) {
        this.authorities = authorities;
    }
    
    public String SafeUser.getNombre() {
        return this.nombre;
    }
    
    public void SafeUser.setNombre(String nombre) {
        this.nombre = nombre;
    }
    
    public String SafeUser.getEmail() {
        return this.email;
    }
    
    public void SafeUser.setEmail(String email) {
        this.email = email;
    }
    
    public String SafeUser.getApellido1() {
        return this.apellido1;
    }
    
    public void SafeUser.setApellido1(String apellido1) {
        this.apellido1 = apellido1;
    }
    
    public String SafeUser.getApellido2() {
        return this.apellido2;
    }
    
    public void SafeUser.setApellido2(String apellido2) {
        this.apellido2 = apellido2;
    }
    
    public String SafeUser.getCif() {
        return this.cif;
    }
    
    public void SafeUser.setCif(String cif) {
        this.cif = cif;
    }
    
    public String SafeUser.getHabilitado() {
        return this.habilitado;
    }
    
    public void SafeUser.setHabilitado(String habilitado) {
        this.habilitado = habilitado;
    }
    
    public String SafeUser.getIdHDFI() {
        return this.idHDFI;
    }
    
    public void SafeUser.setIdHDFI(String idHDFI) {
        this.idHDFI = idHDFI;
    }
    
    public String SafeUser.getIusserDN() {
        return this.iusserDN;
    }
    
    public void SafeUser.setIusserDN(String iusserDN) {
        this.iusserDN = iusserDN;
    }
    
    public String SafeUser.getNif() {
        return this.nif;
    }
    
    public void SafeUser.setNif(String nif) {
        this.nif = nif;
    }
    
    public String SafeUser.getOid() {
        return this.oid;
    }
    
    public void SafeUser.setOid(String oid) {
        this.oid = oid;
    }
    
    public String SafeUser.getRazonSocial() {
        return this.razonSocial;
    }
    
    public void SafeUser.setRazonSocial(String razonSocial) {
        this.razonSocial = razonSocial;
    }
    
    public String SafeUser.getRepresentante() {
        return this.representante;
    }
    
    public void SafeUser.setRepresentante(String representante) {
        this.representante = representante;
    }
    
    public String SafeUser.getSerialNumber() {
        return this.serialNumber;
    }
    
    public void SafeUser.setSerialNumber(String serialNumber) {
        this.serialNumber = serialNumber;
    }
    
    public String SafeUser.getSubjectDN() {
        return this.subjectDN;
    }
    
    public void SafeUser.setSubjectDN(String subjectDN) {
        this.subjectDN = subjectDN;
    }
    
    public String SafeUser.getTipoAut() {
        return this.tipoAut;
    }
    
    public void SafeUser.setTipoAut(String tipoAut) {
        this.tipoAut = tipoAut;
    }
    
    public String SafeUser.getTipoCertificado() {
        return this.tipoCertificado;
    }
    
    public void SafeUser.setTipoCertificado(String tipoCertificado) {
        this.tipoCertificado = tipoCertificado;
    }
    
}
