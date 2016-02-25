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
package es.gva.dgti.gvgeoportal.web.menu;

import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

/**
 * gvNIX menu render strategy.
 * <p>
 * Defines how to render the items of one menu depending on current context,
 * i.e. context could be the current page, or press mouse right button.
 * <p>
 * The basic idea is that the menu structure is unique for one application, but
 * you can decide which part must be shown depending on the given context.
 */
public interface ContextMenuStrategy {

    /**
     * Strategy's Name. Should be bean's id (or name).
     *
     * @return
     */
    public String getName();

    /**
     * Query for {@link MenuItem} to show in a context menu
     *
     *
     * @param request Current request
     * @param jspContext Current jspContext
     * @param menu {@link Menu} instance to use
     * @return {@link List} of {@link MenuItem} to show or <code>null</code> if
     *         no match found
     */
    public List<MenuItem> query(HttpServletRequest request,
            ServletContext jspContext, Menu menu);
}
