// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package es.gva.dgti.gvgeoportal.security;

import es.gva.dgti.gvgeoportal.security.PasswordHandler;
import java.io.IOException;
import javax.security.auth.callback.Callback;
import javax.security.auth.callback.UnsupportedCallbackException;
import org.apache.ws.security.WSPasswordCallback;

privileged aspect PasswordHandler_Roo_GvNIXPasswordHandlerSAFE {
    
    private String PasswordHandler.password;
    
    public void PasswordHandler.handle(Callback[] callbacks) throws UnsupportedCallbackException, IOException {
        for(Callback callback: callbacks) {
            WSPasswordCallback pwdCallback = (WSPasswordCallback)callback;
            int usage = pwdCallback.getUsage();
            if (usage == WSPasswordCallback.SIGNATURE || usage == WSPasswordCallback.DECRYPT) {
                pwdCallback.setPassword(password);
            }
        }
    }
    
    public void PasswordHandler.setPassword(String password) {
        this.password = password;
    }
    
}
