// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package es.gva.dgti.gvgeoportal.domain.components;

import es.gva.dgti.gvgeoportal.domain.components.ConfMiniMapa;
import org.apache.commons.lang3.builder.ReflectionToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

privileged aspect ConfMiniMapa_Roo_ToString {
    
    public String ConfMiniMapa.toString() {
        return ReflectionToStringBuilder.toString(this, ToStringStyle.SHORT_PREFIX_STYLE);
    }
    
}
