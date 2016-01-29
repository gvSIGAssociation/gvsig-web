// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package es.gva.dgti.gvgeoportal.security;

import es.gva.dgti.gvgeoportal.security.SafeAuthenticationFilter;
import java.lang.Override;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.security.authentication.AuthenticationServiceException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;

privileged aspect SafeAuthenticationFilter_Roo_GvNIXSafeAuthenticationFilter {
    
    private String SafeAuthenticationFilter.tokenParameter = "j_token";
    
    private boolean SafeAuthenticationFilter.postOnly = true;
    
    public String SafeAuthenticationFilter.getTokenParameter() {
        return this.tokenParameter;
    }
    
    public void SafeAuthenticationFilter.setTokenParameter(String tokenParameter) {
        this.tokenParameter = tokenParameter;
    }
    
    @Override
    public Authentication SafeAuthenticationFilter.attemptAuthentication(HttpServletRequest request, HttpServletResponse response) throws AuthenticationException {
        if (postOnly && !request.getMethod().equals("POST")) {
            throw new AuthenticationServiceException("Authentication method not supported: " + request.getMethod());
        }
        String username = obtainUsername(request);
        String password = obtainPassword(request);
        String token = obtainToken(request);
        if (username == null) {
            username = "";
        }
         if (password == null) {
            password = "";
        }
         if (token == null){
            token = "";
        }
        username = username.trim();
        String userToken = username.concat("::").concat(token);
        UsernamePasswordAuthenticationToken authRequest = new UsernamePasswordAuthenticationToken(userToken, password);
        // Allow subclasses to set the "details" property
        setDetails(request, authRequest);
        return this.getAuthenticationManager().authenticate(authRequest);
    }
    
    public String SafeAuthenticationFilter.obtainToken(HttpServletRequest request) {
        return request.getParameter(tokenParameter);
    }
    
}
