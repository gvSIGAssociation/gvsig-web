/*******************************************************************************
 * gvGeoportal is sponsored by the General Directorate for Information
 * Technologies (DGTI) of the Regional Ministry of Finance and Public
 * Administration of the Generalitat Valenciana (Valencian Community,
 * Spain), managed by gvSIG Association and led by DISID Corporation.
 *
 * Copyright (C) 2016 DGTI - Generalitat Valenciana
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Affero General Public License as
 * published by the Free Software Foundation, either version 3 of the
 * License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Affero General Public License for more details.
 *
 * You should have received a copy of the GNU Affero General Public License
 *  along with this program.  If not, see <http://www.gnu.org/licenses/>.
 ******************************************************************************/
package es.gva.dgti.gvgeoportal.service.domain;

import java.util.List;
import java.util.Map;

import javax.persistence.TypedQuery;
import javax.servlet.http.HttpServletRequest;

import org.springframework.roo.addon.layers.service.RooService;

import es.gva.dgti.gvgeoportal.domain.GeoPortal;
import es.gva.dgti.gvgeoportal.domain.enumerated.TipoComponente;

@RooService(domainTypes = { es.gva.dgti.gvgeoportal.domain.GeoPortal.class })
public interface GeoPortalService {

  /**
   * Metodo que dada un geoPortal te devuelve una copia del mismo
   *
   * @param geoPortal
   * @return
   */
  public GeoPortal clone(GeoPortal geoPortal);

  /**
   * Metodo que devuelve el listado de enums de tipoComponente seleccionado
   * durante la creacion/edicion
   *
   * @param httpServletRequest
   * @return Listado de string con los enum de componentes seleccionados
   */
  public List<TipoComponente> checkSelectedComponentes(HttpServletRequest httpServletRequest);

  /**
   * Método que busca geoportales por url.
   *
   * @param url url del geoportal a buscar.
   * @return {@Code TypedQuery<GeoPortal>}
   */
  public TypedQuery<GeoPortal> findGeoPortalesByUrlEquals(String url);

  /**
   * Método que busca geoportales por url que sean públicos.
   *
   * @param url url del geoportal a buscar.
   * @return {@Code TypedQuery<GeoPortal>}
   */
  public TypedQuery<GeoPortal> findPublicGeoPortalesByUrlEquals(String url);

  /**
   * Método que busca geoportales por url, ordenador por un campo en concreto
   * (sortFieldName) y en una dirección concreta (sorOrder).
   *
   * @param url url del geoportal a buscar.
   * @param sortFieldName campo por el que se quiere ordenar.
   * @param sortOrder dirección en la que se quiere ordenar (ASC/DESC).
   * @return {@Code TypedQuery<GeoPortal>}
   */
  public TypedQuery<GeoPortal> findGeoPortalesByUrlEquals(String url,
                                                          String sortFieldName,
                                                          String sortOrder);

  /**
   * Método que cuenta los geoportales dsiponibles para la url que se le pasa.
   *
   * @param url url del geoportal a buscar.
   * @return el número de geoportales encontrados para la url introducida.
   */
  public Long countFindGeoPortalesByUrlEquals(String url);

  /**
   * Método que obtiene en un map la información necesaria para visualizar un
   * geoportal (componentes, configuraciones, etc.)
   *
   * @param geoportal the {@code GeoPortal}
   * @return map con la información necesaria para visualizar un geoportal
   *         concreto.
   */
  public Map<String, Object> getComponentsAndInformationByGeoportal(GeoPortal geoportal);

  /**
   * Metodo que devuelve la url completa de un geoPortal. Para ello se le debe pasar la url relativa del portal y el resto de datos necesarios para
   * completar la url
   * @param url
   * @param scheme
   * @param serverName
   * @param port
   * @param contextPath
   * @return
   */
  public String getFullUrlPortal(String url, String scheme, String serverName, int port, String contextPath);
}
