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
package es.gva.dgti.gvgeoportal.util;

import java.util.Map;
import java.util.Set;

import org.gvnix.web.datatables.util.QuerydslUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.core.convert.ConversionService;

import com.mysema.query.BooleanBuilder;
import com.mysema.query.types.path.PathBuilder;

/**
 * Class to create searchExpressions
 */
public class SearchUtils {

    private static final Logger LOGGER = LoggerFactory
            .getLogger(SearchUtils.class);

    // Used in unescapeDot method
    private static final String SEPARATOR_FIELDS = ".";
    private static final String SEPARATOR_FIELDS_ESCAPED = "_~~_";
    private static final String IS_NULL = "isNull";
    private static final String IS_NOT_NULL = "isNotNull";

    @SuppressWarnings("rawtypes")
    private static Map<Class, Set<String>> persistentTransientProperties;

    /**
     * Creates the searchExpression where the property is equal to the param of
     * the request. <br/>
     * <b>WARNING:</b> This method doesn't cares about
     * <em>locale transformation</em>. So If you are filter by dates or decimal
     * parameter value must use standard (English) format. If you need
     * locale-dependent transformation use
     * {@link #createPropertyExpression(BooleanBuilder, String, String, Map, PathBuilder, ConversionService)}
     * instead.
     *
     * @param searchExpression BooleanBuilder with the "where" of the query.
     * @param paramName Name of the param in the request.
     * @param propertyName Name of the property in the entity.
     * @param propertyClass Class of the property.
     * @param params Collection of params of the request.
     * @param entity Full path to entity and associations.
     * @param conversionService_dtt that handles conversion with all Converters.
     * @return searchExpression
     */
    public static BooleanBuilder createPropertyExpression(
            BooleanBuilder searchExpression, String paramName,
            String propertyName, Class<?> propertyClass,
            Map<String, String> params, PathBuilder<?> entity,
            ConversionService conversionService_dtt) {
        boolean enabled;
        Object searchObj = null;

        try {
            enabled = !params.get(paramName).isEmpty();
        }
        catch (Exception e) {
            enabled = false;
        }

        if (enabled) {
            searchObj = conversionService_dtt.convert(params.get(paramName),
                    propertyClass);

            searchExpression.and(QuerydslUtils.createObjectExpression(entity,
                    propertyName, searchObj, conversionService_dtt));
        }
        return searchExpression;
    }

}
