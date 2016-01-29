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
package es.gva.dgti.gvgeoportal.web;

import org.gvnix.addon.geo.annotations.GvNIXGeoConversionService;
import org.springframework.core.convert.converter.Converter;
import org.springframework.format.FormatterRegistry;
import org.springframework.format.support.FormattingConversionServiceFactoryBean;
import org.springframework.roo.addon.web.mvc.controller.converter.RooConversionService;

import es.gva.dgti.gvgeoportal.domain.AgrupadorCapa;
import es.gva.dgti.gvgeoportal.domain.GeoPortal;
import es.gva.dgti.gvgeoportal.domain.SistemaCoordenadas;

/**
 * A central place to register application converters and formatters.
 */
@RooConversionService
@GvNIXGeoConversionService
public class ApplicationConversionServiceFactoryBean extends
        FormattingConversionServiceFactoryBean {

    @SuppressWarnings("deprecation")
    @Override
    protected void installFormatters(FormatterRegistry registry) {
        super.installFormatters(registry);
    }

    public Converter<SistemaCoordenadas, String> getSistemaCoordenadasToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<es.gva.dgti.gvgeoportal.domain.SistemaCoordenadas, java.lang.String>() {

            public String convert(SistemaCoordenadas sistemaCoordenadas) {
                return new StringBuilder().append(
                        sistemaCoordenadas.getNombre()).toString();
            }
        };
    }

    public Converter<AgrupadorCapa, String> getAgrupadorCapaToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<es.gva.dgti.gvgeoportal.domain.AgrupadorCapa, java.lang.String>() {

            public String convert(AgrupadorCapa agrupadorCapa) {
                return new StringBuilder().append(agrupadorCapa.getNombre())
                        .toString();
            }
        };
    }

    public Converter<GeoPortal, String> getGeoPortalToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<es.gva.dgti.gvgeoportal.domain.GeoPortal, java.lang.String>() {
            public String convert(GeoPortal geoPortal) {
                return new StringBuilder().append(geoPortal.getAuditCreation())
                        .append(' ').append(geoPortal.getAuditCreatedBy())
                        .append(' ').append(geoPortal.getAuditLastUpdate())
                        .append(' ').append(geoPortal.getAuditLastUpdatedBy())
                        .toString();
            }
        };
    }
}
