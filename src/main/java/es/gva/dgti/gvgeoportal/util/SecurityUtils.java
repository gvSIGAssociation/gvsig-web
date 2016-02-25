package es.gva.dgti.gvgeoportal.util;

import org.springframework.security.core.context.SecurityContextHolder;

import es.gva.dgti.gvgeoportal.security.SafeUser;

/**
 * Métodos de utilidad relacionados con el sistema de autenticación.
 */
public class SecurityUtils {

  /**
   * Obtiene la autenticación actual.
   *
   * @return lo detalles de la autenticación actual.
   */
  public static SafeUser getCurrentAuthentication() {
    return (SafeUser) SecurityContextHolder.getContext()
        .getAuthentication().getPrincipal();
  }

}
